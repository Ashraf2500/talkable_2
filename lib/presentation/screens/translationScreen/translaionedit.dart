import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talkable_2/presentation/screens/translationScreen/translate_manager/translate_manager_cubit.dart';
import 'package:talkable_2/presentation/screens/translationScreen/video_player_widget.dart';
import '../../../core/utils/colors_manager.dart';

import 'Translate_model/Sign_video.dart';

class HomePage2 extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage2> {
  String selectedLang = 'ar';
  final textController = TextEditingController();

  int currentVideoIndex = 0;
  List<SignVideo> videos = [];

  void playNextVideo() {
    if (currentVideoIndex < videos.length - 1) {
      setState(() {
        currentVideoIndex++;
      });
    } else {
      print("All videos played");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            /// Dropdown + Icon
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.swap_horiz, color: ColorsManager.b1),
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
            SizedBox(height: 20),

            /// Input
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
            ),
            SizedBox(height: 20),

            /// Button
            ElevatedButton(
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
              child: Text('Translate', style: TextStyle(fontSize: 24)),
            ),
            SizedBox(height: 20),

            /// BlocBuilder
            Expanded(
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
                            key: ValueKey(currentVideo.video), // مهم جدًا علشان يعيد بناء الفيديو كل مرة
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
          ],
        ),
      ),
    );
  }
}



/*
     bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: TextStyle(fontSize: 22),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        backgroundColor: ColorsManager.b2,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view, color: Colors.white),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone, color: Colors.white),
            label: 'Contact Us',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications, color: Colors.white),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.white),
            label: 'Profile',
          ),
        ],
      ),
      */
