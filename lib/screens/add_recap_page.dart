import 'package:flutter/material.dart';
import 'package:prefirebase/customs/edit_text.dart';
import 'package:quill_delta/quill_delta.dart';
import 'package:zefyr/zefyr.dart';

class AddNewRecap extends StatefulWidget {
  final bool useMP;
  AddNewRecap({Key key, this.useMP}) : super(key: key);

  @override
  _AddNewRecapState createState() => _AddNewRecapState(useMP);
}

class _AddNewRecapState extends State<AddNewRecap> {
  ZefyrController _recapController;
  FocusNode _focusNode;
  final bool useMP;
  TextEditingController _mPointController = new TextEditingController();
  List<String> _mainPointList = new List<String>();

  _AddNewRecapState(this.useMP);

  @override
  void initState() {
    super.initState();
    final document = _loadDocument();
    _recapController = ZefyrController(document);
    _focusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Add New Recap",
              style: TextStyle(color: Colors.white, fontSize: 18.0),
            ),
            backgroundColor: Colors.black,
            actions: <Widget>[
              FlatButton(
                child: Text(
                  "Post",
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
                onPressed: () {
                  String recapInfo = _recapController.document.toPlainText();
                  debugPrint("$recapInfo");
                },
              )
            ],
          ),
          drawer: useMP ? useMPDrawer() : null,
          body: ZefyrScaffold(
            child: Container(
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  child: ZefyrEditor(
                    controller: _recapController,
                    focusNode: _focusNode,
                    autofocus: false,
                    padding: EdgeInsets.all(16),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  NotusDocument _loadDocument() {
    final Delta delta = Delta()..insert("\n");
    return NotusDocument.fromDelta(delta);
  }

  Widget useMPDrawer() {
    return SafeArea(
        child: Drawer(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 20),
          ListTile(
            title: CustomEditText(
              hintText: "The Main Point",
              myController: _mPointController,
              iconData: Icons.control_point,
            ),
            trailing: Padding(
              padding: const EdgeInsets.only(top: 12),
              child: IconButton(
                icon: Icon(Icons.add, color: Colors.black),
                onPressed: () {
                  setState(() {
                    _mainPointList.add(_mPointController.text);
                    debugPrint(_mainPointList.length.toString());
                  });
                },
              ),
            ),
          ),
          Expanded(child: listViewInDrawer()),
        ],
      ),
    ));
  }

  Widget listViewInDrawer() {
    return ListView.builder(
      itemCount: _mainPointList.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(
            _mainPointList[index],
            style: TextStyle(color: Colors.black, fontSize: 18.0),
          ),
          onLongPress: () {
            setState(() {
              _mainPointList.removeAt(index);
            });
          },
        );
      },
    );
  }
}
