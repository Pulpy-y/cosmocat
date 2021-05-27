import 'package:cosmocat/size_config.dart';
import 'package:flutter/material.dart';

class AstronautSelectionBar extends StatefulWidget {
  @override
  _AstronautSelectionBarState createState() => _AstronautSelectionBarState();
}

class _AstronautSelectionBarState extends State<AstronautSelectionBar> {
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize!;
    String selectedAnimal = "assets/image/animal_profile/pig_profile.png";

    return Padding(
        padding: EdgeInsets.all(defaultSize * 1.6),
        child: Column(children: <Widget>[
          Container(
              child: Text(
                "Who's your astronaut today?",
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
                margin: EdgeInsets.only(bottom: defaultSize), //10
                height: defaultSize * 14, //140
                width: defaultSize * 14,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: defaultSize * 0.8, //8
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(selectedAnimal),
                  ),
                ),
              ),
              TextButton(onPressed: null, child: Text("change"))
            ],
          )
        ]));
  }
}
