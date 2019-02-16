import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyLoginFormState();
  }
}

class MyLoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String uservalue = "", passwordvalue = "";
  int formState = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,  
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            Image.asset(
              "assets/image_1.jpeg",
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "User Id",
                icon: Icon(Icons.account_circle),
              ),
              keyboardType: TextInputType.text,
              validator: (value) {
                if(value.isNotEmpty){
                  uservalue = value;
                  formState += 1;
                }
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Password",
                icon: Icon(Icons.lock),
              ),
              keyboardType: TextInputType.text,
              obscureText: true,
              validator: (value) {
                if(value.isNotEmpty){
                  passwordvalue = value;
                  formState += 1;
                }
              },
            ),
            RaisedButton(
              child: Text("Login"),
              onPressed: () {
                _formKey.currentState.validate();
                print(uservalue);
                print(passwordvalue);
                if(formState < 2){
                  _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("กรุณาระบุ user or password")));
                  formState = 0;
                }
                if(uservalue == "admin" && passwordvalue == "admin"){
                  _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("user or password ไม่ถูกต้อง")));
                  formState = 0;
                }
                if(formState == 2){
                  Navigator.pushNamed(context, "/");
                }
              },
            ),
            FlatButton(
              child: Text("Register New Account"),
              onPressed: (){
                Navigator.pushNamed(context, "/register");
              },
              padding: EdgeInsets.only(left: 160.0),
            ),
          ],
          padding: EdgeInsets.only(left: 24.0, right: 24.0,top: 48.0),
        ),
      ),
    );
  }
}