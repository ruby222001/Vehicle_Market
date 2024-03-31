import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project/services/auth.dart';

import '../constants/widgets.dart';

class UserService {
  Auth authService = Auth();
  User? user = FirebaseAuth.instance.currentUser;

  Future<void> updateFirebaseUser(
      BuildContext context, Map<String, dynamic> data) {
    User? user = FirebaseAuth.instance.currentUser;
    return authService.users.doc(user!.uid).update(data).then((value) {
      customSnackBar(context: context, content: 'Location updated on database');
    }).catchError((error) {
      customSnackBar(
          context: context,
          content: 'location cannot be updated in database due to $error');
    });
  }

  Future<DocumentSnapshot> getUserData() async {
    DocumentSnapshot doc = await authService.users.doc(user!.uid).get();
    return doc;
  }

  Future<DocumentSnapshot> getSellerData(id) async {
    DocumentSnapshot doc = await authService.users.doc(id).get();
    return doc;
  }

  Future<DocumentSnapshot> getProductDetails(id) async {
    DocumentSnapshot doc = await authService.products.doc(id).get();
    return doc;
  }

  createChatRoom({required Map<String, dynamic> data}) {
    authService.messages.doc(data['chatroomId']).set(data).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  createChat({String? chatroomId, required Map<String, dynamic> message}) {
    authService.messages
        .doc(chatroomId)
        .collection('chats')
        .add(message)
        .catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
    authService.messages.doc(chatroomId).update({
      'lastChat': message['message'],
      'lastChatTime': message['time'],
      'read': false,
    });
  }

  getChatDetails({String? chatroomId}) async {
    return authService.messages
        .doc(chatroomId)
        .collection('chats')
        .orderBy('time')
        .snapshots();
  }

  deleteChat({String? chatroomId}) async {
    return authService.messages.doc(chatroomId).delete();
  }

  updateFavourite(
      {required BuildContext context,
      required bool isLiked,
      required String productId}) {
    if (isLiked) {
      authService.products.doc(productId).update({
        'favourites': FieldValue.arrayUnion([user!.uid])
      });
      customSnackBar(context: context, content: 'Added to favourites');
    } else {
      authService.products.doc(productId).update({
        'favourites': FieldValue.arrayRemove([user!.uid])
      });
      customSnackBar(context: context, content: 'Removed from favourites');
    }
  }
}