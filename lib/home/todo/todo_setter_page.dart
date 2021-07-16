import 'package:flutter/material.dart';
import '../../size_config.dart';
import 'body.dart';

class TodoSetter extends StatefulWidget {
  @override
  _TodoSetterState createState() => _TodoSetterState();
}

class _TodoSetterState extends State<TodoSetter> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            title: const Text('New Todo Task'),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Body()),
    );
  }
}
