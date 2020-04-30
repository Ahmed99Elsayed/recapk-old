import 'package:flutter/material.dart';
import 'package:prefirebase/models/user.dart';
import 'package:prefirebase/screens/authenticate/authenticate.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    // return home or auth depend on state of auth now
    if (user == null) {
      return Authenticate();
    } else {
      //Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
      return HomeRecapPage();
    }
  }
}
