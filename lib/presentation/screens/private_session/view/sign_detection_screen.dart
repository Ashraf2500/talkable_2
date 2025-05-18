import 'dart:async';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:talkable_2/core/utils/colors_manager.dart';
import 'package:talkable_2/core/utils/strings_manager.dart';
import 'package:talkable_2/presentation/screens/private_session/manager/sign_detection_cubit.dart';

class SignDetectionScreen extends StatefulWidget {
  @override
  _SignDetectionScreenState createState() => _SignDetectionScreenState();
}

class _SignDetectionScreenState extends State<SignDetectionScreen> {
  CameraController? _cameraController;
  late List<CameraDescription> _cameras;
  late IO.Socket socket;
  bool isStreaming = false;
  Timer? _frameTimer;
  String selectedLanguage = 'en';
  String accumulatedText = '';
  CameraLensDirection selectedCameraDirection = CameraLensDirection.front;

  @override
  void initState() {
    super.initState();
    _initializePermissionsAndCamera();
    _initSocket();
  }

  Future<void> _initializePermissionsAndCamera() async {
    await Permission.camera.request();
    await Permission.microphone.request();
    _cameras = await availableCameras();
    await _initCamera();
  }

  Future<void> _initCamera() async {
    final camera = _cameras.firstWhere(
          (cam) => cam.lensDirection == selectedCameraDirection,
      orElse: () => _cameras.first,
    );

    _cameraController = CameraController(
      camera,
      ResolutionPreset.medium,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );

    await _cameraController!.initialize();
    if (mounted) setState(() {});
  }

  void _switchCamera() async {
    setState(() {
      selectedCameraDirection = selectedCameraDirection == CameraLensDirection.front
          ? CameraLensDirection.back
          : CameraLensDirection.front;
    });
    await _initCamera();
  }

  void _initSocket() {
    socket = IO.io('${StringsManager.baseUrl}', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });

    socket.connect();

    socket.on('connect', (_) {
      print('Connected to server ✅');
    });

    socket.on('recognized_text', (data) {
      String text = data['text'] ?? '';
      context.read<SignDetectionCubit>().updateText(text);

      if (text.toLowerCase() == 'unknown') return;

      setState(() {
        accumulatedText += text;
      });
    });

    socket.on('error', (data) {
      print('Error from server: $data');
    });
  }

  void _startStreaming() {
    if (_cameraController == null || !_cameraController!.value.isInitialized) return;

    isStreaming = true;
    _frameTimer = Timer.periodic(Duration(milliseconds: 800), (_) async {
      try {
        final XFile file = await _cameraController!.takePicture();
        final bytes = await file.readAsBytes();
        socket.emit('video_frame', {
          'frame': bytes,
          'language': selectedLanguage,
        });
      } catch (e) {
        print('Frame error: $e');
      }
    });

    setState(() {});
  }

  void _stopStreaming() {
    isStreaming = false;
    _frameTimer?.cancel();
    _frameTimer = null;
    setState(() {});
  }

  @override
  void dispose() {
    _stopStreaming();
    _cameraController?.dispose();
    socket.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isCameraReady = _cameraController != null && _cameraController!.value.isInitialized;

    return Scaffold(
      appBar: AppBar(title: Text('Sign Detection')),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: SizedBox(
              width: double.infinity,
              child: isStreaming && isCameraReady
                  ? CameraPreview(_cameraController!)
                  : Container(
                color: Colors.grey[300],
                child: Center(
                  child: Icon(Icons.camera_alt, size: 80, color: Colors.black54),
                ),
              ),
            ),
          ),


          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: BlocBuilder<SignDetectionCubit, SignDetectionState>(
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          (isStreaming)?IconButton(
                            icon: Icon(Icons.cameraswitch,color: ColorsManager.b1,),
                            onPressed: _switchCamera,
                            tooltip: 'Switch Camera',
                          ):SizedBox(),
                          ElevatedButton(
                            onPressed: isStreaming ? _stopStreaming : _startStreaming,
                            style: ElevatedButton.styleFrom(backgroundColor: ColorsManager.b2),
                            child: Text(isStreaming ? 'Stop' : 'Start',style: TextStyle(color: ColorsManager.White),),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Language: ', style: TextStyle(fontSize: 16)),
                          SizedBox(width: 10),
                          DropdownButton<String>(
                            value: selectedLanguage,
                            items: [
                              DropdownMenuItem(value: 'en', child: Text('English')),
                              DropdownMenuItem(value: 'ar', child: Text('Arabic')),
                            ],
                            onChanged: (value) {
                              setState(() {
                                selectedLanguage = value!;
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 10),


                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Detected Letter',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          SizedBox(height: 8),
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              state.recognizedText,
                              style: TextStyle(fontSize: 24, color: Colors.blue),
                              textAlign: TextAlign.start,
                              softWrap: true,
                              overflow: TextOverflow.visible,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Output',
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    accumulatedText = '';
                                  });
                                },
                                style: ElevatedButton.styleFrom(backgroundColor: ColorsManager.b2),
                                child: Text('Remove',style: TextStyle(color: ColorsManager.White),),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              accumulatedText,
                              style: TextStyle(fontSize: 16, color: Colors.black),
                              textAlign: TextAlign.start,
                              softWrap: true,
                              overflow: TextOverflow.visible,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 10),

                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
