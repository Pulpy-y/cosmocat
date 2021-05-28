import 'package:cosmocat/constant.dart';
import 'package:cosmocat/size_config.dart';
import 'package:flutter/material.dart';

class AstronautSelectionBar extends StatefulWidget {
  @override
  _AstronautSelectionBarState createState() => _AstronautSelectionBarState();
}

class _AstronautSelectionBarState extends State<AstronautSelectionBar> {
  double defaultSize = SizeConfig.defaultSize!;
  List<String> astronautIdList = <String>["0", "1", "2", "3"];
  String selectedAnimal = "0";

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(defaultSize * 1.6),
        child: Column(children: <Widget>[
          Container(
              child: Text(
                "Astrounaut",
                style: TextStyle(
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
                  onPressed: () => _selectAnimalDialog(), child: Text("change"))
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
            title: const Text("Select an animal as your astrounaut!"),
            content: Container(
                width: defaultSize * 50, //500
                child: GridView.count(
                  crossAxisCount: 4,
                  children: tiles,
                ))));
  }

  Widget _buildGridTile(String id) {
    String path = _combineImagePath(id);
    return SimpleDialogOption(
      child: Image.asset(path),
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
}
