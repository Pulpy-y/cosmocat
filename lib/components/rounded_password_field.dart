import 'package:cosmocat/components/text_field_container.dart';
import 'package:cosmocat/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final bool obscure;

  const RoundedPasswordField({
    required this.onChanged,
    required this.obscure
  }) : super();

  @override
  Widget build(BuildContext context) {

    return TextFieldContainer(
      child: TextField(
        obscureText: obscure,
        onChanged: onChanged,
        cursorColor: themePrimaryColor,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: themePrimaryColor,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              Icons.visibility,
              color: themePrimaryColor,), onPressed: () {  },
          ),
          border: InputBorder.none,

        ),
      ),
    );
  }
}
