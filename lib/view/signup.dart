import 'package:bottom_picker/widgets/date_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:untitled5/model_view/signup_mv.dart';
import 'package:page_transition/page_transition.dart';
import 'package:untitled5/view/signin.dart';


import 'app.dart';
import 'home.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {

  @override
  var acception;
  var cheakemail;
  var Verpassword;
   DateTime? mybirth;
  TextEditingController Username = TextEditingController();
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController Password = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController varify = TextEditingController();

  GlobalKey<FormState> formstate1 = new GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: HexColor('444444')),
          onPressed: () => Navigator.push(context,PageTransition(type: PageTransitionType.leftToRight, child: SignIn() )),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [


            Container(
              color: Colors.white,
              child: SafeArea(
                child: Transform.translate(
                  offset: Offset(0,-70),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Form(
                      key: formstate1,
                      child: Column(
                        children:<Widget> [
                          Image(image: AssetImage("images/EasyMoneyLogo.jpg"),height: 200,),

                          name(),
                          SizedBox(height: 20,),
                          Number(),
                          SizedBox(height: 20,),
                          username(),
                          SizedBox(height: 20,),
                          password(),
                          SizedBox(height: 20,),
                          verpassowrd(),
                          SizedBox(height: 20,),
                          datepaicker(),
                          SizedBox(height: 10,),
                          submit(),


                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
    Widget name(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children:<Widget> [
      Container(
      height: 40,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.black12,
      ),
      child: TextFormField(
        controller: firstname,
        onChanged: (firstname){
          setState(() {});},
        keyboardType: TextInputType.emailAddress,
        validator: (firstname){
          if (firstname==null||firstname.isEmpty) {return "*first name*";}
          return null;
        },
        cursorColor: HexColor('5b5b5b'),
        cursorHeight: 20,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          errorStyle: TextStyle(
            height: 0,
            color: Colors.red[400],
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
          contentPadding: EdgeInsets.only(left: 10.0),
          hintText: 'First name',
          hintStyle: TextStyle(color: Colors.black38),
          border: InputBorder.none,
        ),
      ),
    ),
      Container(
          height:40,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
              color: Colors.black12,
          ),
            child: TextFormField(
              controller: lastname,
              onChanged: (lastname){
                setState(() {});},
              keyboardType: TextInputType.emailAddress,

                validator: (lastname){
                if (lastname==null||lastname.isEmpty) {return "*last name*";}
                  return null;
                },
            cursorColor: HexColor('5b5b5b'),
            cursorHeight: 20,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              errorStyle: TextStyle(
                height: 0,
                color: Colors.red[400],
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
              contentPadding: EdgeInsets.only(left: 10.0),
              hintText: 'Last name',
              hintStyle: TextStyle(color: Colors.black38),
              border: InputBorder.none,
              ),
      ),
      ),

      ],
    );
  }
  Widget username(){
    return Container(
      height: 40,
      width: 340,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.black12,
      ),
      child: TextFormField(
        controller: Username,
        keyboardType: TextInputType.emailAddress,
        onChanged: (Username){
          setState(() {});},
        validator: (val){
          if (val==null||val.isEmpty) {return "Please enter email";}
          else if(acception=="Email is used") {return"Email is already used";}
          if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[gmail-yahoo]+\.[com]").hasMatch(val)){return "Please enter valid email";}
          return null;
        },
        cursorColor: HexColor('5b5b5b'),
        cursorHeight: 20,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          errorStyle: TextStyle(
            height: 0,
            color: Colors.red[400],
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
          contentPadding: EdgeInsets.only(left: 10.0),
          hintText: 'Email',
          hintStyle: TextStyle(color: Colors.black38),
          border: InputBorder.none,
        ),
      ),
    );
  }
  Widget Number(){
    return Container(
      height: 40,
      width: 340,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.black12,
      ),
      child: TextFormField(
        controller: number,
        onChanged: (number){
          setState(() {});},
        keyboardType: TextInputType.number,
        validator: (number){
          if (number==null||number.isEmpty) {return "Please enter your number";}
          return null;
        },
        cursorColor: HexColor('5b5b5b'),
        cursorHeight: 20,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          errorStyle: TextStyle(
            height: 0,
            color: Colors.red[400],
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
          contentPadding: EdgeInsets.only(left: 10.0),
          hintText: 'Phone number',
          hintStyle: TextStyle(color: Colors.black38),
          border: InputBorder.none,
        ),
      ),
    );
  }
  Widget password(){
    return Container(
      height: 40,
      width: 340,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.black12,
      ),
      child: TextFormField(
        keyboardType: TextInputType.visiblePassword,
        controller: Password,
        onChanged: (Password){
          setState(() {});},
        validator: (val){
          if (val==null||val.isEmpty) {return "Please enter password";}

          return null;
        },
        obscureText:true ,
        cursorColor: HexColor('5b5b5b'),
        cursorHeight: 20,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          errorStyle: TextStyle(
            height: 0,
            color: Colors.red[400],
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
          contentPadding: EdgeInsets.only(left: 10.0),
          hintText: 'Password',
          hintStyle: TextStyle(color: Colors.black38),
          border: InputBorder.none,
        ),

      ),
    );
  }

    Widget verpassowrd(){
      return Container(
        height: 40,
        width: 340,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.black12,
        ),
        child: TextFormField(
          keyboardType: TextInputType.visiblePassword,
          controller: varify,
          onChanged: (varify){setState((){});},
          validator: (varify){
             if (varify==null  || varify.isEmpty){return "Please vareify password ";}
            return null;
          },
          obscureText:true ,
          cursorColor: HexColor('5b5b5b'),
          cursorHeight: 20,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            errorStyle: TextStyle(
              height: 0,
              color: Colors.red[400],
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
            contentPadding: EdgeInsets.only(left: 10.0),
            hintText: 'Veriify password',
            hintStyle: TextStyle(color: Colors.black38),
            border: InputBorder.none,
          ),
        ),
      );
    }
    Widget datepaicker(){
    return Container(
      width: 250,
    height: 100,
     child: CupertinoDatePicker(
        mode: CupertinoDatePickerMode.date,
        initialDateTime: DateTime(1990, 1, 1),
        minimumYear: 1950,
        maximumDate: DateTime.now(),
        onDateTimeChanged: (DateTime newDateTime) {
          mybirth=newDateTime;
        },

      ),

    );
    }
    Widget submit(){
    return Container(
      height: 40,
      width: 180,

      child: ElevatedButton(
        style: TextButton.styleFrom(
          elevation: 4,

          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5)
          ),
          backgroundColor: Colors.blue,
        ),
       onPressed: () async{
          String mynumber=number.text;
          acception = await add_data(firstname, lastname,Username,mynumber,mybirth,Password,formstate1);
          if(acception!=null) {
            Navigator.pushReplacement(context,
                PageTransition(
                    type: PageTransitionType.bottomToTop,
                    child: app()));
          }
       },
        child: Text("Create account",
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1,
            fontSize: 18
          ),
        ),
        ),
    );
    }
  Future<void> _selectDate(BuildContext context) async {
    DateTime selectedDate = DateTime.now();
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
}
