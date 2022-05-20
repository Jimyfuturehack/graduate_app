import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class forgotpass extends StatefulWidget {
  const forgotpass({Key? key}) : super(key: key);

  @override
  _forgotpassState createState() => _forgotpassState();
}

class _forgotpassState extends State<forgotpass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: GestureDetector(
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.blueAccent,
                      Colors.blue,
                      Colors.lightBlueAccent
                    ],
                  ),
                ),
                child: Transform.translate(
                  offset: Offset(0, -30),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        forgotpassword(),
                      ],
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
  Widget forgotpassword(){
    return Container(
      alignment: Alignment.centerLeft,
      height: 50,
      width: 300,
      decoration: BoxDecoration(
        color: Color(0xffebefff),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            offset: Offset(3,3),
          ),
        ],


      ),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(

          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 13,left: 5),
          hintStyle: TextStyle(color: Colors.grey,),

        ),
      ),
    );
  }
}