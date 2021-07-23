import 'package:cosmocat/Login/log_in.dart';
import 'package:cosmocat/Town/town.dart';
import 'package:cosmocat/collection/collection.dart';
import 'package:cosmocat/components/loading.dart';
import 'package:cosmocat/constant.dart';
import 'package:cosmocat/friendboard/friendboard_page.dart';
import 'package:cosmocat/shop/shop_page.dart';
import 'package:cosmocat/statistics/statistics_page.dart';
import 'package:flutter/material.dart';

import '../size_config.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {


  @override
  Widget build(BuildContext context) {
    return user!.isAnonymous
        ? _guest()
        : Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Column(children: <Widget>[
                    IconButton(
                      //collection button
                      padding: EdgeInsets.all(4.0),

                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => Collection()));
                      },
                      icon: Icon(Icons.import_contacts_rounded),
                      color: Colors.white,
                    ),
                    IconButton(
                      //shop button
                      padding: EdgeInsets.fromLTRB(4.0, 0, 4.0, 0),
                      onPressed: () {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (_) => Shop()));
                      },
                      icon: Icon(Icons.storefront),
                      color: Colors.white,
                    ),
                    IconButton(
                        padding: EdgeInsets.fromLTRB(4.0, 0, 4.0, 00),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => Friendboard()));
                        },
                        icon: Icon(Icons.group),
                        color: Colors.white),
                    IconButton(
                        padding: EdgeInsets.fromLTRB(4.0, 0, 4.0, 0),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => StatisticsPage()));
                        },
                        icon: Icon(Icons.bar_chart_rounded),
                        color: Colors.white),
                    IconButton(
                        padding: EdgeInsets.fromLTRB(4.0, 0, 4.0, 0),
                        onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => Town()));
                    },
                    icon: Icon(Icons.home_rounded),
                    color: Colors.white)        
                  ])
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
}
