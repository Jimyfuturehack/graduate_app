import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:page_transition/page_transition.dart';
import 'package:untitled5/view/profile/main_page.dart';
import 'package:untitled5/view/sendmoney.dart';
import 'package:untitled5/view/requestmoney.dart';

class Transition extends StatefulWidget {
  const Transition({Key? key}) : super(key: key);

  @override
  State<Transition> createState() => _TransitionState();
}

class _TransitionState extends State<Transition> {
  var height;
  var data="";
  String text="";
   String egp="EGP";
  late String color="B9B7B7";
  colors(){
    setState(() {
      if(text.isEmpty){
        color="B9B7B7";
      }else{
        color="ffffff";
      }
    });
  }
  @override
  void initState(){
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
  }
  @override
  dispose(){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height-270;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(onPressed: (){

            Navigator.push(
                context,
                MaterialPageRoute(builder:(context){
                  return profile();
                })
            );

          }, icon: Icon(Icons.person,color: Colors.white,))
        ],
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            color: Colors.blueAccent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children:<Widget>[
                Transform.translate(
                  offset: Offset(0,50),
                  child: Column(
                    children:<Widget> [
                            NumPad(),
                            SizedBox(height: 40,),
                            Buttons(),
                    ],
                  ),
                ),
              ]
            ),
          ),
        ),
      ));
  }
  Future <void>scanQr()async{
    try{
      FlutterBarcodeScanner.scanBarcode('#2A99CF', 'cancel', true, ScanMode.QR).then((value){
        setState(() {
          data=value;
        });
        return data;
      });
    }catch(e){
      setState(() {
        data='unable to read this';
      });
    }
  }
  Widget NumPad(){
    return Column(
      children:<Widget> [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(egp,style:TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: HexColor("$color"),

              )),
            ),
            SizedBox(width: 10,),
            Container(
              child: Text(text,style:TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white

              )),
            ),

          ],
        ),
        SizedBox(height: 90,),
        Container(
          width: 300,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:<Widget> [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                ),
                child: TextButton(
                  onPressed: (){
                    setState(() {

                      if(text.length==5){
                        return null;
                      }else{
                        text+="1";
                      }
                      colors();

                    });
                  }, child: Text("1",style: TextStyle(fontSize: 22,color: Colors.white),),
                ),
              ),

              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                ),
                child: TextButton(
                  onPressed: (){
                    setState(() {
                      if(text.length==5){
                        return null;
                      }else{
                        text+="2";
                      }
                      colors();
                    });
                  }, child: Text("2",style: TextStyle(fontSize: 22,color: Colors.white),),
                ),
              ),
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                ),
                child: TextButton(
                  onPressed: (){

                    setState(() {
                      if(text.length==5){
                        return null;
                      }else{
                        text+="3";
                      }
                      colors();
                    });

                  }, child: Text("3",style: TextStyle(fontSize: 22,color: Colors.white),),

                ),
              )
            ],
          ),
        ),
        SizedBox(height: 15,),
        Container(
          width: 300,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:<Widget> [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                ),
                child: TextButton(
                  onPressed: (){
                    setState(() {
                      if(text.length==5){
                        return null;
                      }else{
                        text+="4";
                      }
                      colors();
                    });
                  }, child: Text("4",style: TextStyle(fontSize: 22,color: Colors.white),),
                ),
              ),
              Container(
                width: 60,
                height: 60,
                decoration:BoxDecoration(
                  borderRadius:BorderRadius.circular(60),
                ),
                child: TextButton(
                  onPressed: (){
                    setState(() {
                      if(text.length==5){
                        return null;
                      }else{
                        text+="5";
                      }
                      colors();
                    });
                  }, child:Text("5",style: TextStyle(fontSize: 22,color: Colors.white),),
                ),
              ),
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                ),
                child: TextButton(
                 // focusColor: Colors.black54,
                  onPressed: (){
                    setState(() {
                      if(text.length==5){
                        return null;
                      }else{
                        text+="6";
                      }
                      colors();
                    });
                  }, child: Text("6",style: TextStyle(fontSize: 22,color: Colors.white),),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 15,),
        Container(
          width: 300,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:<Widget> [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                ),
                child: TextButton(
                  onPressed: (){
                    setState(() {
                      if(text.length==5){
                        return null;
                      }else{
                        text+="7";
                      }
                      colors();
                    });
                  },child: Text("7",style: TextStyle(fontSize: 22,color: Colors.white),),
                ),
              ),
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                ),
                child: TextButton(
                  onPressed: (){
                    setState(() {
                      if(text.length==5){
                        return null;
                      }else{
                        text+="8";
                      }
                      colors();
                    });
                  }, child: Text("8",style: TextStyle(fontSize: 22,color: Colors.white),),
                ),
              ),
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                ),
                child: TextButton(
                  style: TextButton.styleFrom(
                 //   focusColor: Colors.black54,
                  ),
                  onPressed: (){
                    setState(() {
                      if(text.length==5){
                        return null;
                      }else{
                        text+="9";
                      }
                      colors();
                    });
                  }, child: Text("9",style: TextStyle(fontSize: 22,color: Colors.white),),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 15,),
        Container(
          width: 300,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:<Widget> [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                ),
                child: TextButton(
                  onPressed: ()async{
                   if(text.contains(".")||text.length==4){
                      return null;
                    }else if (text.isEmpty){
                      setState(() {
                        text+="0.";
                      });
                    }else{
                      setState(() {
                        text+=".";
                      });
                    }
                    colors();

                  }, child: Text(".",style: TextStyle(fontSize: 24,color: Colors.white),),
                ),
              ),
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                ),
                child: TextButton(
                  onPressed: (){
                    if(text.length==5||(text.contains(".")&&text.length==4)||(text.startsWith("0")&& text.length==1)){
                      return null;
                    }else if(text.isEmpty){
                      setState(() {
                        text+="0.";
                      });
                    }else {
                      setState(() {
                        text+="0";
                      });
                    }
                    colors();
                  }, child: Text("0",style: TextStyle(fontSize: 22,color: Colors.white),),
                ),
              ),
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                ),
                child: TextButton(
                 // focusNode: Colors.black54,
                  onPressed: (){
                    setState(() {
                      text = text.substring(0,text.length-1);
                      colors();
                    });
                  },
                  child: Icon(Icons.backspace,color: Colors.white,),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
  Widget Buttons(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children:<Widget> [
        Container(
          height: 50,
          width: 170,
          decoration: BoxDecoration(
              color: HexColor("be581a"),
            borderRadius: BorderRadius.circular(30)
          ),
          child: TextButton(
            onPressed: (){
              if (text.isEmpty||(text.startsWith("0.")&& text.length==2)||(text.startsWith("0")&& text.length==1)){
                return null;
              }else{
                Navigator.push(context, PageTransition(type: PageTransitionType.bottomToTop, child: Requestmoney()));

              }

            },
            child: Text("Request",style: TextStyle(color: Colors.white,fontSize: 18,letterSpacing: 1,fontWeight: FontWeight.bold),),
          ),
        ),
        Container(
          height: 50,
          width: 170,
          decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(30)
          ),
          child: TextButton(
            onPressed: (){
              if (text.isEmpty||(text.startsWith("0.")&& text.length==2)||(text.startsWith("0")&& text.length==1)){
                return null;
              }else{
                Navigator.push(context, PageTransition(type: PageTransitionType.bottomToTop, child: Sendmoney(text1:text,)));

              }

            },
            child: Text("Send",style: TextStyle(color: Colors.white,fontSize: 18,letterSpacing: 1,fontWeight: FontWeight.bold),),
          ),
        )
      ],
    );
  }
}
