import 'dart:collection';
import 'package:cosmocat/components/background.dart';
import 'package:cosmocat/components/loading.dart';
import 'package:cosmocat/components/rounded_button.dart';
import 'package:cosmocat/database.dart';
import 'package:cosmocat/home/home_page.dart';
import 'package:cosmocat/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Members extends StatefulWidget {
  final String town;

  Members(this.town);



  @override
  _MembersState createState() => _MembersState(town);
}

class _MembersState extends State<Members> {
  String town = '';
  Map memberList = new HashMap();
  bool loading = true;

  _MembersState(this.town);

  @override
  void initState() {
    getMembers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Background(
        child: SingleChildScrollView(
          child: Column(
            children: [
              loading? Loading(): Container(
                height: SizeConfig.screenHeight!*0.8,
                child: ListView.builder(
                    itemCount: memberList.length,
                    itemBuilder: (context, index) {
                      String name = memberList.keys.elementAt(index);
                      num stars = memberList[name];
                      return Card(
                          margin: EdgeInsets.only(top: SizeConfig.screenWidth! * 0.05),
                          color: Colors.white.withOpacity(0.6),
                          child: rankTile(index, name, stars));
                    }),
              ),
              RoundedButton(text: "Quit town", press: () async {
                await DatabaseService().deleteUserFromTown(town).then((value){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('You have left the town!'),
                    ),
                  );
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => HomePage()));
                });
              })
            ],
          ),
        )
    );
  }

  Widget rankTile(int index, String name, num stars) {

    return ListTile(
      leading: Text((index + 1).toString()),
      tileColor: Colors.transparent,
      title: Text(name),
      subtitle: Text("$stars stars"),
    );
  }

  Future<void> getMembers() async {
    memberList = await DatabaseService().getTownMemberAndStars(town);
    setState(() {
      loading = false;
    });
  }
}
