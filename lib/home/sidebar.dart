import 'package:cosmocat/Login/log_in.dart';
import 'package:cosmocat/Town/town.dart';
import 'package:cosmocat/collection/collection.dart';
import 'package:cosmocat/constant.dart';
import 'package:cosmocat/friendboard/friendboard_page.dart';
import 'package:cosmocat/shop/shop_page.dart';
import 'package:cosmocat/statistics/statistics_page.dart';
import 'package:flutter/material.dart';
import '../size_config.dart';

class SideBar extends StatefulWidget {
  final int stars;

  SideBar(this.stars);

  @override
  _SideBarState createState() => _SideBarState(stars);
}

class _SideBarState extends State<SideBar> {
  int stars;
  bool _selected = false;
  double defaultWidth = SizeConfig.screenWidth! * 0.1;
  double defaultHeight = SizeConfig.screenHeight! * 0.1;

  _SideBarState(this.stars);

  @override
  Widget build(BuildContext context) {
    return user!.isAnonymous
        ? _guest()
        : Stack(
            children: [
              Positioned(right: 0, top: 0, child: _starCount()),
              AnimatedPositioned(
                  right: _selected ? 0 : -defaultWidth * 2.5,
                  top: defaultHeight * 0.7,
                  child: _iconDrawer(),
                  duration: Duration(milliseconds: 500))
            ],
          );
  }

  Widget _guest() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            height: SizeConfig.screenHeight! * 0.05,
          ),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => LoginScreen()));
              },
              child: Text("Log In")),
          Text("to view more features")
        ],
      ),
    );
  }

  Widget _starCount() {
    return Row(
      children: <Widget>[
        Icon(
          Icons.star,
          color: Colors.yellow,
          size: defaultWidth * 0.8,
        ),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.fromLTRB(5.0, 0, 5.0, 0),
          width: 45,
          height: 30,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.white, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Text(
            "$stars",
            style: TextStyle(fontWeight: FontWeight.bold),
          ), //Number of stars of the users
        )
      ],
    );
  }

  Widget _iconDrawer() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20))),
          child: IconButton(
              onPressed: () {
                _selected = !_selected;
                if (this.mounted) {
                  setState(() {});
                }
                print("sidebar selected: $_selected");
              },
              icon: _selected
                  ? Icon(Icons.arrow_right_rounded)
                  : Icon(Icons.arrow_left_rounded)),
        ),
        Container(
          child: Row(
            children: [
              Column(
                children: [
                  IconButton(
                    //collection button
                    padding: EdgeInsets.all(4.0),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => Collection()));
                    },
                    icon: Icon(Icons.import_contacts_rounded),
                    color: themeSecondaryColor,
                  ),
                  IconButton(
                      padding: EdgeInsets.fromLTRB(4.0, 0, 4.0, 00),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => Friendboard()));
                      },
                      icon: Icon(Icons.group),
                      color: themeSecondaryColor),
                  IconButton(
                      padding: EdgeInsets.fromLTRB(4.0, 0, 4.0, 0),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => StatisticsPage()));
                      },
                      icon: Icon(Icons.bar_chart_rounded),
                      color: themeSecondaryColor),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    //shop button
                    padding: EdgeInsets.fromLTRB(4.0, 0, 4.0, 0),
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => Shop()));
                    },
                    icon: Icon(Icons.storefront),
                    color: themeSecondaryColor,
                  ),
                  IconButton(
                      padding: EdgeInsets.fromLTRB(4.0, 0, 4.0, 0),
                      onPressed: () {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (_) => Town()));
                      },
                      icon: Icon(Icons.home_rounded),
                      color: themeSecondaryColor),
                ],
              )
            ],
          ),
          height: defaultHeight * 2.2,
          width: defaultWidth * 2.5,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5))),
        )
      ],
    );
  }
}
