import 'package:flutter/material.dart';
import 'package:prefirebase/customs/edit_text.dart';

import 'add_recap_page.dart';

class RecapSettingsPage extends StatefulWidget {
  RecapSettingsPage({Key key}) : super(key: key);

  @override
  _RecapSettingsPageState createState() => _RecapSettingsPageState();
}

class _RecapSettingsPageState extends State<RecapSettingsPage> {
  TextEditingController _recapTitleController = new TextEditingController();
  List<String> _recapType;
  String selectedRecap;
  bool useMP = false;
  @override
  Widget build(BuildContext context) {
    if (_recapType == null) {
      _recapType = new List<String>();
      _recapType.add("Select Recap Type");
      _recapType.add("Type 1");
      _recapType.add("Type 2");
      _recapType.add("Type 3");
      _recapType.add("Type 4");
    }
    return Material(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(
            "Recap Settings",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.fast_forward,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddNewRecap(useMP: useMP)));
              },
            ),
          ],
        ),
        body: Container(
          color: Colors.black,
          child: Card(
            elevation: 5,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                children: <Widget>[
                  CustomEditText(
                    hintText: "Recap Title",
                    myController: _recapTitleController,
                    iconData: Icons.title,
                    inputType: TextInputType.text,
                  ),
                  SizedBox(height: 10),
                  dropListMenu(),
                  SizedBox(height: 10),
                  useMainPointOptions(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget useMainPointOptions() {
    return CheckboxListTile(
      value: useMP,
      title: Text(
        "Use Main Point Style",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      onChanged: (value) {
        setState(() {
          useMP = value;
        });
      },
    );
  }

  Widget dropListMenu() {
    return DropdownButton<String>(
      items: _recapType.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        );
      }).toList(),
      onChanged: (String item) {
        setState(() {
          selectedRecap = item;
        });
      },
      icon: Icon(
        Icons.keyboard_arrow_down,
        color: Colors.black,
      ),
      value: selectedRecap,
      hint: Text(
        "Select Recap Type",
        style: TextStyle(fontSize: 18, color: Colors.black),
      ),
    );
  }
}
