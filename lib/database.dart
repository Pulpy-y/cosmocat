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

  Future<void> sendFriendRequest(String senderId, String receiverName) async {
    //assumption: userName is unique

    await userCollection
        .where("nickname", isEqualTo: receiverName)
        .get()
        .then((QuerySnapshot querySnapshot) async {
      if (querySnapshot.size == 0) {
        return false;
      }

      DocumentReference requestDoc = querySnapshot.docs.first.reference;
      var receiverCurrentRequest = [];

      await requestDoc.get().then((document) {
        try {
          receiverCurrentRequest = document.get("friendRequest");
        } catch (StateError) {
          print("rq list does not exist");
        }

        if (!receiverCurrentRequest.contains(senderId)) {
          receiverCurrentRequest.add(senderId);
        }
      });

      requestDoc.update({
        "friendRequest": [senderId]
      });
      return true;
    });
  }

  Future<bool> isUserNameExist(String receiverName) async {
    bool exist = true;
    await userCollection
        .where("nickname", isEqualTo: receiverName)
        .get()
        .then((QuerySnapshot querySnapshot) {
      if (querySnapshot.size == 0) {
        exist = false;
      }
    });

    return exist;
  }

  Future<List<String>> getFriendRequestList(String userId) async {
    late List<String> requestList;
    DocumentReference docRef = userCollection.doc(userId);
    await docRef.get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        var requestListRaw = [];
        try {
          requestListRaw = documentSnapshot.get("friendRequest");
        } catch (StateError) {
          print("rq list does not exist");
        }

        requestList = List<String>.from(requestListRaw);
      }
    });

    return requestList;
  }
}
