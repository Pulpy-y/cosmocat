import 'package:cosmocat/Login/log_in.dart';
import 'package:cosmocat/models/animal.dart';
import 'package:cosmocat/database.dart';
import 'package:flutter/material.dart';
import '../constant.dart';
import '../size_config.dart';

class Selection extends StatefulWidget {
  @override
  _SelectionState createState() => _SelectionState();
}

class _SelectionState extends State<Selection> {
  List<String> userAnimals = [];
  double defaultSize = SizeConfig.defaultSize!;
  double screenHeight = SizeConfig.screenHeight!;
  double screenWidth = SizeConfig.screenWidth!;
  String selectedID = "-1";

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (selectedID != "-1") {
      return Container(child: animalInfo());
    }

    return Container(
        margin: EdgeInsets.fromLTRB(defaultSize * 6, defaultSize * 11,
            defaultSize * 6, defaultSize * 13),
        child: ListView.builder(
            itemCount: animalList.length,
            itemBuilder: (context, index) {
              return Card(child: _buildTile(index));
            }));
  }

  ListTile _buildTile(int index) {
    String animalID = animalList[index].id;
    if (userAnimals.contains(animalID)) {
      return ListTile(
        onTap: () {
          setState(() {
            selectedID = animalID;
          });
        },
        title: Text(animalList[index].name),
        leading: CircleAvatar(
          backgroundColor: Colors.white,
          backgroundImage: AssetImage('$animal_profile_path$animalID.png'),
        ),
      );
    }

    return ListTile(
        onTap: () {
          showDialog<void>(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                    title: const Text('Coma has not met this animal yet!'),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: const <Widget>[
                          Text(
                              'Go to exchange station to make some friends XD'),
                        ],
                      ),
                    ));
              });
        },
        title: Text("??? document locked"),
        leading: Icon(Icons.lock));
  }

  Widget animalInfo() {
    return Column(
      children: <Widget>[
        Container(
          height: screenHeight * 0.15,
          //decoration: BoxDecoration(color: Colors.black),
        ),
        Container(
            height: screenHeight * 0.22,
            decoration: BoxDecoration(
                border:
                    Border.all(color: Colors.grey, width: defaultSize * 0.2)),
            child: Image(
                image: AssetImage('$animal_profile_path$selectedID.png'))),
        Container(
            height: screenHeight * 0.35,
            padding: EdgeInsets.all(defaultSize * 1.25),
            child: Image(
              image: AssetImage('$animal_profile_path${selectedID}_des.png'),
            )),
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
                      setState(() {
                        selectedID = "-1"; //go back to selction view
                      });
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

  void getData() async {
    userAnimals = await DatabaseService().getAnimalList(user!.uid);
    setState(() {});
  }
}
