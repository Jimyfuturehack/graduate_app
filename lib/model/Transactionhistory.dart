
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled5/model_view/datatransaction.dart';

import '../view/home.dart';

class Transactionhistory{
  final CollectionReference profileList =
  FirebaseFirestore.instance.collection('Users');
  Future getUsersList() async {
    List itemsList = [];

    try {
      await profileList.doc(username).collection("TransactionHistory").orderBy("TransactionDate",descending: true).get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          itemsList.add(element.data());
        });
      });
      return itemsList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

}