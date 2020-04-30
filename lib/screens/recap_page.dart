import 'package:flutter/material.dart';
import 'package:prefirebase/models/recapakdata.dart';

class RecapInfoPage extends StatelessWidget {
  final ReCapakUserData recapInfo;

  RecapInfoPage({Key key, this.recapInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: Colors.black,
            centerTitle: true,
            title: Text(
              "Recap Info",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Card(
              elevation: 5,
              child: Column(
                children: <Widget>[
                  recapDataText(recapInfo.title),
                  SizedBox(height: 10),
                  recapDataText(recapInfo.type),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RichText(
                      text: TextSpan(
                        text: recapInfo.recap,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget recapDataText(String text) {
    return Card(
      elevation: 3,
      child: ListTile(
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
