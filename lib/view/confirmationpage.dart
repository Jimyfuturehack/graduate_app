import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_initicon/flutter_initicon.dart';
import 'package:page_transition/page_transition.dart';
import 'package:untitled5/view/requestmoney.dart';

import '../model_view/datatransaction.dart';
import 'app.dart';

class Confirm extends StatefulWidget {
  const Confirm({Key? key,required this.name,required this.photo,required this.number,required this.amount}) : super(key: key);
  final String name;
   final Uint8List? photo;
  final String number;
  final String amount;
  @override
  State<Confirm> createState() => _ConfirmState();
}

class _ConfirmState extends State<Confirm> {
  @override
  Widget build(BuildContext context) {
  var  height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
        color: Colors.black,),
        elevation: 0,),
      body:Container(
        width: double.infinity,
        height: height,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height:10,),
            (widget.photo==null)?Initicon(text: widget.name,size: 100,):CircleAvatar(backgroundImage: MemoryImage(widget.photo!),radius: 50,),
            SizedBox(height: 10,),
            Text("${widget.name}",style: TextStyle(fontSize: 22),),
            SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("Payment to",style: TextStyle(color: Colors.black45),),SizedBox(width: 5,),Text("@${widget.number}",style: TextStyle(color: Colors.blue),)],
            ),
            SizedBox(height:130,),
            Text("EGP ${widget.amount}",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
           SizedBox(height: 150,),
            Container(
              width: 350,
              height: 60,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                contentPadding:EdgeInsets.only(left: 20) ,
                title: Text("EGP 0"),
                subtitle: Text("Balance"),
                leading: Icon(Icons.home_filled),
              ),
            ),
            SizedBox(height: 15,),
            Container(
              width: 350,
              height: 50,
              child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                          ),
                      )
                  ),
                onPressed: () async{
                    var confirmed = await dataTransaction(widget.name,widget.amount,widget.photo!);
                  if(confirmed!=null) {
                    Navigator.pushReplacement(context,
                        PageTransition(
                            type: PageTransitionType.bottomToTop,
                            child: app()));
                  }else{

                  }
                },
                child: Text("Confirm",style: TextStyle(color: Colors.white,letterSpacing: 1,fontSize: 16),),
              ),
            )
          ],
        ),
      )
    );
  }
}
