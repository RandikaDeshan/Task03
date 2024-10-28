import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:third_app/src/models/usermodel.dart';

class AuthService{

  final FirebaseAuth _auth =FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<UserCredential?> createNewUser({required String email, required String password})async{
      try{
        final userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);

        return userCredential;
      }catch(error){
        print("Error : ${error}");
      }
      return null;
  }

  Future<void> signInWithEmailAndPassword({required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print('Error creating user: $e');
    }
  }

  Future<void> signInWithGoogle()async{
    try{
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if(googleUser == null){
        return;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken
      );

      final UserCredential userCredential = await _auth.signInWithCredential(credential);

      final User? user = userCredential.user;

      if(user != null){
        final UserModel newUser = UserModel(userId: user.uid, name: user.displayName ?? "No Name", email: user.email ?? "No Email", password: "");

        final DocumentReference docRef = FirebaseFirestore.instance.collection("users").doc(user.uid);

        await docRef.set(newUser.toJson());
      }

    }catch(error){
      print("Error : ${error}");
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();

    }catch (error) {
      print("Error : ${error}");

    }
  }

  Future<void> signInWithFacebook()async{

    try{
    final LoginResult loginResult = await FacebookAuth.instance.login();

    final OAuthCredential authCredential = FacebookAuthProvider.credential(
        "${loginResult.accessToken?.tokenString}");

    final UserCredential userCredential = await _auth.signInWithCredential(authCredential);

    final User? user = userCredential.user;

    if(user != null){
      final UserModel newUser = UserModel(userId: user.uid, name: user.displayName ?? "No Name", email: user.email ?? "No Email", password: "");

      final DocumentReference docRef = FirebaseFirestore.instance.collection("users").doc(user.uid);

      await docRef.set(newUser.toJson());
    }}catch(error){
      print("Error : ${error}");
    }
  }


}