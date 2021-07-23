import 'package:cosmocat/count_down/count_down_page.dart';
import 'package:cosmocat/models/todo_model.dart';
import 'package:flutter/material.dart';

import '../constant.dart';
import '../database.dart';
import '../size_config.dart';

class Selection extends StatefulWidget {
  @override
  _SelectionState createState() => _SelectionState();
}

class _SelectionState extends State<Selection> {
  List<ToDoModel> todoList = [];
  List<List<ToDoModel>> collection = [];
  List<bool> dailyCompletion = [];
  double defaultSize = SizeConfig.defaultSize!;
  double screenHeight = SizeConfig.screenHeight!;
  double screenWidth = SizeConfig.screenWidth!;
  int selectedIndex = -1;

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (todoList.isEmpty)
      return Container(
        alignment: Alignment.center,
        child: Text("You do not have any todo yet!"),
      );

    if (selectedIndex != -1) {
      return Container(child: dailyTodoInfo());
    }

    return Container(
        margin: EdgeInsets.fromLTRB(defaultSize * 6, defaultSize * 11,
            defaultSize * 6, defaultSize * 13),
        child: ListView.builder(
            itemCount: collection.length,
            itemBuilder: (context, index) {
              return Card(child: _buildTile(index));
            }));
  }

  ListTile _buildTile(int index) {
    Color signColor = dailyCompletion[index] ? Colors.green : Colors.red;
    return ListTile(
      onTap: () {
        if (this.mounted) {
          setState(() {
            selectedIndex = index;
          });
        }
      },
      title: Text(
          collection[index].first.startDatetime.toString().substring(0, 11)),
      trailing: Icon(
        Icons.circle,
        color: signColor,
      ),
    );
  }

  Widget dailyTodoInfo() {
    return Column(
      children: <Widget>[
        Container(
          height: screenHeight * 0.15,
          //decoration: BoxDecoration(color: Colors.black),
        ),
        Container(
            height: screenHeight * 0.57,
            child: ListView.builder(
                itemCount: collection[selectedIndex].length,
                itemBuilder: (context, index) {
                  return Container(
                      margin: EdgeInsets.fromLTRB(
                          defaultSize * 6, 0, defaultSize * 6, 0),
                      child: Card(child: _buildTodoTile(index)));
                })),
        Row(
          children: [
            Container(width: screenWidth * 0.7),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                    top: defaultSize * -2.5,
                    right: defaultSize * -1.2,
                    child: Image(
                      image: AssetImage('assets/image/paw.png'),
                    )),
                IconButton(
                    onPressed: () {
                      if (this.mounted) {
                        setState(() {
                          makeTodoCollection(todoList);
                          selectedIndex = -1; //go back to selction view
                        });
                      }
                    },
                    icon: Icon(Icons.keyboard_return_rounded,
                        color: Colors.white, size: defaultSize * 3)),
              ],
            )
          ],
        )
      ],
    );
  }

  ListTile _buildTodoTile(int index) {
    ToDoModel todo = collection[selectedIndex][index];
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
      leading: Checkbox(
        value: todo.isDone,
        onChanged: (value) {
          todo.isDone = value!;
          DatabaseService().updateTodoIsDone(todo, value);
          if (this.mounted) setState(() {});
        },
      ),
      title: Text(todo.category),
      subtitle: Text(todo.startDatetime.toString().substring(0, 16)),
      trailing: TextButton(
        child: Text(
          "start",
          style: TextStyle(color: Colors.white),
        ), //Icon(Icons.arrow_right_alt_rounded)
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => CountDown.fromTodo(todo.durationHour,
                      todo.durationMinute, todo.category, todo.austronautId)));
          DatabaseService().updateTodoIsDone(todo, true);
        },
      ),
      dense: true,
      tileColor: themeSecondaryColor,
    );
  }

  void getData() async {
    todoList = await DatabaseService().getTodo();
    if (todoList.isEmpty) return;

    todoList.sort((o1, o2) => o1.startDatetime.compareTo(o2.startDatetime));
    makeTodoCollection(todoList);
    if (this.mounted) setState(() {});
  }

  void makeTodoCollection(List<ToDoModel> todoList) {
    collection = [];
    dailyCompletion = [];
    DateTime curr = todoList.first.startDatetime;
    int index = 0;

    while (index != todoList.length) {
      List<ToDoModel> currCollection = [];
      bool isComplete = true;
      while (isSameDay(todoList[index].startDatetime, curr)) {
        ToDoModel todo = todoList[index];
        currCollection.add(todo);
        if (!todo.isDone) {
          isComplete = false;
        }

        index += 1;
        if (index == todoList.length) {
          break;
        }
      }

      collection.add(currCollection);
      dailyCompletion.add(isComplete);
      if (index == todoList.length) {
        break;
      }
      curr = todoList[index].startDatetime;
    }
  }

  bool isSameDay(DateTime o1, DateTime o2) {
    return (o1.day == o2.day) & (o1.month == o2.month) & (o1.year == o2.year);
  }
}
