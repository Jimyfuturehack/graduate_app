import 'package:flutter/material.dart';
import 'package:untitled5/view/qr_scanner.dart';
import 'contact_us.dart';
class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children:<Widget> [
            Container(

                width: double.infinity,
                height: 250,
                color: Colors.black,
                ),
            SizedBox(height: 10,),
            InkWell(

              onTap: (){print("fuck");},
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 40,vertical: 3),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 0.7)
                  )
                ),
                width: double.infinity,
                height:40,
                child: Text("About",style: TextStyle(fontSize: 18),),
              ),
            ),
            InkWell(

              onTap: (){print("fuck");},
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 40),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 0.2)
                    )
                ),
                width: double.infinity,
                height:40,
                child: Text("Transactopn history",style: TextStyle(fontSize: 18),),
              ),
            ),
            InkWell(
              onTap: (){print("fuck");},
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 40),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 0.1)
                    )
                ),
                width: double.infinity,
                height:40,
                child: Text("Setting",style: TextStyle(fontSize: 18),),
              ),
            ),
            InkWell(

              onTap: (){print("fuck");},
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 40),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 0.1)
                    )
                ),
                width: double.infinity,
                height:40,
                child: Text("Logout",style: TextStyle(fontSize: 18),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
