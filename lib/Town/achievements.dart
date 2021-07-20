import 'package:cosmocat/components/loading.dart';
import 'package:cosmocat/components/town_background.dart';
import 'package:cosmocat/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../database.dart';
import '../size_config.dart';

class Achievements extends StatefulWidget {
  Achievements(this.town);
  final String town;

  @override
  _AchievementsState createState() => _AchievementsState(town);
}

class _AchievementsState extends State<Achievements> {
  bool loading = true;
  List<num> dayMemberList =[];
  String town = '';
  List<bool> rewardClaimed = [true, true, true, true, true];

  _AchievementsState(this.town);


  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TownBackground(child: SingleChildScrollView(
      child: Column(
        children: [
          loading? Loading():
          Container(
            height: SizeConfig.screenHeight!*0.8,
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Card(
                      margin: EdgeInsets.only(top: SizeConfig.screenWidth! * 0.05),
                      color: Colors.white.withOpacity(0.6),
                      child: rewardTile(index));
                }),
          )
        ],
      ),
    ));
  }

  Widget rewardTile(int index) {
    String title = '';
    String description = '';
    num current = 0;
    num target = 0;
    num memberNum = dayMemberList.length;
    num currentFocusTime = dayMemberList.reduce((a, b) => a + b);

    if(index == 0) {
      title = 'A1';
      description = 'Every member focuses today';
      target = memberNum;
      current = dayMemberList.where((time) => time > 0).length;
    } else if (index == 1) {
      title = 'A2';
      description = 'Every member focuses >= 20 today';
      target = memberNum;
      current = dayMemberList.where((time) => time > 20).length;

    } else if (index == 2) {
      title = 'A3';
      description = 'Total focus time in town today >= 50';
      target = 50;
      current = currentFocusTime;
    } else if (index == 3) {
      title = 'A4';
      description = 'Total focus time in town today >= 100';
      target = 100;
      current = currentFocusTime;
    } else if (index == 4) {
      title = 'A5';
      description = 'Town member >= 5';
      target = 5;
      current = memberNum;
    }

    return ListTile(
      leading: Icon(Icons.stars),
      tileColor: Colors.transparent,
      title: Text("$title - $current/$target"),
      subtitle: Text(description),
      trailing: rewardClaimed[index]
          ? TextButton(
              onPressed: () {  },
              child: Text("Claimed", style: TextStyle(color: Colors.grey)))
          : TextButton(
              onPressed: () {
                if (current >= target) {
                  DatabaseService().claimReward(index, date);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('+10 stars'),
                    ),
                  );
                  setState(() {
                    rewardClaimed[index] = true;
                  });
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('You have not achieved this ~'),
                    ),
                  );
                }
    },
              child: Text("Claim", style: TextStyle(color: Colors.white))),
    );
  }

  Future<void> getData() async {
    dayMemberList = await DatabaseService().getDayMemberList(town, date);
    for(int i = 0; i<5 ; i++) {
      rewardClaimed[i] = await DatabaseService().isRewardClaimed(i, date);
    }
    setState(() {
      loading = false;
    });
  }



}
