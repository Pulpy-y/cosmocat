import 'package:cosmocat/components/background.dart';
import 'package:cosmocat/components/rounded_input_field.dart';
import 'package:cosmocat/home/home_page.dart';
import 'package:cosmocat/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../database.dart';

class CreateTown extends StatefulWidget {

  @override
  _CreateTownState createState() => _CreateTownState();
}

class _CreateTownState extends State<CreateTown> {

  String searchName = '';
  int state = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        //fix pixel overflow
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text("Create Town"),
          centerTitle: true,
        ),
        body: Background(
          child: Column(
            children: <Widget>[
              Container(
                //color: Colors.lightBlue,
                height: SizeConfig.screenHeight! * 0.2,
              ),
              RoundedInputField(
                  hintText: "town name",
                  onChanged: (value) async {
                    searchName = value;
                    bool townExists = await DatabaseService().isTownExist(value);
                    setState(() {
                      if (townExists) {
                        state = 1;
                      } else {
                        state = -1;
                      }
                    });
                  }),
              Container(
                  margin: EdgeInsets.only(top: SizeConfig.screenHeight! * 0.05),
                  child: searchResult()),
              if (state == -1)
                TextButton(
                    onPressed: () async {
                      DatabaseService().addTown(searchName).then((value){
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text('You have created the town!'),
                          ),
                        );
                        Navigator.push(
                            context, MaterialPageRoute(builder: (_) => HomePage()));
                      });
                    },
                    child: Text('Create this town'))
            ],
          ),)
    );
  }

  Widget searchResult() {
    if (state == 0) return Container();

    return state == 1
        ? Card(
        child: ListTile(
          leading: Icon(Icons.account_circle),
          title: Text(searchName),
          trailing: IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              DatabaseService().addUserToTown(searchName);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('You have joined the town!'),
                ),
              );
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => HomePage()));
            },
          ),
        )
    )
        : Card(
        child: ListTile(
          title: Text("Town not found"),
        ));
  }

}
    
