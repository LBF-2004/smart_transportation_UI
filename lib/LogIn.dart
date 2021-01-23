import 'package:flutter/material.dart';
import 'QuotePage.dart';
import 'HomePage.dart';
class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 25,
            child: Container(
                child: Padding(
              padding: const EdgeInsets.only(
                  bottom: 30, top: 30, right: 200, left: 20),
              child: CircleAvatar(
                  radius: 90,
                  backgroundImage: NetworkImage(
                      "https://img1.wsimg.com/isteam/ip/657a3946-fd3e-43d8-8698-90c8bee41337/logo/89ea982e-1bf3-4bc2-bd37-4bcfa9d8b20b.png/:/rs=h:564/qt=q:95")),
            )),
          ),
          Expanded(
            flex: 20,
            child: Container(
                child: Column(
              children: <Widget>[
                Expanded(
                  flex: 50,
                  child: Container(
                      padding: EdgeInsets.only(right: 255),
                      child: Text("Hello.",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold))),
                ),
                Expanded(
                  flex: 50,
                  child: Container(
                      padding: EdgeInsets.only(right: 128),
                      child: Text("Welcome Back.",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold))),
                )
              ],
            )),
          ),
          Expanded(
            flex: 50,
            child: Container(
                padding: EdgeInsets.all(50),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 50,
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "User Name"),
                      ),
                    ),
                    Expanded(
                      flex: 50,
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Password"),
                      ),
                    ),
                  ],
                )),
          ),
          Expanded(
              flex: 5,
              child: SizedBox(
                width: 200,
                height: 200,
                child: RaisedButton(
                  child: Text("Confirm"),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                ),
              ))
        ],
      ),
    ));
  }
}
