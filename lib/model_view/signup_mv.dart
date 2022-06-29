import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

 add_data (var firstname,var lastname,var username,var number,var birthdate,var password,var formstate)async{
   var mynumber = int.parse(number);
   if(formstate.currentState!.validate()) {
     formstate.currentState!.save();
     CollectionReference users =  FirebaseFirestore.instance.collection("Users");

   await users.doc("${username.text}").collection("Data").doc("Info").set({
        "Balance": 1000,
        "birthday": birthdate,
        "Email": username.text,
       "FirstName": firstname.text,
       "LastName": lastname.text,
        "PhoneNumber":mynumber,


     });
     await users.doc("${username.text}").set({
       "PhoneNumber":mynumber,


     });
     try {
       UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
           email: "${username.text}",
           password: "${password.text}"
       );
       return "success";
     } on FirebaseAuthException catch (e) {
       if (e.code == 'weak-password') {
         print('The password provided is too weak.');
       } else if (e.code == 'email-already-in-use') {
         return "Email is used";
       }
     } catch (e) {
       print(e);
     }
   }else{
     print("not valid");
   }

 }