// ignore_for_file: file_names

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../models/User.dart';

class AuthService {
  AuthService(this._context);

  late final BuildContext _context;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<UserData?> createUserWithEmailAndPassword(
      String name, String email, String password, File? avatar) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      String? imgUrl;

      await credential.user?.updateDisplayName(name);

      if (avatar != null) {
        final imgName = '${const Uuid().v4()}}${avatar.path.split('.').last}';

        final imgRef = _storage.ref(imgName);

        await imgRef.putFile(avatar);

        imgUrl = await imgRef.getDownloadURL();

        await credential.user?.updatePhotoURL(imgUrl);
      }

      return UserData(avatar: imgUrl, name: name, email: email);
    } on FirebaseException catch (error) {
      ScaffoldMessenger.of(_context).showSnackBar(SnackBar(
          content: Text(error.message ?? 'Ocorreu um erro desconhecido')));
    } catch (error) {
      ScaffoldMessenger.of(_context)
          .showSnackBar(SnackBar(content: Text(error.toString())));
    }
    return null;
  }

  Future<UserData?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      
      return UserData(
        name: credential.user?.displayName, 
        email: credential.user?.email, 
        avatar: credential.user?.photoURL);
        
    } on FirebaseException catch (error) {
      ScaffoldMessenger.of(_context).showSnackBar(SnackBar(
          content: Text(error.message ?? 'Ocorreu um erro desconhecido')));
    } catch (error) {
      ScaffoldMessenger.of(_context)
          .showSnackBar(SnackBar(content: Text(error.toString())));
    }
    return null;
  }

  UserData? getLoggedUser() {
    final user = _auth.currentUser;

    if (user == null) {
      return null;
    }

    return UserData(
        name: user.displayName, email: user.email, avatar: user.photoURL);
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
