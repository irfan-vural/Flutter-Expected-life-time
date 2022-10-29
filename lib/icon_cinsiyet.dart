import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'input_page.dart';

class MyColomn extends StatelessWidget {
  final String? cinsiyet;
  final IconData? icon;
  const MyColomn(
      {this.cinsiyet = "Default", this.icon = FontAwesomeIcons.addressBook});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Icon(
          icon,
          size: 50,
          color: Colors.black54,
        ),
        Text(
          cinsiyet!,
          style: TextStyle(
              color: Colors.black54, fontSize: 20, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
