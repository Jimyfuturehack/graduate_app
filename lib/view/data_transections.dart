import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
class Datatransections extends StatelessWidget {
  const Datatransections({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: HexColor('444444')),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body:SafeArea(
        child: Container(
          color: Colors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(width: 2, color: Colors.grey))
                ),
                padding: EdgeInsets.only(left: 20,top: 10),
                height: 50,
                child: Text("Sender : Mostafa",style: TextStyle(fontSize: 18),),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(width: 2, color: Colors.grey))
                ),
                padding: EdgeInsets.only(left: 20,top: 10),
                height: 50,
                child: Text("Reciver : Salah",style: TextStyle(fontSize: 18),),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(width: 2, color: Colors.grey))
                ),
                padding: EdgeInsets.only(left: 20,top: 10),
                height: 50,
                child: Text("Transaction Id : 553563",style: TextStyle(fontSize: 18),),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(width: 2, color: Colors.grey))
                ),
                padding: EdgeInsets.only(left: 20,top: 10),
                height: 50,
                child: Text("Transaction Amount : \$356",style: TextStyle(fontSize: 18),),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(width: 2, color: Colors.grey))
                ),
                padding: EdgeInsets.only(left: 20,top: 10),
                height: 50,
                child: Text("Transaction date : 21/3/2012",style: TextStyle(fontSize: 18),),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(width: 2, color: Colors.grey))
                ),
                padding: EdgeInsets.only(left: 20,top: 10),
                height: 50,
                child: Text("Transaction progress : success",style: TextStyle(fontSize: 18),),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(width: 2, color: Colors.grey))
                ),
                padding: EdgeInsets.only(left: 20,top: 10),
                height: 50,
                child: Text("Transaction Logo : None",style: TextStyle(fontSize: 18),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
