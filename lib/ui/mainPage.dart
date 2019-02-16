import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainPageState();
      }
    
    }
    
class MainPageState extends State<MainPage>{
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home", textAlign: TextAlign.center),
        ),
        bottomNavigationBar: Container(
          color: Colors.blue,
          child: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.home),
              ),
              Tab(
                icon: Icon(Icons.notifications),
              ),
              Tab(
                icon: Icon(Icons.map),
              ),
              Tab(
                icon: Icon(Icons.account_circle),
              ),
              Tab(
                icon: Icon(Icons.settings),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Center(
              child: Text("Home", textAlign: TextAlign.center),
            ),
            Center(
              child: Text("Notify", textAlign: TextAlign.center),
            ),
            Center(
              child: Text("Map", textAlign: TextAlign.center),
            ),
            Center(
              child: Text("Profile", textAlign: TextAlign.center),
            ),
            Center(
              child: Text("Setup", textAlign: TextAlign.center),
            ),
          ],
        ),
      ),
    );
  }
}
