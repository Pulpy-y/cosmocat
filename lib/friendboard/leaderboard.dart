import 'package:cosmocat/friendboard/user_model.dart';
import 'package:flutter/material.dart';
import 'package:cosmocat/constant.dart';
import '../size_config.dart';

class LeaderBoard extends StatefulWidget {
  List<UserModel> friendList;
  UserModel currUser;
  String category;
  late List<UserModel> rankList;

  LeaderBoard(this.friendList, this.currUser, this.category) {
    rankList = List.from(friendList);
    rankList.add(currUser);
    rankUserByTime(category);
  }

  List<UserModel> rankUserByTime(String category) {
    if (category == "day") {
      rankList.sort((o1, o2) => (o2.dayTime - o1.dayTime).toInt());
    } else {
      rankList.sort((o1, o2) => (o2.weekTime - o1.weekTime).toInt());
    }

    return rankList;
  }

  @override
  _LeaderBoardState createState() => _LeaderBoardState(rankList, category);
}

class _LeaderBoardState extends State<LeaderBoard> {
  List<UserModel> rankList;
  double screenHeight = SizeConfig.screenHeight!;
  double screenWidth = SizeConfig.screenWidth!;
  bool loading = true;
  String category;

  _LeaderBoardState(this.rankList, this.category);

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
                child: rankTile(index, rankList[index]));
          }),
    );
  }

  Widget rankTile(int index, UserModel user) {
    String time;
    if (category == "day") {
      time = user.dayTime.toString();
    } else {
      time = user.weekTime.toString();
    }

    return ListTile(
      leading: Text((index + 1).toString()),
      tileColor: Colors.transparent,
      title: Text(user.name),
      subtitle: Text(time),
    );
  }
}
