import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled5/view/home.dart';
import 'package:uuid/uuid.dart';
CollectionReference userRef = FirebaseFirestore.instance.collection("Users");
dataTransaction(String name,String amount)async{

     var transactionAmount = double.parse(amount);
   //  String Logo = new String.fromCharCodes(photo);
      var uuid = Uuid().v4().toUpperCase();
      final now = DateTime.now();
     var myname = name;
    if(transactionAmount<myamount){
       myamount=myamount-transactionAmount;
      userRef.doc(username).collection("TransactionHistory").doc(uuid).set({
           "TransactionAmmount": transactionAmount,
           "TransactionDate": now,
           "TransactionID": uuid.toString(),
           "Transferedto": myname,
     });
    userRef.doc(username).collection("Data").doc("Info").update({"Balance": myamount,});

       var capitalcities = await  userRef.where("PhoneNumber", isEqualTo: 1148121187);
       capitalcities.get().then((QuerySnapshot documents){
         documents.docs.forEach((DocumentSnapshot doc)async{
              var  docId=doc.id;
                userRef.doc(docId).collection("TransactionHistory").doc(uuid).set({
                  "AmountRecived": transactionAmount,
                  "TransactionDate": now,
                  "TransactionID": uuid.toString(),
                  "Recivedfrom": username,
                });
              var docSnapshot = await userRef.doc(docId).collection("Data").doc("Info").get();
              Map<String, dynamic> data = docSnapshot.data()!;
              var amountsender=data["Balance"];
                  amountsender=amountsender+transactionAmount;
              userRef.doc(docId).collection("Data").doc("Info").update({"Balance": amountsender,});


         }
         );
       });
            return "1";
    }


}
