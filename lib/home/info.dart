import 'package:flutter/material.dart';
import '../size_config.dart';

class Info extends StatefulWidget {
  const Info({
    required this.name,
    required this.userAnimal,
  });
  final String name;
  final String userAnimal;

  @override
  _InfoState createState() => _InfoState(name, userAnimal);
}

class _InfoState extends State<Info> {
  String name;
  String userAnimal;

  _InfoState(this.name, this.userAnimal);

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize!;
    double defualtHeight = SizeConfig.screenHeight! / 10;

    return SizedBox(
        height: defualtHeight * 3, // 240
        child: Stack(children: <Widget>[
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: defaultSize), //10
                  height: defaultSize * 14, //140
                  width: defaultSize * 14,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: defaultSize * 0.8, //8
                    ),
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage("assets/image/animal_floating/0.png"),
                    ),
                  ),
                ),
                Text(
                  name,
                  style: TextStyle(
                    fontSize: defaultSize * 2.2, // 22
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: defaultSize / 2), //5
              ],
            ),
          )
        ]));
  }
}
