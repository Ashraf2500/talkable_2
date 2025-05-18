import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talkable_2/core/utils/colors_manager.dart';
import 'package:talkable_2/presentation/screens/translationScreen/translation_screen_manager/translate_manager/translate_manager_cubit.dart';
import 'package:talkable_2/presentation/screens/translationScreen/translation_screen_manager/translate_sign_to_lang/translate_sign_to_lang_cubit.dart';
import 'package:talkable_2/presentation/screens/translationScreen/video_player_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'Translate_model/Sign_video.dart';
import 'package:video_player/video_player.dart';
import 'dart:io';


class HomePage2 extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage2> {
  bool fromWritingToSign = true;

  String selectedLang = 'ar';
  final textController = TextEditingController();

  int currentVideoIndex = 0;
  List<SignVideo> videos = [];

  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  void playNextVideo() {
    if (currentVideoIndex < videos.length - 1) {
      setState(() {
        currentVideoIndex++;
      });
    } else {
      print("All videos played");
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    final picked = await _picker.pickImage(source: source);
    if (picked != null) {
      setState(() {
        _selectedImage = File(picked.path);
      });

      context.read<DetectSignCubit>().detectSignImage(
        imageFile: _selectedImage!,
        language: selectedLang,
      );
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Translation')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Icon(fromWritingToSign?Icons.library_books_rounded:Icons.sign_language_outlined, color: ColorsManager.b1),
                    Text("writing",style: TextStyle( color: ColorsManager.b1,fontSize: 12,fontWeight: FontWeight.bold),),
                  ],
                ),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      fromWritingToSign = ! fromWritingToSign ;
                    });
                  },
                  child: Icon(Icons.swap_horiz, color: ColorsManager.b1),
                ),
                Column(
                  children: [
                    Icon(fromWritingToSign?Icons.sign_language_outlined:Icons.library_books_rounded, color: ColorsManager.b1),
                    Text("Sign Language",style: TextStyle( color: ColorsManager.b1,fontSize: 12,fontWeight: FontWeight.bold),),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Language : ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                DropdownButton<String>(
                  value: selectedLang,
                  items: ['ar', 'en']
                      .map((lang) => DropdownMenuItem(
                    value: lang,
                    child: Text(lang.toUpperCase()),
                  ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedLang = value!;
                    });
                  },
                ),
              ],
            ),
            fromWritingToSign?
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: ColorsManager.b3,
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                controller: textController,
                maxLines: 4,
                style: TextStyle(fontSize: 24, color: Colors.black),
                decoration: InputDecoration(
                  hintText: 'Enter text',
                  hintStyle: TextStyle(color: Colors.grey[300]),
                  border: InputBorder.none,
                ),
              ),
            )
                : (_selectedImage != null)?Image.file(_selectedImage!,width: MediaQuery.of(context).size.width*0.7 ,height: MediaQuery.of(context).size.height /3.9,fit: BoxFit.fill,)
                :Icon(Icons.photo_size_select_actual_rounded,color: ColorsManager.b3,size: 200,),

            const SizedBox(height: 10),
            fromWritingToSign?ElevatedButton(
              onPressed: () {
                setState(() {
                  currentVideoIndex = 0;
                  videos = [];
                });
                context.read<TranslateManagerCubit>().translateText(
                  language: selectedLang,
                  text: textController.text.trim(),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                backgroundColor: ColorsManager.b1,
              ),
              child: Text('Translate', style: TextStyle(color: ColorsManager.White,fontSize: 24)),
            ):Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  icon:  Icon(Icons.camera,color: ColorsManager.b1,),
                  label:  Text("Camera",style: TextStyle(color: ColorsManager.b1),),
                  onPressed: () => _pickImage(ImageSource.camera),
                ),
                const SizedBox(width: 20),
                ElevatedButton.icon(
                  icon:  Icon(Icons.photo,color: ColorsManager.b1,),
                  label:  Text("Gallery",style: TextStyle(color: ColorsManager.b1)),
                  onPressed: () => _pickImage(ImageSource.gallery),
                ),
              ],
            ),
            const SizedBox(height: 15),
            fromWritingToSign
                ?Expanded(
              child: BlocBuilder<TranslateManagerCubit, TranslateManagerState>(
                builder: (context, state) {
                  if (state is TranslateLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is TranslateError) {
                    return Center(child: Text(state.message));
                  } else if (state is TranslateSuccess) {
                    videos = state.signVideos;

                    if (videos.isEmpty) return Center(child: Text("No videos"));

                    final currentVideo = videos[currentVideoIndex];

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Character: ${currentVideo.character}',
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(height: 12),
                        Expanded(
                          child: VideoPlayerWidget(
                            key: ValueKey(currentVideo.video),
                            videoUrl: currentVideo.video,
                            onVideoEnded: playNextVideo,
                          ),
                        ),
                      ],
                    );
                  }
                  return Container();
                },
              ),
            )
                :BlocBuilder<DetectSignCubit, DetectSignState>(
              builder: (context, state) {
                if (state is DetectSignLoading) {
                  return const CircularProgressIndicator();
                } else if (state is DetectSignSuccess) {
                  return Column(
                    children: [
                      Text("Result: ${state.gesture}", style: const TextStyle(fontSize: 20)),
                      const SizedBox(height: 15),
                      if (state.videoUrl != null)
                        SizedBox(
                          width: MediaQuery.of(context).size.width*0.7,
                          height: MediaQuery.of(context).size.height / 3.9,
                          child: _SignVideoPlayer(videoUrl: state.videoUrl!),
                        ),
                    ],
                  );
                } else if (state is DetectSignError) {
                  return Text("error : ${state.error} : try again", style: const TextStyle(color: Colors.red));
                }
                return const Text("Select an image to learn sign language.",style: TextStyle(color: ColorsManager.b1));
              },
            ),



          ],
        ),
      ),
    );
  }
}

class _SignVideoPlayer extends StatefulWidget {
  final String videoUrl;

  const _SignVideoPlayer({Key? key, required this.videoUrl}) : super(key: key);

  @override
  State<_SignVideoPlayer> createState() => _SignVideoPlayerState();
}

class _SignVideoPlayerState extends State<_SignVideoPlayer> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {
          _isInitialized = true;
        });
        _controller.play();
      });

    _controller.addListener(() {
      if (_controller.value.position >= _controller.value.duration) {

        _controller.seekTo(Duration.zero);
        _controller.play();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }

    return AspectRatio(
      aspectRatio: _controller.value.aspectRatio,
      child: VideoPlayer(_controller),
    );
  }
}
