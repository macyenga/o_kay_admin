import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationProvider extends ChangeNotifier {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  bool _isSignedIn = false;
  bool get isSignedIn => _isSignedIn;

  bool _hasError = false;
  bool get hasError => _hasError;

  String? _errorCode;
  String? get errorCode => _errorCode;

  bool _emailVerified = false;
  bool get emailVerified => _emailVerified;

  String? _uid;
  String? get uid => _uid;

  String? _name;
  String? get name => _name;

  String? _email;
  String? get email => _email;

  String? _imageUrl;
  String? get imageUrl => _imageUrl;

  String? _phoneNumber;
  String? get phoneNumber => _phoneNumber;

  AuthenticationProvider() {
    checkSignInUser();
  }

  Future checkSignInUser() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    _isSignedIn = sharedPreferences.getBool('signed_in') ?? false;
    notifyListeners();
  }

  Future setSignIn() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setBool('signed_in', true);
    _isSignedIn = true;
    notifyListeners();
  }

  void resetError() async {
    _hasError = false;
    _errorCode = null;
    notifyListeners();
  }

  Future userSignOut() async {
    await firebaseAuth.signOut();
    _isSignedIn = false;
    notifyListeners();
    clearStoredData();
  }

  Future clearStoredData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }

  Future saveDataToSharedPreferences() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.setString('name', _name!);
    await sharedPreferences.setString('email', _email!);
    await sharedPreferences.setString('uid', _uid!);
    await sharedPreferences.setString('image_url', _imageUrl!);
    await sharedPreferences.setString('phoneNumber', _phoneNumber!);
    await sharedPreferences.setBool('emailVerified', _emailVerified);
    notifyListeners();
  }

  Future getUserDataFromSharedPreferences() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    _name = sharedPreferences.getString('name');
    _email = sharedPreferences.getString('email');
    _uid = sharedPreferences.getString('uid');
    _imageUrl = sharedPreferences.getString('image_url');
    _phoneNumber = sharedPreferences.getString('phoneNumber');
    _emailVerified = sharedPreferences.getBool('emailVerified')!;
    notifyListeners();
  }

  Future getUserDataFromFirestore(uid) async {
    await FirebaseFirestore.instance
        .collection('admins')
        .doc(uid)
        .get()
        .then((DocumentSnapshot snapshot) => {
              _uid = snapshot['uid'],
              _name = snapshot['name'],
              _email = snapshot['email'],
              _imageUrl = snapshot['image_url'],
              _phoneNumber = snapshot['phoneNumber'],
              _emailVerified = snapshot['emailVerified'],
            });

    notifyListeners();
  }

  Future signInWithEmailAndPassword(
    email,
    password,
  ) async {
    try {
      final userDetails = (await firebaseAuth.signInWithEmailAndPassword(
              email: email, password: password))
          .user!;

      _name = userDetails.displayName;
      _email = userDetails.email;
      _imageUrl = userDetails.photoURL;
      _emailVerified = userDetails.emailVerified;
      _uid = userDetails.uid;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'account-exists-with-different-credential':
          _errorCode =
              'You already have an account with us. Use the correct provider';
          _hasError = true;
          notifyListeners();

          break;

        case 'wrong-password':
          _errorCode = 'Username or password is incorrect';
          _hasError = true;
          notifyListeners();

          break;

        case 'null':
          _errorCode = 'Some unexpected error while trying to sign in';
          _hasError = true;
          notifyListeners();
          break;

        default:
          _errorCode = 'Failed with error code: ${e.code}';
          _hasError = true;
          notifyListeners();
          break;
      }
    }
  }
}
