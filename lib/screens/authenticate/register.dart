import 'package:flutter/material.dart';
import 'package:prefirebase/services/auth.dart';
import 'package:prefirebase/shared/const.dart';
import 'package:prefirebase/shared/loading.dart';
import 'package:prefirebase/screens/authenticate/signin.dart';
import 'package:prefirebase/Widget/bezierContainer.dart';

class Register extends StatefulWidget {
  final Function
      toggleView; // define function that toggle page from sign in and register that get from auth
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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

  Widget _loginAccountLabel() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Already have an account ?',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => SignIn()));
            },
            child: Text(
              'Login',
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
            body: SingleChildScrollView(
            child: Container(
                height: MediaQuery.of(context).size.height,
                child: Stack(children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Form(
                      // form of email
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            flex: 3,
                            child: SizedBox(),
                          ),
                          Image(
                            image: AssetImage('images/rewezicon.png'),
                          ),
                          SizedBox(
                            height: 90.0,
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
                                    await _auth.register(email, password);
                                if (result == null) {
                                  setState(() {
                                    loading = false;
                                    error =
                                        'please enter real email like bassemtarekmahrous@gmail.com';
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
                                'Register Now',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
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
                    child: _loginAccountLabel(),
                  ),
                  Positioned(top: 40, left: 0, child: _backButton()),
                  Positioned(
                      top: -MediaQuery.of(context).size.height * .15,
                      right: -MediaQuery.of(context).size.width * .4,
                      child: BezierContainer())
                ])),
          ));
  }
}
