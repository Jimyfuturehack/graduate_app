import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

 scanQr(var qrstr){
  try {
    FlutterBarcodeScanner.scanBarcode('#2A99CF', 'cancel', true, ScanMode.QR)
        .then((value) {
      qrstr = value;
      return qrstr;
    });
  } catch (e) {
      qrstr = 'unable to read this';
  }}
