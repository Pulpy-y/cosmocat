import 'package:cosmocat/collection/collection.dart';
import 'package:cosmocat/friendboard/friendboard_page.dart';
import 'package:cosmocat/shop/shop_page.dart';
import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);

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
                child: Text("000"), //Number of stars of the users
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
