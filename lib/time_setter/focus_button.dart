import 'package:cosmocat/count_down/count_down_page.dart';
import 'package:cosmocat/database.dart';
import 'package:cosmocat/home/home_page.dart';
import 'package:cosmocat/models/todo_model.dart';
import 'package:cosmocat/time_setter/page_variable.dart';
import 'package:flutter/material.dart';
import '../constant.dart';
import '../size_config.dart';

class FocusButton extends StatefulWidget {
  String _buttonText = "Focus Now";
  FocusButton(this._buttonText);

  @override
  _FocusButtonState createState() => _FocusButtonState(_buttonText);
}

class _FocusButtonState extends State<FocusButton> {
  String _buttonText;
  _FocusButtonState(this._buttonText);

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize!;
    return Container(
        alignment: Alignment.center,
        child: TextButton(
          child: Text(_buttonText,
              style: TextStyle(
                  fontSize: defaultSize * 2,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          onPressed: () {
            if (!selected) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Please select a tag!"),
              ));
            } else if (hour == 0 && minute == 0) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Please select a duration!"),
              ));
            } else {
              if (_buttonText == "Focus Now") {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => CountDown(
                            hour: hour, minute: minute, tag: selectedTag!)));
              } else {
                ToDoModel todo = new ToDoModel(todoStartDate, selectedTag!,
                    hour, minute, selectedAnimal, false);
                DatabaseService().addTodo(todo).then((value) =>
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Todo task added successfully!"),
                    )));
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => HomePage()));
              }
            }
          },
          style: TextButton.styleFrom(
              primary: primaryColor,
              backgroundColor: primaryColor,
              shadowColor: themeSecondaryColor,
              elevation: 10,
              padding: EdgeInsets.fromLTRB(defaultSize * 5, defaultSize * 1.2,
                  defaultSize * 5, defaultSize * 1.2),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(defaultSize * 3.6), //36
                  side: BorderSide(color: Colors.white))),
        ));
  }
}
