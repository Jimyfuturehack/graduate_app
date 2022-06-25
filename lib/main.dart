import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:untitled5/model/notificationApi.dart';
import 'package:untitled5/view/onBording.dart';
import 'package:untitled5/view/signin.dart';
import 'package:shared_preferences/shared_preferences.dart';
main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final prefs = await SharedPreferences.getInstance();
  bool? seen = prefs.getBool("seen");
  Widget _screen;
  if (seen ==null|| seen==true){
    _screen = onBoarding();
  }else{
    _screen = SignIn();
  }

  runApp(NewsApp(_screen));
}
class NewsApp extends StatelessWidget {
  final Widget _screen;
  NewsApp(this._screen);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: this._screen,
    );
  }
}
