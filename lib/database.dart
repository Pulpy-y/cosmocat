import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cosmocat/models/app_user.dart';

class DatabaseService {
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  Future<void> addUser(AppUser user, String uid) async {
    await userCollection.doc(uid).set({
      'uid': user.uid,
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

  //friend system
  Future<List<String>> getFriendList(String userId) async {
    late List<String> friendList;
    DocumentReference docRef = userCollection.doc(userId);
    await docRef.get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        var friendListRaw = documentSnapshot.get("friends");
        friendList = List<String>.from(friendListRaw);
      } else {
        friendList = [];
      }
    });
    return friendList;
  }

  Future<bool> sendFriendRequest(String senderId, String receiverName) async {
    //assumption: userName is unique

    await userCollection
        .where("name", isEqualTo: receiverName)
        .get()
        .then((QuerySnapshot querySnapshot) {
      if (querySnapshot.size == 0) {
        return false;
      }

      DocumentReference requestDoc = querySnapshot.docs.first.reference;
      requestDoc.update({"friendRequest": senderId});
      return true;
    });

    return false;
  }
}
