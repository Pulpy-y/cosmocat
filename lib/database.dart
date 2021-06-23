import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cosmocat/models/app_user.dart';


class DatabaseService {
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

  Future<String> getUserName(String userId) async {
    late String name;
    DocumentReference docRef = userCollection.doc(userId);
    await docRef.get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        name = documentSnapshot.get("nickname");
      } else {
        name = "null";
      }
    });
    return name;
  }

  Stream<QuerySnapshot> get user {
    return userCollection.snapshots();
  }

 
}