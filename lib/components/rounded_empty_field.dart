import 'package:cosmocat/components/text_field_container.dart';
import 'package:cosmocat/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundedEmptyField extends StatelessWidget {
  final String title;
  final String hintText;
  final ValueChanged<String> onChanged;
  const RoundedEmptyField({
    required this.hintText,
    required this.onChanged,
    required this.title,
  }) : super();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("    " + title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
          TextFieldContainer(
            child: TextField(
              onChanged: onChanged,
              cursorColor: themePrimaryColor,
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.015,
          )
        ]),
      );
    }
  }