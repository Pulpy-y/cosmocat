import 'package:flutter/material.dart';
import '../backgroud.dart';
import '../size_config.dart';
import "package:cosmocat/animals/animal.dart";

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize!;

    return Background(
      child: Padding(
          padding:
              EdgeInsets.only(top: defaultSize * 5, right: defaultSize * 0.5),
          child: Container(
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage("assets/image/collection_book.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Container(
                  margin: EdgeInsets.fromLTRB(defaultSize * 6, defaultSize * 11,
                      defaultSize * 6, defaultSize * 13),
                  child: ListView.builder(
                      itemCount: animalList.length,
                      itemBuilder: (context, index) {
                        return Card(
                            child: ListTile(
                          onTap: () {},
                          title: Text(animalList[index].name),
                          leading: CircleAvatar(
                            backgroundImage: AssetImage(
                                'assets/image/animal_profile/${animalList[index].id}.png'),
                          ),
                        ));
                      })))),
    );
  }
}
