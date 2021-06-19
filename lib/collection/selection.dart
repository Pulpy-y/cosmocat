import 'package:cosmocat/animals/animal.dart';
import 'package:flutter/material.dart';

import '../size_config.dart';

class Selection extends StatelessWidget {
  final Set<String> userAnimals = {"0", "1"};

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize!;

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
    if (userAnimals.contains(animalList[index].id)) {
      return ListTile(
        onTap: () {},
        title: Text(animalList[index].name),
        leading: CircleAvatar(
          backgroundImage: AssetImage(
              'assets/image/animal_profile/${animalList[index].id}.png'),
        ),
      );
    }

    return ListTile(
        onTap: () {},
        title: Text("??? document locked"),
        leading: Icon(Icons.lock));
  }
}
