import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:product_api/auth_model.dart';

import 'botton_navigation.dart';

class AuthProviderIn with ChangeNotifier {
  final _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestor= FirebaseFirestore.instance;
  late Map<String,dynamic> profileDetail;

  Future<UserCredential?> loginWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn().signIn();
      final googleAuth = await googleUser?.authentication;
      final cred = GoogleAuthProvider.credential(
          idToken: googleAuth?.idToken, accessToken: googleAuth?.accessToken);
      return await _auth.signInWithCredential(cred);
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
  Future<User?> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final cred = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return cred.user;
    } catch (e) {
      log("Something went wrong: $e");
      return null;
    }
  }
  Future<User?> loginUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final cred = await _auth.signInWithEmailAndPassword (
        email: email,
        password: password,
      );
      return cred.user;
    } catch (e) {
      log("Something went wrong: ");
    }
    return null;
  }
  Future<void> signout() async{
    try{
      await _auth.signOut();
    }
    catch(e){
      log("Something went wrong:");
    }
  }
  Future<void>signupDetail(AuthModel data)async{
    var user=_auth.currentUser?.uid;
    if(user==null){
      log('User is not authentication');
      return;
    }
    try{
      await _firestor.collection('userDetailApi').doc(user).set(data.toMap());
      log('User added successfull');

    }catch(e){
      log('Error');
    }
  }
  Future<void> getProfileDetail() async {
    var user = _auth.currentUser?.uid;

    if (user != null) {
      DocumentSnapshot userDocument = await _firestor.collection('userDetailApi').doc(user).get();

      final data = userDocument.data() as Map<String, dynamic>?;

      if (data != null) {
        profileDetail = data.map((key, value) => MapEntry(key, value.toString()));
      } else {
        print('No data found for user: $user');
      }
    }
  }

  void logInData(BuildContext context, String email,String password) async{
    try{
      var cred= await _auth.signInWithEmailAndPassword(email: email, password: password);
      Fluttertoast.showToast(msg: 'Login successful');
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BottomNavigation()));
    }
    catch(e){
      log('error:$e');
      Fluttertoast.showToast(msg: 'Login Fail');
    }
  }
}
