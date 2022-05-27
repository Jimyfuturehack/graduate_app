import 'package:flutter/material.dart';
import 'package:untitled5/view/home.dart';
import 'package:untitled5/view/setting.dart';
import 'package:untitled5/view/transition.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: taps[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: ('Home'),
              backgroundColor: Colors.black87
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.import_export),
              label: ('Transaction'),
              backgroundColor: Colors.black87
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: ('Settings'),
            backgroundColor: Colors.black87,
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