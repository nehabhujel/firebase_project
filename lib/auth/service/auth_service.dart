import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/auth/screen/login_screen.dart';
import 'package:firebase_project/buttombar/buttombar.dart';
import 'package:firebase_project/model/user_model.dart';
import 'package:firebase_project/utils/utils.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseFirestore firebaseStore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> registerUser({
    required String email,
    required String password,
    required String name,
    required String phoneNumber,
    required BuildContext context,
  }) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;
      if (user != null) {
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'name': name,
          'email': email,
          'phoneNumber': phoneNumber,
          'password': password,
        });
        showSnackBar(context, "Successfully registered");
        Navigator.pop(context);
        Navigator.pop(context);
      }
    } catch (e) {
      Navigator.pop(context);
      showSnackBar(context, e.toString());
    }
  }

  //void loin
  Future<void> loginUser({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (!context.mounted) return;
      showSnackBar(context, "successfully logged in");
      Navigator.pushNamedAndRemoveUntil(
          context, BottomBar.routeName, (route) => false);
    } on FirebaseAuthException catch (e) {
      if (!context.mounted) return;
      showSnackBar(context, e.message!);
    } catch (e) {
      if (!context.mounted) return;
      showSnackBar(context, e.toString());
    }
  }

//get user data
  Future<UserModel?> getCurrentUserData() async {
    var userData = await firebaseStore
        .collection('users')
        .doc(auth.currentUser?.uid)
        .get();
    UserModel? user;
    if (userData.data() != null) {
      Map<String, dynamic> userDataMap = userData.data()!;
      userDataMap['uid'] = auth.currentUser?.uid; // Add UID to the user data
      user = UserModel.fromJson(userDataMap);
    }
    return user;
  }

//logout user
  Future<void> logoutUser(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      if (!context.mounted) return;
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
          (route) => false);
    } catch (e) {
      if (!context.mounted) return;
      showSnackBar(context, e.toString());
    }
  }

  Stream<UserModel> userData(String userID) {
    return firebaseStore.collection('users').doc(userID).snapshots().map(
          (event) => UserModel.fromJson(
            event.data()!,
          ),
        );
  }
}
