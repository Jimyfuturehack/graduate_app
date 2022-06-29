import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_initicon/flutter_initicon.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:page_transition/page_transition.dart';
import 'package:untitled5/model/notificationApi.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:untitled5/view/confirmationpage.dart';
class Sendmoney extends StatefulWidget {

   Sendmoney({Key? key,required this.text1}) : super(key: key);
   final String text1;
  @override
  State<Sendmoney> createState() => _SendmoneyState();
}

class _SendmoneyState extends State<Sendmoney> {
 late String amount=widget.text1;
  Uint8List? myimage;
  bool isVisible=true;
 late String mynumber;
  List<Contact> contacts=[];
  List<Contact> filtercontacts=[];
  var height;
  TextEditingController to = TextEditingController();
  TextEditingController description = TextEditingController();
  var totext;
  late FocusNode myFocusNode;
  @override
  void initState(){
    super.initState();


    getAllContacts();
    to.addListener(() {
      fliterContact();
    });
    myFocusNode = FocusNode();
    tz.initializeTimeZones();
    var initializationSettingsAndroid = AndroidInitializationSettings('mipmap/ic_launcher');

  }
  void dispose() {
    myFocusNode.dispose();

    super.dispose();
  }
  getAllContacts() async{
    if(await FlutterContacts.requestPermission()){
      contacts =( await FlutterContacts.getContacts(withPhoto: true,withProperties: true));
      setState(() {
      });
    }
  }
  fliterContact(){
    List<Contact> _contacts=[];
    _contacts.addAll(contacts);
    if(to.text.isNotEmpty){
      _contacts.retainWhere((contact){
        String searchTearm= to.text.toLowerCase();
        String contactName=contact.displayName.toLowerCase();
        return contactName.contains(searchTearm);

      });
    }
    setState(() {
      filtercontacts=_contacts;
    });
  }

  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height-350;
    bool isSearch= to.text.isNotEmpty;
    return Scaffold(
      appBar: AppBar(
        title: Text("EGP ${amount}"),
        titleTextStyle: TextStyle(
          fontSize: 18,
          color: Colors.black,
            fontWeight: FontWeight.bold
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.close),
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        elevation: 0,),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Column(
                children:<Widget> [
                 SizedBox(height: 5,),
                  Container(
                    decoration: BoxDecoration(
                      border:  Border(bottom: BorderSide(color:Colors.black26))
                    ),
                    child: Row(
                      children:<Widget> [
                        SizedBox(width: 25,),
                        Text("To",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                        SizedBox(width: 15,),
                        Container(
                            width: MediaQuery.of(context).size.width / 2,
                          height: 50,
                          child: TextFormField(
                            autofocus: true,
                            controller: to,
                            textInputAction: TextInputAction.next,
                            validator: (value){
                              if (value!.isEmpty){
                                setState(() {
                                  isVisible=true;
                                });
                              }
                            },
                            cursorHeight: 25,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              hintText: 'Name, @username, phone',
                              hintStyle: TextStyle(color: Colors.black38,fontWeight: FontWeight.bold,fontSize: 16),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    decoration: BoxDecoration(
                        border:  Border(bottom: BorderSide(color:Colors.black26))
                    ),
                    child: Row(
                      children:<Widget> [
                        SizedBox(width: 25,),
                        Text("For",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                        SizedBox(width: 15,),
                        Container(
                          width: MediaQuery.of(context).size.width / 2,
                          height: 50,
                          child: TextFormField(
                            focusNode: myFocusNode,
                            cursorHeight: 25,
                            controller: description,
                            keyboardType: TextInputType.emailAddress,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              hintText: 'dinner, rent, etc..',
                              hintStyle: TextStyle(color: Colors.black38,fontSize: 16),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 40,
                    width: double.infinity,
                    color: Colors.black12,
                    child: Transform.translate(
                      offset: Offset(15,7),
                      child: Text(
                        "Contacts",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  if (isVisible||to.text.length==0) Container(
                    width: double.infinity,
                    height: height,
                    child: ListView.builder(
                        itemCount: isSearch==true? filtercontacts!.length : contacts!.length,
                        itemBuilder: ( context,index){
                          var contact = isSearch==true? filtercontacts![index]: contacts![index];
                          Uint8List?  image= contact.photo;
                         String number=(contact.phones.isNotEmpty)? contact.phones.first.number: " ";
                          return Card(
                            child: ListTile(
                              title: Text(contact.displayName),
                              subtitle: Text(number),
                              leading: (image==null)?Initicon(text: contact.displayName,):CircleAvatar(backgroundImage: MemoryImage(image!),),
                              onTap: () {
                                to.text = contact.displayName;
                                myFocusNode.requestFocus();
                                isVisible=false;
                                totext=to.text;
                                myimage=image;
                                mynumber=number;
                                setState(() {

                                });
                              },

                            ),
                          );


                        }
                    ),
                  ) else if(MediaQuery.of(context).viewInsets.bottom==0) Container(
                    height: height+50,
                    width: 250,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 50,
                        width: 300,
                        color: Colors.blueAccent,
                        child: TextButton(
                          onPressed: (){
                            Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: Confirm(name: totext, photo: myimage,number: mynumber,amount: amount,)));

                          },
                          child: Text("Send",style: TextStyle(color: Colors.white,fontSize: 18,),),
                        ),
                      ),
                    ),
                  )else if(MediaQuery.of(context).viewInsets.bottom!=0) Container(
                    height: height-200,
                    width: 250,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 50,
                        width: 300,
                        color: Colors.blueAccent,
                        child: TextButton(
                          onPressed: (){
                          },
                          child: Text("Send",style: TextStyle(color: Colors.white,fontSize: 18,),),
                        ),
                      ),
                    ),
                  )

                ],
              ),

            ],
          ),

        ),
      ),
    );

  }
}



