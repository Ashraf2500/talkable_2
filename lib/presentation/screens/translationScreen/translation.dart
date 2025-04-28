import 'package:flutter/material.dart';

import '../../../core/utils/colors_manager.dart';

// class HomePage extends StatelessWidget {
//   @override Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Color(0xFFF5F3FF),
//     body:
//     Column(
//     children: [
//        Padding( padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           // CircleAvatar(
//           //   radius: 24,
//           //   backgroundColor: Color(0xFF4FD1C5),
//           //   // child: Icon(
//           //   //     Icons.volume_up,
//           //   //     color: Colors.white
//           //   // ),
//           // ),
//           Text( 'ادخل النص !', style: TextStyle(
//             color: Color(0xFF4FD1C5),
//             fontSize: 24,
//           ),
//           ),
//           // Icon(
//           //     Icons.star,
//           //     color: Color(0xFF4FD1C5),
//           //     size: 32),
//         ], ), ),
//      Expanded(
//      child: Center(
//      child: Text(''), ), ),
//      Container(
//        decoration: BoxDecoration(
//          color: Color(0xFF4FD1C5),
//          borderRadius: BorderRadius.vertical(top: Radius.circular(30)), ),
//        child: Padding( padding: const EdgeInsets.all(16.0),
//          child: Column(
//            mainAxisSize: MainAxisSize.min,
//            children: [
//              Row(
//                mainAxisAlignment: MainAxisAlignment.spaceAround,
//                children: [
//                  ElevatedButton(
//                    style: ElevatedButton.styleFrom( primary: Colors.white, onPrimary: Color(0xFF4FD1C5),
//                      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(10), ), ),
//                    onPressed: () {},
//                    child: Row(
//                      children: [ Text('من عربي الي اشاره'),
//                        SizedBox(width: 8), Icon(Icons.swap_horiz), ], ), ),
//                  Container(
//                    decoration: BoxDecoration( gradient: LinearGradient( colors: [Color(0xFF4FD1C5), Color(0xFF805AD5)], ),
//                      borderRadius: BorderRadius.circular(10), ),
//                    child: ElevatedButton( style: ElevatedButton.styleFrom( primary: Colors.transparent, shadowColor: Colors.transparent, onPrimary: Colors.white,
//                      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(10), ), ),
//                      onPressed: () {},
//                      child: Row(
//                        children: [
//                          Text('لغه اشاره الي عربي'),
//                          SizedBox(width: 8), Icon(Icons.swap_horiz), ], ), ), ), ], ),
//                           SizedBox(height: 16),
//            ], ), ), ), ], ),
//
//       bottomNavigationBar: BottomNavigationBar(
//
//         backgroundColor: ColorsManager.BlueSky,
//         type: BottomNavigationBarType.fixed,
//         items: [ BottomNavigationBarItem( icon: Icon(Icons.grid_view, color: Colors.blue[800] ), label: 'Home', ),
//           BottomNavigationBarItem( icon: Icon(Icons.phone, color: Colors.grey[600]), label: 'Contact Us', ),
//           BottomNavigationBarItem( icon: Icon(Icons.notifications, color: Colors.grey[600]), label: 'Notification', ),
//           BottomNavigationBarItem( icon: Icon(Icons.person, color: Colors.grey[600]), label: 'Profile',
//           ), ], ),
//     );
//   }
// }


class HomePage extends StatelessWidget {
  @override Widget build(BuildContext context) {
    return Scaffold(
      body:
      Container( child: Padding( padding: const EdgeInsets.all(16.0),
        child: Column( mainAxisAlignment: MainAxisAlignment.start,
          children: [ Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DropdownButton( value: 'English' , dropdownColor: ColorsManager.b3, items: ['English','sign Language'] .map((String value) {
              return DropdownMenuItem( value: value, child: Text( value, style: TextStyle(color: ColorsManager.b1 , fontSize: 22), ), ); }).toList(),
              onChanged: (String? newValue) {}, icon: Icon(Icons.arrow_drop_down, color: ColorsManager.b1), ),
              Icon(Icons.swap_horiz, color: ColorsManager.b1),
              DropdownButton( value: 'Sign Language', dropdownColor:ColorsManager.b3, items: ['Sign Language','English'] .map((String value) {
                return DropdownMenuItem( value: value,
                  child: Text( value, style: TextStyle(color: ColorsManager.b1 ,  fontSize: 22), ), ); }).toList(), onChanged: (String? newValue) {},
                icon: Icon(Icons.arrow_drop_down, color: ColorsManager.b1), ), ], ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration( color:ColorsManager.b3, borderRadius: BorderRadius.circular(8), ),
              child: Stack(
                children: [
                  TextField( maxLines: 4, style: TextStyle(fontSize: 24, color: Colors.grey[300]),
                    decoration: InputDecoration( hintText: 'Enter text', hintStyle: TextStyle(color: Colors.grey[300]), border: InputBorder.none, ), ),
                  Positioned( bottom: 8, right: 8, child: Icon(Icons.camera_alt, color: Colors.grey[400]), ), ], ), ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(16), decoration: BoxDecoration( color: ColorsManager.b1, borderRadius: BorderRadius.circular(8), ),
  child: Text( 'Translation', style: TextStyle(fontSize: 24, color: Colors.grey[300]), ), ), ], ),
      ), ),

      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: TextStyle(fontSize: 22),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        backgroundColor: ColorsManager.b2,
        type: BottomNavigationBarType.fixed,
        items: [ BottomNavigationBarItem( icon: Icon(Icons.grid_view, color: Colors.white), label: 'Home', ),
          BottomNavigationBarItem( icon: Icon(Icons.phone, color: Colors.white), label: 'Contact Us', ),
          BottomNavigationBarItem( icon: Icon(Icons.notifications, color: Colors.white), label: 'Notification', ),
          BottomNavigationBarItem( icon: Icon(Icons.person, color: Colors.white), label: 'Profile',
          ), ], ),

    ); } }