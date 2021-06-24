import 'package:cosmocat/Login/log_in.dart';
import 'package:cosmocat/components/loading.dart';
import 'package:cosmocat/constant.dart';
import 'package:cosmocat/friendboard/leaderboard.dart';
import 'package:cosmocat/friendboard/user_model.dart';
import 'package:flutter/material.dart';
import '../database.dart';
import '../size_config.dart';
import 'package:cosmocat/components/background.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool loading = true;
  List<UserModel> friendList = [];
  late UserModel currUser;
  double screenHeight = SizeConfig.screenHeight!;
  double screenWidth = SizeConfig.screenWidth!;

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Background(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: screenHeight * 2 / 11,
              ),
              LeaderBoard(friendList, currUser),
              Container(
                height: screenHeight * 2 / 11,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(40.0),
                        topRight: const Radius.circular(40.0))),
                child: selfInfo(currUser.name, "O hr 0 min"),
              )
            ],
          ));
  }

  //need a function to sort the rank

  Widget selfInfo(String username, String time) {
    double defaultWidth = screenWidth * 0.1;
    double defaultHeight = screenHeight * 2 / 11 * 0.1;

    return Row(
      children: <Widget>[
        Container(
          width: defaultWidth * 0.5,
        ),
        Container(
            //mimic display pic
            width: defaultWidth * 2.5,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.brown)),
        Container(
          width: defaultWidth * 0.5,
        ),
        Container(
            width: defaultWidth * 4.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: defaultHeight * 1.8,
                ),
                Text(username,
                    style: TextStyle(
                        color: primaryColor, fontSize: defaultWidth * 0.8)),
                Container(
                  height: defaultHeight * 0.5,
                ),
                Text(time, style: TextStyle(fontSize: defaultWidth * 0.45))
              ],
            )),
        IconButton(
            onPressed: () {},
            icon:
                Icon(Icons.person_add_alt_1_rounded, size: defaultWidth * 0.8))
      ],
    );
  }

  Future<void> getData() async {
    List<String> friendIdList =
        await DatabaseService().getFriendList(user!.uid);
    String name = await DatabaseService().getUserName(user!.uid);

    currUser = new UserModel(name, 0, 0);

    for (var id in friendIdList) {
      String name = await DatabaseService().getUserName(id);
      friendList.add(new UserModel(name, 0, 0));
    }

    setState(() {
      loading = false;
    });
  }
}
