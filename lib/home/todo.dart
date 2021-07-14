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
            child: Container(
                width: SizeConfig.screenWidth,
                padding: EdgeInsets.fromLTRB(
                    defaultSize * 1.5, defaultSize * 0.5, defaultSize * 1.5, 0),
                child: Column(
                  children: <Widget>[
                    todoTitle(),
                    Divider(
                      color: Colors.white,
                    )
                  ],
                ))));
  }

  Widget todoTitle() {
    return Row(
      children: <Widget>[
        Text(
          'Todo List',
          style: TextStyle(
            color: themeSecondaryColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        IconButton(
            onPressed: () {},
            padding: EdgeInsets.zero,
            icon: Icon(
              Icons.add_rounded,
              color: themeSecondaryColor,
              semanticLabel: "add task",
            ))
      ],
    );
  }
}
