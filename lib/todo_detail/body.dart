import 'package:cosmocat/components/background.dart';
import 'package:cosmocat/todo_detail/selection.dart';
import 'package:flutter/material.dart';
import '../size_config.dart';

class Body extends StatelessWidget {
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
                child: Selection())));
  }
}
