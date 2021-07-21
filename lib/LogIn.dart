import 'package:app/AuthManager.dart';
import 'package:app/SignUp.dart';
import 'package:flutter/material.dart';
import 'QuotePage.dart';
import 'HomePage.dart';
import 'package:http/http.dart' as http;
import 'AuthManager.dart';
import 'ServerURL.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  String account = "NO";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 30,
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
            flex: 15,
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
            flex: 45,
            child: Container(
                padding: EdgeInsets.all(50),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 50,
                      child: TextField(
                        controller: emailcontroller,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), labelText: "Email"),
                      ),
                    ),
                    Expanded(
                      flex: 50,
                      child: TextField(
                        controller: passwordcontroller,
                        obscureText: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Password"),
                      ),
                    ),
                  ],
                )),
          ),
          Expanded(
              flex: 15,
              child: Container(
                padding: EdgeInsets.all(30),
                child: SizedBox(
                  width: 250,
                  height: 200,
                  child: RaisedButton(
                    child: Text("Confirm"),
                    onPressed: () {
                      http
                          .get(
                          ServerURL.url + "/login/" +
                                  emailcontroller.text.toString() +
                                  "/" +
                                  passwordcontroller.text.toString())
                          .then((res) {
                        print("Request Success");
                        print(res.body);
                        account = res.body;
                        if (account.contains("OK")) {
                          AuthManager.email = emailcontroller.text.toString();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                          // add else / both signup/ login
                        }else {
                          print ("Wrong Username or Password");
                          showDialog(
                            context: context,
                            barrierDismissible: true, // user must tap button!
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Alert'),
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: <Widget>[
                                      Text('Wrong Username or Password'),
                                    ],
                                  ),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    child: Text('Confirm'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );


                        }
                      }).catchError((error) {
                        print("Request failed!");
                        print(error);
                        // ...
                      });
                      ;
                    },
                  ),
                ),
              ))
        ],
      ),
    ));
  }
}
