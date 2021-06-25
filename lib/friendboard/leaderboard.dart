import 'package:cosmocat/friendboard/user_model.dart';
import 'package:flutter/material.dart';
import '../size_config.dart';

class LeaderBoard extends StatefulWidget {
  List<UserModel> friendList;
  UserModel currUser;
  late List<UserModel> rankList;

  LeaderBoard(this.friendList, this.currUser) {
    rankList = List.from(friendList);
    rankList.add(currUser);
  }

  @override
  _LeaderBoardState createState() => _LeaderBoardState(rankList);
}

class _LeaderBoardState extends State<LeaderBoard> {
  List<UserModel> rankList;
  double screenHeight = SizeConfig.screenHeight!;
  double screenWidth = SizeConfig.screenWidth!;
  bool loading = true;

  _LeaderBoardState(this.rankList);

  @override
  Widget build(BuildContext context) {
    double defaultWidth = screenWidth * 0.1;

    return Container(
      height: screenHeight * 7 / 11,
      child: ListView.builder(
          itemCount: rankList.length,
          itemBuilder: (context, index) {
            return Card(
                margin: EdgeInsets.only(top: defaultWidth * 0.5),
                color: Colors.white.withOpacity(0.6),
                child: rankTile(index, rankList[index].name, "0 hr 0 min"));
          }),
    );
  }

  Widget rankTile(int index, String username, String time) {
    return ListTile(
      leading: Text((index + 1).toString()),
      tileColor: Colors.transparent,
      title: Text(username),
      subtitle: Text(time),
    );
  }
}
