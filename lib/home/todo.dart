import 'package:cosmocat/constant.dart';
import 'package:flutter/material.dart';

import '../size_config.dart';

class ToDo extends StatefulWidget {
  @override
  _ToDoState createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  double defaultSize = SizeConfig.defaultSize!;
  double defualtHeight = SizeConfig.screenHeight! / 10;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: defualtHeight * 4.5,
        padding: EdgeInsets.all(defaultSize * 1.5),
        child: Card(
            color: primaryColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            child: Container(width: SizeConfig.screenWidth, child: Column())));
  }

  Widget TodoTitle() {
    return Row(
      children: [],
    );
  }
}
