import 'package:flutter/material.dart';

class BaseCommonWidget {
  getDynamicText(String textValue,
      {Color textColor = Colors.white,
      double fontSize = 18,
      FontWeight fontWeight = FontWeight.w400}) {
    return Text(
      textValue,
      style: TextStyle(
        color: textColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
