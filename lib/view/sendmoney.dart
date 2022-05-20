import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter/cupertino.dart';

class Sendmoney extends StatefulWidget {
  const Sendmoney({Key? key}) : super(key: key);

  @override
  State<Sendmoney> createState() => _SendmoneyState();
}

class _SendmoneyState extends State<Sendmoney> {
  List<Contact> contacts=[];
  List<Contact> filtercontacts=[];
  var height;
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
                        Text("To",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                        SizedBox(width: 15,),
                        Container(
                            width: MediaQuery.of(context).size.width / 2,
                          height: 50,
                          child: TextFormField(
                          //  autofocus: true,
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
                  )

                ],
              ),
                Container(
                 width: double.infinity,
                 height: height,
                 child: ListView.builder(
                     itemCount: isSearch==true? filtercontacts.length : contacts.length,
                     itemBuilder: ( context,index){
                      Contact contact = isSearch==true? filtercontacts[index] : contacts[index];
                      Uint8List? image= contact.photo;
                        if(contacts==null){
                          return Text("No contacts");
                        }else{
                          return Container(
                            child: Column(
                              children: [
                                Card(
                                  child: ListTile(
                                    onTap: () {
                                     myname.text= contact.displayName;
                                    },
                                    title: Text(contact.displayName),
                                    subtitle: Text(contact.phones.elementAt(0).number),
                                    leading: (image==null)?CircleAvatar(child: Icon(Icons.person),):CircleAvatar(backgroundImage: MemoryImage(image),),


                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                       }
                       ),
               ),

            ],
          ),

        ),
      ),
    );
  }
}



