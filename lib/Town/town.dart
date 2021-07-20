import 'package:cosmocat/Town/achievements.dart';
import 'package:cosmocat/Town/empty.dart';
import 'package:cosmocat/Town/members.dart';
import 'package:cosmocat/components/loading.dart';
import 'package:cosmocat/database.dart';
import 'package:flutter/material.dart';

import '../size_config.dart';

class Town extends StatefulWidget {

  @override
  _TownState createState() => _TownState();
}

class _TownState extends State<Town> {
  String town = '';
  bool loading = true;

  @override
  void initState() {
    getTown();
    super.initState();
  }

  void getTown() async {
    town = await DatabaseService().getTown();
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: const Text('Town'),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                text: "Members",
              ),
              Tab(
                text: "Achievements",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            loading
                ? Loading()
                : town == ''
                ? Empty()
                : Members(town),
            loading
                ? Loading()
                : town == ''
                ? Empty()
                : Achievements(town),
          ], //day and week, need to pass vars
        ),
      ),
    );
  }
}
