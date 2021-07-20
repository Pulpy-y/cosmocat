import 'package:cosmocat/Login/log_in.dart';
import 'package:cosmocat/models/animal.dart';
import 'package:cosmocat/database.dart';
import 'package:cosmocat/size_config.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'dart:math';

import '../constant.dart';

class Match extends StatefulWidget {
  @override
  _MatchState createState() => _MatchState();
}

class _MatchState extends State<Match> {
  double defaultSize = SizeConfig.defaultSize!;
  double screenHeight = SizeConfig.screenHeight!;
  double screenWidth = SizeConfig.screenWidth!;
  bool _bigger = false;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
        height: defaultSize * 30,
      ),
      TextButton(
        child: Shimmer.fromColors(
            baseColor: Colors.red,
            highlightColor: Colors.yellow,
            enabled: true,
            child: Text("Match", style: TextStyle(fontSize: defaultSize * 3))),
        onPressed: () => _matchDialogWidget(),
        style: TextButton.styleFrom(
            primary: primaryColor,
            backgroundColor: primaryColor,
            shadowColor: Colors.yellow,
            elevation: 10,
            padding: EdgeInsets.fromLTRB(defaultSize * 5, defaultSize * 1.2,
                defaultSize * 5, defaultSize * 1.2),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(defaultSize * 3.6), //36
                side: BorderSide(color: Colors.white))),
      )
    ]);
  }

  Future<void> _matchDialogWidget() async {
    String message = "";
    bool success = true;

    if (!await hasEnoughStars()) {
      message = "You don't have enough stars mew ~";
      success = false;
    }

    var selectedAnimal = await pickAnimal();

    if (selectedAnimal.id == "0") {
      message = "Fufu~ seems like you already know everyone";
      success = false;
    }

    if (success) {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (_) => AlertDialog(
                title:
                    Text("Mystery shop owner has introduce you a new friend!"),
                content: AnimatedContainer(
                  duration: Duration(seconds: 2),
                  padding: _bigger
                      ? EdgeInsets.all(defaultSize)
                      : EdgeInsets.all(defaultSize * 10),
                  child: Image(
                    image: AssetImage(
                        "$animal_profile_path${selectedAnimal.id}.png"),
                  ),
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        _bigger = false;
                        Navigator.of(context).pop();
                      },
                      child: Text("Yay"))
                ],
              ));
      _bigger = true;
      //minus stars
      DatabaseService().updateStars(-50);
      //add animals
      DatabaseService().addAnimal(user!.uid, selectedAnimal.id);
    } else {
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: Text(message),
                content: Container(
                  height: screenHeight * 0.2,
                ),
              ));
    }
  }

  //a func that pick the animal
  Future<Animal> pickAnimal() async {
    var userAnimals = await DatabaseService().getAnimalList(user!.uid);
    List<Animal> uncatchAnimals = [];
    for (var animal in animalList) {
      if (!userAnimals.contains(animal.id)) uncatchAnimals.add(animal);
    }

    var _random = Random();

    return uncatchAnimals.length == 0
        ? animalList.first
        : uncatchAnimals[_random.nextInt(uncatchAnimals.length)];
  }

  //a func that determine whether the user has enough stars

  Future<bool> hasEnoughStars() async {
    return await DatabaseService().getStars() >= 50;
  }
}
