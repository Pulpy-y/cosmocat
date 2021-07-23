import 'package:cosmocat/Login/log_in.dart';
import 'package:cosmocat/database.dart';
import 'package:flutter/material.dart';
import '../size_config.dart';

class Info extends StatefulWidget {
  const Info({
    required this.name,
    required this.userAnimal,
  });
  final String name;
  final String userAnimal;

  @override
  _InfoState createState() => _InfoState(name, userAnimal);
}

class _InfoState extends State<Info> {
  double defaultSize = SizeConfig.defaultSize!;
  double defualtHeight = SizeConfig.screenHeight! / 10;
  String name;
  String userAnimal;
  List<String> astronautIdList = ["0"];

  _InfoState(this.name, this.userAnimal);

  @override
  void initState() {
    super.initState();
    getAnimalList();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: defualtHeight * 3, // 240
        child: Stack(children: <Widget>[
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  child: InkWell(
                    onTap: () => _selectAnimalDialog(),
                  ),
                  margin: EdgeInsets.only(bottom: defaultSize), //10
                  height: defaultSize * 14, //140
                  width: defaultSize * 14,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: defaultSize * 0.8, //8
                    ),
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage(
                          "assets/image/animal_floating/$userAnimal.png"),
                    ),
                  ),
                ),
                Text(
                  name,
                  style: TextStyle(
                    fontSize: defaultSize * 2.2, // 22
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: defaultSize / 2), //5
              ],
            ),
          )
        ]));
  }

  Future<void> getAnimalList() async {
    astronautIdList = await DatabaseService().getAnimalList(user!.uid);
  }

  Future<void> _selectAnimalDialog() async {
    List<Widget> tiles = astronautIdList.map((e) => _buildGridTile(e)).toList();

    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (_) => AlertDialog(
            title: const Text("Choose your profile animal ฅ•ω•ฅ"),
            insetPadding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 100),
            contentPadding: EdgeInsets.zero,
            content: Container(
                height: defualtHeight * 5,
                width: defaultSize,
                child: GridView.count(
                  crossAxisCount: 3,
                  children: tiles,
                ))));
  }

  Widget _buildGridTile(String id) {
    String path = "assets/image/animal_floating/$id.png";
    return SimpleDialogOption(
      child: Container(padding: EdgeInsets.zero, child: Image.asset(path)),
      onPressed: () {
        setState(() {
          userAnimal = id;
          DatabaseService().updateProfileAnimal(id);
        });
        Navigator.pop(context);
      },
    );
  }
}
