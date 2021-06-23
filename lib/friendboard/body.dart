import 'package:cosmocat/constant.dart';
import 'package:flutter/material.dart';
import '../size_config.dart';
import '../backgroud.dart';

class Body extends StatelessWidget {
  List<String> friendList = ["id1", "id2"]; //rmb to add the player it self
  double screenHeight = SizeConfig.screenHeight!;
  double screenWidth = SizeConfig.screenWidth!;

  @override
  Widget build(BuildContext context) {
    double defaultWidth = screenWidth * 0.1;

    return Background(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: screenHeight * 2 / 11,
        ),
        Container(
          height: screenHeight * 7 / 11,
          child: ListView.builder(
              itemCount: friendList.length,
              itemBuilder: (context, index) {
                return Card(
                    margin: EdgeInsets.only(top: defaultWidth * 0.5),
                    color: Colors.white.withOpacity(0.6),
                    child: rankTile(index, friendList[index], "0 hr 0 min"));
              }),
          //decoration: BoxDecoration(color: Colors.black),
        ),
        Container(
          height: screenHeight * 2 / 11,
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.5),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(40.0),
                  topRight: const Radius.circular(40.0))),
          child: selfInfo("bitch", "O hr 0 min"),
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

  Widget rankTile(int index, String username, String time) {
    double defaultWidth = screenWidth * 0.1;
    double defaultHeight = screenHeight * 7 / 11 * 6;

    return ListTile(
      leading: Text((index + 1).toString()),
      tileColor: Colors.transparent,
      title: Text(username),
      subtitle: Text(time),
    );
  }
}
