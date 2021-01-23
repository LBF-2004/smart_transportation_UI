import 'package:flutter/material.dart';
import 'main.dart';

class signup extends StatefulWidget {
  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 1000,
        height: 1000,
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Expanded(
              flex:55,
              child: Container(
                padding: EdgeInsets.all(30),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Full Name"
                          ),
                        )
                      )
                    ),
                    Expanded(
                      child: Container(
                          padding: EdgeInsets.all(10),
                          child: TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Email"
                            ),
                          )
                      )
                    ),
                    Expanded(
                      child: Container(
                          padding: EdgeInsets.all(10),
                          child: TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Phone Number"
                            ),
                          )
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 40,
              child: Container(
                padding: EdgeInsets.all(30),
                child: Column(
                children: <Widget>[
                  Expanded(
                    child: Container(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Create a User Name"
                          ),
                        )
                    )
                  ),
                  Expanded(
                    child: Container(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Create a Password"
                          ),

                        )
                    ),
                  ),
                ],
                ),
              ),
            ),
            Expanded(
              flex: 15,
              child:  Container(
                padding: EdgeInsets.only(left:40, right:40, top:25, bottom:30),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 45,
                      child: Container(
                        color: Colors.blue,
                        child: SizedBox(
                          width:200,
                          height: 200,
                          child: RaisedButton(
                            child: Text("Cancel"),
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder:(context) => LogoScreen()));
                            },
                          ),
                        )
                      )
                    ),
                    Expanded(
                      flex:10,
                      child: Container(),
                    ),
                    Expanded(
                      flex: 45,
                      child: Container(
                          child: SizedBox(
                            width:200,
                            height: 200,
                            child: RaisedButton(
                              child: Text("Confirm"),
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder:(context) => LogoScreen()));
                              },
                            ),
                          )
                      )
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
