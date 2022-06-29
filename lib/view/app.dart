import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:untitled5/view/home.dart';
import 'package:untitled5/view/setting.dart';
import 'package:untitled5/view/transition.dart';

import '../main.dart';


class app extends StatefulWidget {
  const app({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<app> {
  int currentIndex = 0;
  final taps = [
    Home(),
    Transition(),
    Setting(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: taps[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: currentIndex==1?Colors.blueAccent:Colors.white,
        unselectedFontSize: 12,
        selectedFontSize: 12,
        selectedItemColor: currentIndex==1?Colors.white:Colors.black87,
        currentIndex: currentIndex,
         type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.home,color: Colors.black,),
              icon: Icon(Icons.home),
              label: ('Home'),
              backgroundColor: Colors.black87
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.import_export),
              label: ('Transaction'),
              backgroundColor: Colors.black87,
              activeIcon: Icon(Icons.import_export,color: Colors.white,),
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: ('Settings'),
            backgroundColor: Colors.black87,
            activeIcon: Icon(Icons.settings,color: Colors.black,),
          ),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;

          });
        },
      ),

    );
  }

}