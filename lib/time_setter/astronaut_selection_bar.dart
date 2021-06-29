import 'package:cosmocat/Login/log_in.dart';
import 'package:cosmocat/constant.dart';
import 'package:cosmocat/database.dart';
import 'package:cosmocat/size_config.dart';
import 'package:flutter/material.dart';

class AstronautSelectionBar extends StatefulWidget {
  @override
  _AstronautSelectionBarState createState() => _AstronautSelectionBarState();
}

class _AstronautSelectionBarState extends State<AstronautSelectionBar> {
  double defaultSize = SizeConfig.defaultSize!;
  List<String> astronautIdList = ["0"];
  String selectedAnimal = "0";

  @override
  void initState() {
    getAnimalList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(
            defaultSize * 1.6, defaultSize * 0.5, defaultSize * 1.6, 0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  child: Text(
                    "Astronaut",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: defaultSize * 2.2, // 22
                    ),
                    textAlign: TextAlign.left,
                  ),
                  margin: EdgeInsets.all(defaultSize * 1.8) // 18
                  ),
              Row(
                children: [
                  Container(
                    // astronaut img
                    margin: EdgeInsets.fromLTRB(defaultSize * 3, defaultSize,
                        defaultSize * 3, defaultSize), //20
                    height: defaultSize * 12, //140
                    width: defaultSize * 14,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: defaultSize * 0.8, //8
                      ),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(_combineImagePath(selectedAnimal)),
                      ),
                    ),
                  ),
                  TextButton(
                      onPressed: () => _selectAnimalDialog(),
                      child: Text(
                        "change",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ))
                ],
              )
            ]));
  }

  Future<void> _selectAnimalDialog() async {
    List<Widget> tiles = astronautIdList.map((e) => _buildGridTile(e)).toList();

    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (_) => AlertDialog(
            title: const Text("Select an animal as your astronaut!"),
            insetPadding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 100),
            contentPadding: EdgeInsets.zero,
            content: Container(
                width: defaultSize, //500
                child: GridView.count(
                  crossAxisCount: 3,
                  children: tiles,
                ))));
  }

  Widget _buildGridTile(String id) {
    String path = _combineImagePath(id);
    return SimpleDialogOption(
      child: Container(padding: EdgeInsets.zero, child: Image.asset(path)),
      onPressed: () {
        setState(() {
          selectedAnimal = id;
        });
        Navigator.pop(context);
      },
    );
  }

  String _combineImagePath(String id) {
    return animal_profile_path + id + ".png";
  }

  Future<void> getAnimalList() async {
    astronautIdList = await DatabaseService().getAnimalList(user!.uid);
  }
}
