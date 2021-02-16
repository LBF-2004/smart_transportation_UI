import 'package:flutter/material.dart';
import 'main.dart';
import 'LogIn.dart';
import 'package:http/http.dart' as http;
class signup extends StatefulWidget {
  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  String account = "not avialble";
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
                            controller: emailcontroller,
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
                          controller:passwordcontroller,
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
                               // Navigator.push(context, MaterialPageRoute(builder:(context) => login()));
                                http.get("https://leoliaoproject.sunyu912.repl.co/signup/" + emailcontroller.text.toString() + "/" + passwordcontroller.text.toString())
                                .then((res){
                                  print ("Request Success");
                                  print (res.body);
                                  account = res.body;
                                  if (account.contains("OK")){
                                    Navigator.pop(context);
                                  }
                                  else {
                                    showDialog(
                                      context: context,
                                      barrierDismissible: true, // user must tap button!
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text('Alert'),
                                          content: SingleChildScrollView(
                                            child: ListBody(
                                              children: <Widget>[
                                                Text('User Already Exists'),
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
                                }
                                ).catchError((error){
                                  print("Request failed!");
                                  print(error);
                                });
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
