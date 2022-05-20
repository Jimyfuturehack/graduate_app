import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({Key? key}) : super(key: key);

  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  var qrstr ="";
   var   qrstr1="";
  var height,width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
            appBar: AppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [

            Container(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width*.65,
                    child: TextField(
                      onChanged: (val)
                      {
                        setState(() {
                          qrstr1=val;
                        });
                      },
                      decoration: const InputDecoration(
                          hintText: 'Enter your data here',
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue,
                                width: 2,
                              )

                          )
                      ),
                    ),
                  ),
                  BarcodeWidget(
                    data: qrstr1,
                      barcode: Barcode.qrCode(),
                      color: Colors.blue,
                      width: 250,
                        height: 250,
                      ),


                ],
              ),
            ),
            SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 30),
                  width: 150,
                  child: ElevatedButton(onPressed: scanQr, child:
                  Text(('Create Qr'))),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 30),
                  width: 150,
                  child: ElevatedButton(onPressed: scanQr, child:
                  Text(('Read Qr'))),
                ),

              ],
            ),
          ],
        )

    );
  }
  Future <void>scanQr()async{
    try{
      FlutterBarcodeScanner.scanBarcode('#2A99CF', 'cancel', true, ScanMode.QR).then((value){
        setState(() {
          qrstr=value;
        });
        return qrstr;
      });
    }catch(e){
      setState(() {
        qrstr='unable to read this';
      });
    }
  }
}