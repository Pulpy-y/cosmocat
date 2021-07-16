import 'package:cosmocat/constant.dart';
import 'package:cosmocat/count_down/count_down_page.dart';
import 'package:cosmocat/home/todo/todo_setter_page.dart';
import 'package:cosmocat/models/todo_model.dart';
import 'package:flutter/material.dart';
import '../database.dart';
import '../size_config.dart';

class ToDo extends StatefulWidget {
  @override
  _ToDoState createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  double defaultSize = SizeConfig.defaultSize!;
  double defualtHeight = SizeConfig.screenHeight! / 10;

  List<ToDoModel> todoList = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle dividerTextStyle =
        TextStyle(color: themeSecondaryColor, fontWeight: FontWeight.bold);
    DateTime prevDate = DateTime(0);
    bool tileShown = false;
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
                    ),
                    Container(
                        height: defualtHeight * 2.8,
                        child: ListView.builder(
                            //itemExtent: defaultSize * 7,
                            itemCount: todoList.length,
                            itemBuilder: (context, index) {
                              Widget divider = Container();
                              if (todoList[index].isDone) {
                                return Container();
                              }
                              if (!isSameDay(
                                  todoList[index].startDatetime, prevDate)) {
                                if (todoList[index]
                                        .startDatetime
                                        .isBefore(DateTime.now()) &
                                    (!tileShown)) {
                                  divider = Text(
                                    "Overdue",
                                    style: dividerTextStyle,
                                  );
                                  tileShown = true;
                                } else if (todoList[index]
                                    .startDatetime
                                    .isAfter(DateTime.now())) {
                                  divider = Text(
                                      todoList[index]
                                          .startDatetime
                                          .toString()
                                          .split(" ")
                                          .first,
                                      style: dividerTextStyle);

                                  prevDate = todoList[index].startDatetime;
                                }
                              }

                              return Column(children: <Widget>[
                                divider,
                                Card(
                                    color: Colors.transparent,
                                    child: _buildTile(index))
                              ]);
                            })),
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
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => TodoSetter()));
            },
            padding: EdgeInsets.zero,
            icon: Icon(
              Icons.add_rounded,
              color: themeSecondaryColor,
              semanticLabel: "add task",
            ))
      ],
    );
  }

  ListTile _buildTile(int index) {
    ToDoModel todo = todoList[index];
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
      title: Text(todo.category),
      subtitle: Text(todo.startDatetime.toString().substring(0, 16)),
      trailing: IconButton(
        icon: Icon(Icons.arrow_right_alt_rounded),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => CountDown.fromTodo(todo.durationHour,
                      todo.durationMinute, todo.category, todo.austronautId)));
          DatabaseService().updateTodoAsDone(todo);
        },
      ),
      dense: true,
      tileColor: themeSecondaryColor,
    );
  }

  Future<void> getData() async {
    todoList = await DatabaseService().getTodo();
    todoList.sort((o1, o2) => o1.startDatetime.compareTo(o2.startDatetime));
    setState(() {});
  }

  bool isSameDay(DateTime o1, DateTime o2) {
    return (o1.day == o2.day) & (o1.month == o2.month) & (o1.year == o2.year);
  }
}
