import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled5/model_view/signin_modelview.dart';
import 'package:untitled5/view/signup.dart';
import 'package:untitled5/view/forgotpassword.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:untitled5/view/app.dart';


class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _LogeInState createState() => _LogeInState();
}
class _LogeInState extends State<SignIn> {
  bool remember=false;
  bool sec=true;
  var username,password;
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  var visable = Icon(Icons.visibility,color: Colors.grey);
  var visableoff = Icon(Icons.visibility_off,color: Colors.black38);
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
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              color:Colors.white,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:<Widget> [
                    Image(image: AssetImage("images/EasyMoneyLogo.jpg"),height: 250,),
                    Form(
                      key: formstate,
                        child: Column(
                          children:<Widget>[
                            Transform.translate(
                              offset: Offset(42,0),
                              child: Container(
                                alignment: Alignment.bottomLeft,
                                child:Text("Login",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),) ,
                              ),
                            ),
                            SizedBox(height: 30),
                            Account(),
                            SizedBox(height: 15),
                            Password(),
                            SizedBox(height: 5),
                            Remmember(),
                            SizedBox(height: 15),
                            SignInbuttom(),
                            SizedBox(height: 20),
                            Register(),
                            Padding(

                              padding: const EdgeInsets.fromLTRB(0, 50, 30, 0),
                              child: Container(
                                  alignment: Alignment.bottomRight,
                                  child: skipbottom()),
                            ),
                      ]
                        )
                    ),

                  ],

                ),
              ),
            ),
          ),
        ],
      ),

    );
  }

  Widget Account(){
    return Container(
      height: 40,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.black26,
      ),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        onSaved: (val){username=val;},
        validator: (val){
          if (val==null||val.isEmpty) {return "Please enter your email";}
          return null;
        },
        cursorColor: HexColor('5b5b5b'),
        cursorHeight: 25,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          errorStyle: TextStyle(
            height: 0,
            color: Colors.red[400],
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
          hintText: 'Email',
          hintStyle: TextStyle(color: Colors.black38),
          prefixIcon: Icon(Icons.email,color: Colors.black,),
          border: InputBorder.none,
        ),
      ),
    );
  }
  Widget Password(){
    return Container(
      height: 40,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.black26,
      ),
      child: TextFormField(
        onSaved: (val){password=val;},
        validator: (val){
         if (val==null||val.isEmpty) {return "Please enter your password";}
         return null;
         },
        keyboardType: TextInputType.visiblePassword,
        cursorColor: HexColor('5b5b5b'),
        cursorHeight: 25,
        obscureText: sec,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          errorStyle: TextStyle(
            height: 0,
            color: Colors.red[400],
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
          prefixIcon: Icon(Icons.lock,color: Colors.black,),
          contentPadding: EdgeInsets.only(bottom: 10.0),
          hintText: 'Password',
          hintStyle: TextStyle(color: Colors.black38),
          border: InputBorder.none,
          suffixIcon:IconButton(onPressed: (){
            setState(() {
              sec=!sec;
            });
          },
            icon: sec?visableoff:visable,

          ) ,
        ),
      ),
    );
  }
  Widget Remmember(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:<Widget> [
        Theme(
            data: ThemeData(
              unselectedWidgetColor: Colors.white,
            ),
            child:Transform.translate(
              offset: Offset(10,0),
              child: Checkbox(
                value: remember,
                shape: CircleBorder(),
                side: BorderSide(color: Colors.black38),
                checkColor: HexColor("bcbcbc"),
                activeColor: Colors.white,
                onChanged: (value){
                  remember=value!;
                  setState(() {
                  });
                },
              ),
            )
        ),
        Transform.translate(
          offset: Offset(0,0),
          child: Text(
            "Remeber me",
            style: TextStyle(
              fontSize: 15,
              color:  HexColor('5b5b5b'),
            ),
          ),
        ),
        SizedBox(width:110,),
        Container(
          child: TextButton(onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(builder:(context){
                  return forgotpass() ;
                })
            );
          },
            child: Text("Forgot password?",
              style: TextStyle(fontSize: 15,color: HexColor('074571')),),
          ),
        ),
      ],
    );
  }
  Widget SignInbuttom(){
    return Container(
      height: 50,
      width: 280,
      alignment: Alignment.centerRight,
      child: FlatButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
        ),
        color: HexColor("be581a"),
        onPressed: ()async {
          var user= await signin_mvo(username, password, formstate);
         if(user != null){
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder:(context){
                  return app();
                })
            );
          }
        },
        child: Center(
          child: Text("Login",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              letterSpacing: 1,
            ),
          ),
        ),
      ),
    );
  }
  Widget Register(){
    return Container(
      height: 50,
      width: 280,
      alignment: Alignment.centerRight,
      child: FlatButton(

        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
        ),
        color: Colors.black26,
        onPressed: ()async {
          Navigator.push(
              context,
              MaterialPageRoute(builder:(context){
                return signup();
              })
          );
        },
        child: Center(
          child: Text("Register",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              letterSpacing: 1,
            ),
          ),
        ),
      ),
    );
  }
  Widget skipbottom(){
    return Container(
      color: Colors.black12,
      width: 70,
      height: 40,
      child: FlatButton(onPressed: (){
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder:(context){
              return app();
            })
        );
      }
      , child: Center(child: Text("Skip",style: TextStyle(fontSize: 16,color: Colors.blue),)),

      ),
    );
  }

}
