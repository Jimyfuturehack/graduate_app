import 'package:flutter/material.dart';
import 'package:flutter_initicon/flutter_initicon.dart';
class profile extends StatelessWidget {
  const profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      IconData arrow_forward = IconData(0xe09b,);
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
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ListTile(
              title: Text("Mostafa gamal",style: TextStyle(fontSize:20,fontWeight: FontWeight.bold)),
              subtitle: Text("@jimy123",style: TextStyle(color: Colors.blue,),),
              leading: Initicon(text: "Mostafa Gamal"),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
                child: FlatButton(
                    color: Colors.white,
                    onLongPress: ()=>{
                      ColoredBox(color: Colors.white,)
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Icon(Icons.add, color: Colors.pink),
                          SizedBox(width: 10,),
                          Text('Invite your friends to join Telda', style: TextStyle(color: Colors.pink,fontSize: 17))
                        ]
                    ),
                    onPressed: () {}
                )
            ),
            SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text("Usage",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            ),
          ),
            SizedBox(height: 15,),
            ListTile(
              title: Text("Fees",style: TextStyle(fontSize: 17),),
              subtitle: Text("Details of fees breakdown"),
              leading: CircleAvatar(child: Icon(Icons.credit_card,color:Colors.black),backgroundColor: Colors.white,),
              trailing: Icon(Icons.arrow_forward,color: Colors.black,),
            ),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text("Manage",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              ),
            ),
            SizedBox(height: 15,),
            ListTile(
              title: Text("Settings",style: TextStyle(fontSize: 17),),
              subtitle: Text("Personal information, app & Security"),
              leading: CircleAvatar(child: Icon(Icons.settings,color:Colors.black),backgroundColor: Colors.white,),
              trailing: Icon(Icons.arrow_forward,color: Colors.black,),
            ),
            SizedBox(height: 15,),
            ListTile(
              title: Text("Help",style: TextStyle(fontSize: 17),),
              subtitle: Text("Get support and feedback"),
              leading: CircleAvatar(child: Icon(Icons.message,color:Colors.black),backgroundColor: Colors.white,),
              trailing: Icon(Icons.arrow_forward,color: Colors.black,),
            ),


          ],
        ),
      ),
    );
  }
}
