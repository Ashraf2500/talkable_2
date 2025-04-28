
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:talkable_2/core/utils/assets_manager.dart';

class educationScreen extends StatelessWidget {
  final List imgList = [ AssetsManager.logoPhoto,
    AssetsManager.privateSession,
    AssetsManager.translation,
    AssetsManager.learning ];
  @override Widget build(BuildContext context) {
    return Scaffold(
        body:
        SingleChildScrollView( child: Column( children: [  Stack( children: [ CarouselSlider(
        options: CarouselOptions( height: 300, autoPlay: true, enlargeCenterPage: true, viewportFraction: 1.0, ),
          items: imgList.map((item) => Container(
            child: Center( child: Image.network(item, fit: BoxFit.cover, width: 1000), ), )).toList(), ),
      //Container( width: double.infinity, height: 300, color: Colors.black.withOpacity(0.5), ),
      // Positioned( left: 16, bottom: 16, child: Column( crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [ Text( 'FalleUrafi of an Vectcaitulition', style: TextStyle( color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold, ), ), SizedBox(height: 8),
      //     Text( 'The only to and more scientific science on the seacoast materials for factories',
      //       style: TextStyle( color: Colors.white, fontSize: 16, ), ), SizedBox(height: 16),
      //     ElevatedButton( onPressed: () {}, style: ElevatedButton.styleFrom( primary: Colors.red, ),
      //       child: Text('GET VERY NOW'), ), ], )
       // , ),
        ], ),
    Padding( padding: const EdgeInsets.all(16.0),
      child: Column( crossAxisAlignment: CrossAxisAlignment.start,
        children: [ Text( 'Learning videos', style: TextStyle( fontSize: 24, fontWeight: FontWeight.bold, ), ),
          SizedBox(height: 16),
          GridView.count( crossAxisCount: 2, shrinkWrap: true, physics: NeverScrollableScrollPhysics(), crossAxisSpacing: 16, mainAxisSpacing: 16,
            children: [
              VideoCard( imageUrl: AssetsManager.privateSession, title: 'Jentame Beginting', details: 'no.1',),
              VideoCard( imageUrl: AssetsManager.privateSession, title: 'Jarkat Meaksmans Friciseing', details: 'no.2', ),
              VideoCard( imageUrl: AssetsManager.privateSession, title: 'Jartny Wrik Legvinting', details: 'no.3', ),
              VideoCard( imageUrl: AssetsManager.privateSession, title: 'Jartny Wrik Legvinting', details: 'no.4', ),
              VideoCard( imageUrl: AssetsManager.privateSession, title: 'Jartny Wrik Legvinting', details: 'no.5', ),
              VideoCard( imageUrl: AssetsManager.privateSession, title: 'Jartny Wrik Legvinting', details: 'no.6', ),




            ], ), ], ), ), ], ), ), ); } }
class VideoCard extends StatelessWidget {
  final String imageUrl; final String title; final String details;
  VideoCard({ required this.imageUrl, required this.title, required this.details, });
  @override Widget build(BuildContext context) {
    return Card( elevation: 4, shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(8), ),
        child: Column( crossAxisAlignment: CrossAxisAlignment.start,
            children: [ ClipRRect( borderRadius: BorderRadius.vertical(top: Radius.circular(8))
      , child: Image.network( imageUrl, width: double.infinity, height: 120, fit: BoxFit.cover, ), ),
              Padding( padding: const EdgeInsets.all(8.0),
                child: Column( crossAxisAlignment: CrossAxisAlignment.start,
                  children: [ Text( title, style: TextStyle( fontSize: 16, fontWeight: FontWeight.bold, ), ),
 SizedBox(height: 4), Text( details, style: TextStyle( color: Colors.grey, ), ), ], ), ), ], ), ); } }