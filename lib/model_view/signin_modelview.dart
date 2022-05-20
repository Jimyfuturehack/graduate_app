import 'package:firebase_auth/firebase_auth.dart';
   signin_mvo(var username,var password,var formState) async {
     late UserCredential userCredential;
     if(formState.currentState!.validate()){
       formState.currentState!.save();
       try {
         UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
           email: username,
           password: password,
         );
                  return userCredential;
       } on FirebaseAuthException catch (e) {
         if (e.code == 'user-not-found') {
           print('No user found for that email.');
         } else if (e.code == 'wrong-password') {
           print('Wrong password provided for that user.');
         }
       }
     }else{
       print("Not valid");
       return null;
     }
   }
