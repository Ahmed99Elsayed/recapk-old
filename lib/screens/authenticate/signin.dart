import 'package:flutter/material.dart';
import 'package:prefirebase/services/auth.dart';
import 'package:prefirebase/shared/const.dart';
import 'package:prefirebase/shared/loading.dart';
import 'package:prefirebase/screens/authenticate/register.dart';
import 'package:prefirebase/Widget/bezierContainer.dart';

class SignIn extends StatefulWidget {
  final Function
      toggleView; // define function that toggle page from sign in and register that get from auth
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Back',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  Widget _createAccountLabel() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Don\'t have an account ?',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Register()));
            },
            child: Text(
              'Register',
              style: TextStyle(
                  color: Color(0xfff79c4f),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  TextEditingController userNameText = new TextEditingController();
  TextEditingController passwordText = new TextEditingController();
  bool loading = false;
  // Text field state
  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              flex: 2,
                              child: SizedBox(),
                            ),
                            Image(
                              image: AssetImage('images/rewezicon.png'),
                            ),
                            SizedBox(
                              height: 90,
                            ),
                            TextFormField(
                              validator: (val) => val.isEmpty
                                  ? 'Enter your E-mail, please'
                                  : null,
                              controller: userNameText,
                              style: textStyle,
                              onChanged: (val) {
                                setState(() {
                                  email = val;
                                });
                              },
                              decoration: textDecoration(textStyle)
                                  .copyWith(labelText: "Enter your username"),
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            TextFormField(
                              validator: (val) => val.length < 6
                                  ? 'Enter your password < 6, please'
                                  : null,
                              obscureText: true,
                              controller: passwordText,
                              style: textStyle,
                              onChanged: (val) {
                                setState(() {
                                  password = val;
                                });
                              },
                              decoration: textDecoration(textStyle)
                                  .copyWith(labelText: "Enter your password"),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            InkWell(
                              onTap: () async {
                                if (_formKey.currentState.validate()) {
                                  setState(() {
                                    loading = true;
                                  });
                                  dynamic result =
                                      await _auth.signIn(email, password);
                                  if (result == null) {
                                    setState(() {
                                      loading = false;
                                      error =
                                          'couldn\'t sign in with those cerdentials';
                                    });
                                  }
                                }
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.symmetric(vertical: 15),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                          color: Colors.grey.shade200,
                                          offset: Offset(2, 4),
                                          blurRadius: 5,
                                          spreadRadius: 2)
                                    ],
                                    gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [
                                          Color(0xfffbb448),
                                          Color(0xfff7892b)
                                        ])),
                                child: Text(
                                  "Sign in",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              error,
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: _createAccountLabel(),
                    ),
                    Positioned(top: 40, left: 0, child: _backButton()),
                    Positioned(
                        top: -MediaQuery.of(context).size.height * .15,
                        right: -MediaQuery.of(context).size.width * .4,
                        child: BezierContainer())
                  ],
                ),
              ),
            ));
  }
}
