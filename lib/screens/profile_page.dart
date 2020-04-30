import 'package:flutter/material.dart';
import 'package:prefirebase/models/user.dart';

class ProfilePage extends StatelessWidget {
  final UserInformation userData;
  ProfilePage({Key key, this.userData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            centerTitle: true,
            title: Text(
              "Profile",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
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
                    userPhoto(),
                    SizedBox(height: 30),
                    userDataText(userData.userName, Icons.person),
                    userDataText(userData.fullName, Icons.person),
                    userDataText(userData.age, Icons.person),
                    userDataText(userData.phone, Icons.person),
                    userDataText(userData.about, Icons.person),
                    userDataText(userData.facebookLink, Icons.person),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget userPhoto() {
    return CircleAvatar(
      backgroundColor: Colors.black,
      backgroundImage: AssetImage("assets/images/user_96.png"),
      radius: 80,
    );
  }

  Widget userDataText(String text, IconData icon) {
    return Card(
      elevation: 3,
      child: ListTile(
        leading: Icon(icon, color: Colors.black),
        title: Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
