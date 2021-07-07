import 'package:flutter/material.dart';

import '../size_config.dart';

class Info extends StatelessWidget {
  const Info({
    required this.name,
    required this.image,
  });
  final String name, image;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize!;

    return SizedBox(
      height: defaultSize * 22, // 240
      child: Stack(
        children: <Widget>[
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
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
                      image: AssetImage(image),
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
        ],
      ),
    );
  }
}
