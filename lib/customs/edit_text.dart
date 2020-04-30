import 'package:flutter/material.dart';

class CustomEditText extends StatefulWidget {
  final String hintText;
  final TextEditingController myController;
  final TextInputType inputType;
  final bool passChar;
  final bool isEnabled;
  final TextStyle textStyle;
  final IconData iconData;
  static const TextStyle textStyleDefult =
      TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black);
  CustomEditText(
      {@required this.hintText,
      @required this.myController,
      this.iconData = Icons.star,
      this.inputType = TextInputType.text,
      this.passChar = false,
      this.isEnabled = true,
      this.textStyle = textStyleDefult});
  @override
  State<StatefulWidget> createState() {
    return _TextViewClass(hintText, myController, inputType, textStyle,
        passChar, isEnabled, iconData);
  }
}

class _TextViewClass extends State<CustomEditText> {
  final TextEditingController myController;
  final TextInputType inputType;
  final String hintText;
  final bool passChar;
  final bool isEnabled;
  final TextStyle textStyle;
  final IconData iconData;
  _TextViewClass(this.hintText, this.myController, this.inputType,
      this.textStyle, this.passChar, this.isEnabled, this.iconData);
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Padding(
        padding: EdgeInsets.only(top: 8, bottom: 8),
        child: TextField(
          enabled: isEnabled,
          controller: myController,
          textInputAction: TextInputAction.next,
          keyboardType: this.inputType,
          obscureText: passChar,
          style: textStyle,
          textDirection: TextDirection.ltr,
          decoration: InputDecoration(
            labelText: hintText,
            labelStyle: textStyle,
            hintStyle: textStyle,
            enabledBorder: const OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black, width: 2),
            ),
            prefixIcon: Icon(
              iconData,
              color: Colors.black,
            ),
            fillColor: Colors.black,
          ),
        ),
      ),
    );
  }
}
