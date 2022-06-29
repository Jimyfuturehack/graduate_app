
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';
import '../model/data_transections.dart';
dataTransaction(String name,String amount,Uint8List photo){

     var transactionAmount = double.parse(amount);
      String Logo = new String.fromCharCodes(photo);
     CollectionReference userRef = FirebaseFirestore.instance.collection("Users");


      var username = FirebaseAuth.instance.currentUser?.email;
      var uuid = Uuid().v4().toUpperCase();
      final now = DateTime.now();
      datatransections(
            sender: "$username",
            reciver: "$name",
            transactionId: "$uuid",
            transactionDate: now,
            transactionProgress: "success",
            transactionAmount: transactionAmount,
            transactionLogo:Logo,
      );

      userRef.doc(username).collection("TransactionHistory").doc(uuid).set({
           "TransactionAmmount": transactionAmount,
           "TransactionDate": now,
           "TransactionID": uuid.toString(),
           "Transferedto": name,

     });
}
