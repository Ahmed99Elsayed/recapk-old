import 'package:flutter/material.dart';
import 'package:prefirebase/models/user.dart';

import 'profile_page.dart';
import 'profile_set_page.dart';
import 'recape_set_page.dart';

class HomeRecapPage extends StatefulWidget {
  HomeRecapPage({Key key}) : super(key: key);

  @override
  _HomeRecapPageState createState() => _HomeRecapPageState();
}

class _HomeRecapPageState extends State<HomeRecapPage> {
  TextEditingController _searchController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: WillPopScope(
        onWillPop: () {
          return null;
        },
        child: Scaffold(
          appBar: AppBar(
            iconTheme: new IconThemeData(color: Colors.black),
            backgroundColor: Colors.yellowAccent,
            centerTitle: true,
            title: Text(
              "Home",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                onPressed: () {
                  showSearchDialog(context);
                },
              ),
            ],
          ),
          // To Make The Drawer Below The state Bar
          drawer: SafeArea(
            // To Cut The Drawer In This Shape
            child: Drawer(
              child: Column(
                children: <Widget>[
                  Container(
                    color: Colors.white,
                    height: 150,
                    child: subDrawer(),
                  ),
                  SizedBox(height: 20),
                  listInDrawer(),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.black,
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RecapSettingsPage()));
            },
          ),
          body: Container(
            color: Colors.white,
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 5,
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    color: Colors.white,
                    child: subListRecaps(),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  void showSearchDialog(BuildContext context) {
    AlertDialog alertDialog = new AlertDialog(
      backgroundColor: Colors.white,
      title: Text(
        'Search For Recap',
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Card(
        child: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(4),
            hintText: "Search",
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.black),
          ),
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text(
            'Cancel',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        FlatButton(
          child: Text(
            'Search',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () {},
        ),
      ],
    );
    showDialog(
        context: context, builder: (BuildContext context) => alertDialog);
  }

  //ListTail Of ListView.builder
  Widget subListRecaps() {
    return Container(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.black,
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
            title: Text(
              "User Name",
              style: TextStyle(
                color: Colors.purple,
                fontSize: 14,
              ),
            ),
            subtitle: Text(
              "Time Of Post",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            trailing: Icon(
              Icons.share,
              color: Colors.black,
            ),
          ),
          Column(
            children: <Widget>[
              Center(
                child: Text(
                  "Recap Title",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(
                  top: 8.0,
                  bottom: 8.0,
                  left: 12,
                  right: 12,
                ),
                child: RichText(
                  text: TextSpan(
                    text: "The Recap The Recap The Recap The Recap The Recap The Recap The Recap The Recap" +
                        " The Recap The Recap The Recap The Recap The Recap The Recap The Recap The Recap The Recap",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ],
      ),
    );
  }

  //One Row In The Item Drawer Used As Row For Many Items
  Widget listInDrawerRow(String text, IconData icon, int selected) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.black,
      ),
      title: Text(
        "$text",
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
      ),
      trailing: Icon(
        Icons.arrow_right,
        color: Colors.black,
      ),
      onTap: () {},
    );
  }

  //List of Items In Drawer
  Widget listInDrawer() {
    return Container(
      child: Column(
        children: <Widget>[
          listInDrawerRow("My Recaps", Icons.edit, 1),
          listInDrawerRow("Payment", Icons.payment, 2),
          listInDrawerRow("Settings", Icons.settings, 3),
        ],
      ),
    );
  }

  // The Profile Info In The Drawer
  Widget subProfile() {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundColor: Colors.white,
        child: Icon(
          Icons.person,
          size: 35,
          color: Colors.black,
        ),
      ),
      title: Text(
        "User Name",
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: IconButton(
        icon: Icon(
          Icons.settings,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ProfileSettings()));
        },
      ),
      onTap: () {
        UserInformation userData = new UserInformation(
          "khaled",
          "khaled",
          "khaled",
          "khaled",
          "khaled",
          "khaled",
          "khaled",
          "khaled",
          "khaled",
          "khaled",
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProfilePage(userData: userData),
          ),
        );
      },
    );
  }

  //the Profile In The Drawer
  Widget subDrawer() {
    return Container(
      color: Colors.black,
      padding: EdgeInsets.only(top: 24, right: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          subProfile(),
        ],
      ),
    );
  }
}
