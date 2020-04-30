import 'package:flutter/material.dart';

InputDecoration textDecoration(TextStyle textStyle) {
  return InputDecoration(
    labelStyle: textStyle,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
    ),
  );
}
