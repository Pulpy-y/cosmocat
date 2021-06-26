import 'package:cosmocat/collection/collection.dart';
import 'package:cosmocat/friendboard/friendboard_page.dart';
import 'package:cosmocat/shop/shop_page.dart';
import 'package:flutter/material.dart';
import 'package:cosmocat/database.dart';

class SideBar extends StatefulWidget {

  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {

  int stars = 0;

  @override
  void initState() {
    getData();
    super.initState();
  }

  Future<void> getData() async {
    stars = await DatabaseService().getStars();
    //print("stars:${stars}");
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Row(
          children: <Widget>[
            Icon(
              Icons.star,
              color: Colors.yellow,
            ),
            Card(
                child: Text("$stars"), //Number of stars of the users
                color: Colors.white)
          ],
        ),
        Column(children: <Widget>[
          IconButton(
            //collection button
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Collection()));
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
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Friendboard()));
              },
              icon: Icon(Icons.group),
              color: Colors.white),
          //IconButton(
          //   onPressed: () {},
          //   icon: Icon(Icons.insert_chart),
          //  color: Colors.white)
        ])
      ],
    );
  }
}
