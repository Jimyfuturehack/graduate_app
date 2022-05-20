import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

 add_data (var firstname,var lastname,var username,var password,var formstate)async{
   if(formstate.currentState!.validate()) {
     formstate.currentState!.save();
     CollectionReference users =  FirebaseFirestore.instance.collection("Users");

   await users.doc("${username.text}").collection("Data").doc("Info").set({
       "FirstName": firstname.text,
       "LastName": lastname.text,
       "Email": username.text,
       //"birthday": birthdate,
     });
     try {
       UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
           email: "${username.text}",
           password: "${password.text}!"
       );
       return userCredential;
     } on FirebaseAuthException catch (e) {
       if (e.code == 'weak-password') {
         print('The password provided is too weak.');
       } else if (e.code == 'email-already-in-use') {
         print('The account already exists for that email.');
       }
     } catch (e) {
       print(e);
     }
   }else{
     print("not valid");
   }

 }