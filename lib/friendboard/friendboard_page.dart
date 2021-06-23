import 'package:flutter/material.dart';
import '../size_config.dart';
import 'body.dart';

class Friendboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: const Text('Friendboard'),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                text: "Day",
              ),
              Tab(
                text: "Week",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[Body(), Body()], //day and week, need to pass vars
        ),
      ),
    );
  }
}
