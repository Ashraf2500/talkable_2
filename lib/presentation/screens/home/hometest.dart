import 'package:flutter/material.dart';



class ServicesPage extends StatelessWidget {
  @override Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( backgroundColor: Colors.white, elevation: 0, leading: Icon(Icons.arrow_back, color: Colors.grey[700]),
        actions: [
          Row(
            children: [
              Icon(Icons.phone, color: Colors.white, size: 20), SizedBox(width: 4),
            Text( '09:21', style: TextStyle(color: Colors.blue[600]), ), SizedBox(width: 16), ], ), ], ),
        body: SingleChildScrollView(
          child:
          Column(
            children: [
              Padding( padding: const EdgeInsets.all(16.0),
                child: Align( alignment: Alignment.centerLeft,
                child: Text( 'Services', style: TextStyle( fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue[800], ), ), ), ),
              ServiceCard( color: Colors.cyan, title: 'Emergency Services', imageUrl: 'https://storage.googleapis.com/a1aa/image/mNZn5fCyVyRGcSdwIM2yd7f6UrVzrqnHfvB3XZkCCFhyJT4nA.jpg', ),
              ServiceCard( color: Colors.yellow, title: 'Simultaneous translation service', imageUrl: 'https://storage.googleapis.com/a1aa/image/lIqYuiEOCNZUA5tvNNOalfzU6UcEIrJbrNZHmesulHJ1kJ8TA.jpg', ),
              ServiceCard( color: Colors.teal, title: 'online services', imageUrl: 'https://storage.googleapis.com/a1aa/image/eKSdxstFyTxgOiVWykdKM7kwnXKMuX9tHg3yAG3ZtBHbyEeTA.jpg', ), ], ), ),
      bottomNavigationBar: BottomNavigationBar( type: BottomNavigationBarType.fixed, items: [ BottomNavigationBarItem( icon: Icon(Icons.grid_view, color: Colors.blue[800]), label: 'Categories', ), BottomNavigationBarItem( icon: Icon(Icons.phone, color: Colors.grey[600]), label: 'Call Log', ), BottomNavigationBarItem( icon: Icon(Icons.notifications, color: Colors.grey[600]), label: 'Notification', ),
  BottomNavigationBarItem( icon: Icon(Icons.person, color: Colors.grey[600]), label: 'Profile', ), ], ), ); } }
class ServiceCard extends StatelessWidget { final Color color; final String title; final String imageUrl;
  ServiceCard({required this.color, required this.title, required this.imageUrl});
  @override Widget build(BuildContext context)
  { return Padding(
    padding:
    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    child: Container(
      decoration: BoxDecoration( color: color, borderRadius: BorderRadius.circular(8.0), ),
       child: Padding( padding: const EdgeInsets.all(16.0),
         child: Row( children: [
           Expanded(child: Text( title, style: TextStyle( color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold, ), ), ),
           Image.network( imageUrl, width: 100, height: 100, ), ], ), ), ), ); } }