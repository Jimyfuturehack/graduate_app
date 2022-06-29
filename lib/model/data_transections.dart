import 'package:flutter/material.dart';
class datatransections{
  late String sender,reciver,transactionId;
  late String transactionProgress,transactionLogo;
  var transactionAmount;
  DateTime transactionDate;
  datatransections({required this.sender,required this.reciver,required this.transactionId,
  required this.transactionAmount,required this.transactionDate,required this.transactionProgress,required this.transactionLogo,});



}