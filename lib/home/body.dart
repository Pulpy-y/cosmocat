import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cosmocat/constant.dart';
import '../size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize!;
    const profile_img = "assets/image/coma_as.png";
    const user_name = "bitch";

    return SizedBox(
      height: defaultSize * 24, // 240
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: CustomShape(),
            child: Container(
              height: defaultSize * 18, //150
              color: primaryColor,
            ),
          ),
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
                      image: AssetImage(profile_img),
                    ),
                  ),
                ),
                Text(
                  user_name,
                  style: TextStyle(
                    fontSize: defaultSize * 2.2, // 22
                    color: primaryColor,
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

class CustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    double height = size.height;
    double width = size.width;
    path.lineTo(0, height - 100);
    path.quadraticBezierTo(width / 2, height, width, height - 100);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
