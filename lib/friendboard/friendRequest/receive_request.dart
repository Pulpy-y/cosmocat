import 'package:cosmocat/Login/log_in.dart';
import 'package:cosmocat/components/background.dart';
import 'package:cosmocat/database.dart';
import 'package:flutter/material.dart';
import '../../size_config.dart';

class Receive extends StatefulWidget {
  @override
  _ReceiveState createState() => _ReceiveState();
}

class _ReceiveState extends State<Receive> {
  double screenHeight = SizeConfig.screenHeight!;
  double screenWidth = SizeConfig.screenWidth!;
  List<List<String>> friendRequestList = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Background(
        child: Column(
      children: <Widget>[
        Container(
          height: screenHeight * 2 / 10,
        ),
        receiveRequest()
      ],
    ));
  }

  Widget receiveRequest() {
    double defaultWidth = screenWidth * 0.1;

    if (friendRequestList.length == 0) {
      return Center(
        child: Text(
          "No friend request",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      );
    }

    return Container(
        height: screenHeight * 8 / 10,
        child: ListView.builder(
            itemCount: friendRequestList.length,
            itemBuilder: (context, index) {
              return Card(
                  margin: EdgeInsets.only(top: defaultWidth * 0.5),
                  color: Colors.white.withOpacity(0.6),
                  child: ListTile(
                    leading: Text((index + 1).toString()),
                    title: Text(friendRequestList[index][0]),
                    trailing: IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () async {
                        await DatabaseService().receiveFriendRequest(
                            user!.uid, friendRequestList[index][1]);
                        getData();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: const Text('Friend request accepted!'),
                        ));
                      },
                    ),
                  ));
            }));
  }

  Future<bool> getData() async {
    List<String> requestList =
        await DatabaseService().getFriendRequestList(user!.uid);

    friendRequestList.clear();
    for (String uid in requestList) {
      friendRequestList.add([await DatabaseService().getUserName(uid), uid]);
    }

    setState(() {});

    return true;
  }
}
