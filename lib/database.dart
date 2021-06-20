import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cosmocat/models/app_user.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

//final databaseReference = FirebaseDatabase.instance.reference();

class DatabaseService {
  final _auth = FirebaseAuth.instance;
  CollectionReference userCollection = FirebaseFirestore.instance.collection('users');

  Future<void> addUser(AppUser user, String uid) async {
    await userCollection.doc(uid).set({
      'uid' : user.uid,
      'email': user.email,
      'nickname': user.nickName,
      'friends': user.friends,
      'animals': user.animals,
    }).then((value) {
      print("User added");
    }).catchError((error) => print("Failed to add user: $error"));
  }

  AppUser getUser(String userId)  {
    late AppUser returnVal;
    userCollection.doc(userId).get().then((doc) {
      AppUser user = new AppUser(
          email: doc['email'],
          nickName: doc['nickname'],
          );
      returnVal = user;
    }).catchError((error) => print(error));
    return returnVal;
  }

  Stream<QuerySnapshot> get user {
    return userCollection.snapshots();
  }

/*
  final String uid;
  DatabaseService({required this.uid});

  // collection reference
  final CollectionReference animalCollection = FirebaseFirestore.instance.collection('animals');

  Future updateUserData(String name) async {
    return await animalCollection.doc(uid).set(
      'name' : name, SetOptions()
    )
  }
*/
 
}