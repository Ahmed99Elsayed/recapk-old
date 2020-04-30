import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prefirebase/customs/edit_text.dart';

class ProfileSettings extends StatefulWidget {
  ProfileSettings({Key key}) : super(key: key);

  @override
  _ProfileSettingsState createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  TextEditingController _userNameController = new TextEditingController();
  TextEditingController _facebookController = new TextEditingController();
  TextEditingController _bioController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();
  File imageFile;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(
            "Profile Settings",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.save, color: Colors.white),
              onPressed: () {
                saveUserInfo();
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
                  SizedBox(height: 20),
                  userPhoto(),
                  SizedBox(height: 20),
                  CustomEditText(
                    hintText: "User Name",
                    myController: _userNameController,
                    iconData: Icons.person,
                    inputType: TextInputType.text,
                  ),
                  SizedBox(height: 10),
                  CustomEditText(
                    hintText: "Phone Number",
                    myController: _phoneController,
                    iconData: Icons.phone_android,
                    inputType: TextInputType.text,
                  ),
                  SizedBox(height: 10),
                  CustomEditText(
                    hintText: "Facebook Link",
                    myController: _facebookController,
                    iconData: Icons.link,
                    inputType: TextInputType.text,
                  ),
                  SizedBox(height: 10),
                  CustomEditText(
                    hintText: "About You",
                    myController: _bioController,
                    iconData: Icons.info,
                    inputType: TextInputType.text,
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget userPhoto() {
    return GestureDetector(
      child: CircleAvatar(
        backgroundColor: Colors.white,
        child: (imageFile == null)
            ? Image.asset("assets/images/user_96.png")
            : Image.file(imageFile),
        radius: 80,
      ),
      onLongPress: () {
        takePhotoFromFile();
      },
    );
  }

  takePhotoFromFile() async {
    var photo = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState(() {
      imageFile = photo;
    });
  }

  void saveUserInfo() {}
}
