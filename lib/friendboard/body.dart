import 'package:flutter/material.dart';
import '../size_config.dart';
import '../backgroud.dart';

class Body extends StatelessWidget {
  Set<String> friendList = {"id1", "id2"};
  double screenHeight = SizeConfig.screenHeight!;
  @override
  Widget build(BuildContext context) {
    return Background(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: screenHeight * 2 / 11,
        ),
        Container(
          height: screenHeight * 7 / 11,
          child: ListView.builder(
              itemCount: friendList.length,
              itemBuilder: (context, index) {
                return Container();
              }),
          decoration: BoxDecoration(color: Colors.black),
        ),
        Container(
          height: screenHeight * 2 / 11,
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.5),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(40.0),
                  topRight: const Radius.circular(40.0))),
        )
      ],
    ));
  }
}
