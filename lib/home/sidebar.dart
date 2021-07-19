import 'package:cosmocat/Login/log_in.dart';
import 'package:cosmocat/collection/collection.dart';
import 'package:cosmocat/components/loading.dart';
import 'package:cosmocat/constant.dart';
import 'package:cosmocat/friendboard/friendboard_page.dart';
import 'package:cosmocat/shop/shop_page.dart';
import 'package:cosmocat/statistics/statistics_page.dart';
import 'package:flutter/material.dart';
import 'package:cosmocat/database.dart';

import '../size_config.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  int stars = 0;
  bool loading = true;

  @override
  void initState() {
    getData();
    super.initState();
  }

  Future<void> getData() async {
    stars = await DatabaseService().getStars();
    print("get data: stars:$stars");
    if (this.mounted) {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return user!.isAnonymous
        ? _guest()
        : loading
            ? Loading()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  /*
        SizedBox(
          height: SizeConfig.screenHeight! * 0.01,
        ),

         */
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(5),
                        width: 40,
                        height: 25,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: primaryColor, width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Text("$stars"), //Number of stars of the users
                      )
                    ],
                  ),
                  Column(children: <Widget>[
                    IconButton(
                      //collection button
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => Collection()));
                      },
                      icon: Icon(Icons.import_contacts_rounded),
                      color: Colors.white,
                    ),
                    IconButton(
                      //collection button
                      onPressed: () {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (_) => Shop()));
                      },
                      icon: Icon(Icons.storefront),
                      color: Colors.white,
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => Friendboard()));
                        },
                        icon: Icon(Icons.group),
                        color: Colors.white),
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => StatisticsPage()));
                        },
                        icon: Icon(Icons.bar_chart_rounded),
                        color: Colors.white)
                    //IconButton(
                    //   onPressed: () {},
                    //   icon: Icon(Icons.insert_chart),
                    //  color: Colors.white)
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
