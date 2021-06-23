import 'package:cosmocat/size_config.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../constant.dart';

class Match extends StatefulWidget {
  @override
  _MatchState createState() => _MatchState();
}

class _MatchState extends State<Match> {
  double defaultSize = SizeConfig.defaultSize!;
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(),
      Padding(
          padding: EdgeInsets.fromLTRB(defaultSize * 10, defaultSize * 33,
              defaultSize * 10, defaultSize * 10),
          child: TextButton(
            child: Shimmer.fromColors(
                baseColor: Colors.red,
                highlightColor: Colors.yellow,
                enabled: true,
                child:
                    Text("Match", style: TextStyle(fontSize: defaultSize * 3))),
            onPressed: () {},
            style: TextButton.styleFrom(
                primary: primaryColor,
                backgroundColor: primaryColor,
                shadowColor: Colors.yellow,
                elevation: 10,
                padding: EdgeInsets.fromLTRB(defaultSize * 5, defaultSize * 1.2,
                    defaultSize * 5, defaultSize * 1.2),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(defaultSize * 3.6), //36
                    side: BorderSide(color: Colors.white))),
          ))
    ]);
  }

  //a func that pick the animal
  //a func that determine whether the user has enough stars
}
