import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_initicon/flutter_initicon.dart';
import 'package:url_launcher/url_launcher.dart';
class Requestmoney extends StatefulWidget {
  const Requestmoney({Key? key}) : super(key: key);

  @override
  State<Requestmoney> createState() => _RequestmoneyState();
}

class _RequestmoneyState extends State<Requestmoney> {

  List<Contact> contacts=[];
  List<Contact> filtercontacts=[];
  var height;
   late bool permission=false;
  TextEditingController myname = TextEditingController();
  @override
  void initState(){
    super.initState();
    getAllContacts();
    myname.addListener(() {
      fliterContact();
    });
  }
  getAllContacts() async{
    if(await FlutterContacts.requestPermission()){
      contacts =( await FlutterContacts.getContacts(withPhoto: true,withProperties: true));
      permission==true;
      setState(() {
      });
    }
  }
  fliterContact(){
    List<Contact> _contacts=[];
    _contacts.addAll(contacts);
    if(myname.text.isNotEmpty){
      _contacts.retainWhere((contact){
        String searchTearm= myname.text.toLowerCase();
        String contactName=contact.displayName.toLowerCase();
        return contactName.contains(searchTearm);

      });
    }
    setState(() {
      filtercontacts=_contacts;
    });
  }



  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height-277;
    bool isSearch= myname.text.isNotEmpty;
    return Scaffold(
      appBar: AppBar(
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
                        Text("From",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                        SizedBox(width: 15,),
                        Container(
                          width: MediaQuery.of(context).size.width / 2,
                          height: 50,
                          child: TextFormField(
                            autofocus:permission,
                            controller: myname,
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
                            cursorHeight: 25,
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
                  Container(
                    width: double.infinity,
                    height: height,
                    child: ListView.builder(
                        itemCount: isSearch==true? filtercontacts.length : contacts.length,
                        itemBuilder: ( context,index){
                          var contact = isSearch==true? filtercontacts![index]: contacts![index];
                          Uint8List? image= contact.photo;

                          String number=(contact.phones.isNotEmpty)? contact.phones.first.number: " ";
                          return Card(
                            child: ListTile(
                              onTap: () {
                                myname.text = contact.displayName;

                              },
                              title: Text(contact.displayName),
                              subtitle: Text(number),
                              leading: (image==null)?Initicon(text: contact.displayName,):CircleAvatar(backgroundImage: MemoryImage(image),),


                            ),
                          );


                        }
                    ),)

                ],
              ),

            ],
          ),

        ),
      ),
    );
  }
}
