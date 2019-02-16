import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyRegisterFormState();
  }
}

class MyRegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String emailvalue = "", password1value = "", password2value = "";
  int formState = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,  
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: "Email",
                icon: Icon(Icons.email),
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if(value.isNotEmpty){
                  emailvalue = value;
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
                  password1value = value;
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
                  password2value = value;
                  formState += 1;
                }
              },
            ),
            RaisedButton(
              child: Text("Continue"),
              onPressed: () {
                _formKey.currentState.validate();
                print(emailvalue);
                print(password1value);
                print(password2value);
                if(formState < 3){
                  _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("กรุณาระบุข้อมูลให้ครบถ้วน")));
                  formState = 0;
                }
                if(emailvalue == "admin"){
                  _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("user นี้มีอยู่ในระบบแล้ว")));
                  formState = 0;
                }
                if(formState == 3){
                  Navigator.pushNamed(context, "/login");
                }
              },
            ),
          ],
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
        ),
      ),
    );
  }
}