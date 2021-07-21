import 'package:flutter/material.dart';
import"package:app/SignUp.dart";
import 'package:app/LogIn.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      home: LogoScreen()
    );
  }
}
class LogoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
        body: Container(
            child: Column(
              children: <Widget>[
                Expanded(
                    flex: 50,
                    child: Container(
                        padding:EdgeInsets.all(80),
                        child: Center(
                          child: CircleAvatar(
                            radius:250,
                            backgroundImage: NetworkImage("https://img1.wsimg.com/isteam/ip/657a3946-fd3e-43d8-8698-90c8bee41337/logo/89ea982e-1bf3-4bc2-bd37-4bcfa9d8b20b.png/:/rs=h:564/qt=q:95"),
                          ),
                        )
                    )
                ),
                Expanded(
                    flex: 50,
                    child: Container(
                        padding:EdgeInsets.all(100),
                        child: Center(
                            child: Column(
                              children: <Widget>[
                                Expanded(
                                  flex:50,
                                  child: Container(
                                    padding: EdgeInsets.all(20),
                                    child: SizedBox(
                                      width: 400,
                                      height: 400,
                                      child: RaisedButton(
                                        child: Text("Log In", style: TextStyle(fontSize: 24)),
                                        onPressed: (){
                                          Navigator.push(context, MaterialPageRoute(builder:(context) => login()));
                                        },
                                      ),
                                    ),

                                  ),
                                ),
                                Expanded(
                                  flex:50,
                                  child: Container(
                                    padding: EdgeInsets.all(20),
                                    child: SizedBox(
                                      width: 400,
                                      height: 400,
                                      child: RaisedButton(
                                        child: Text("Sign Up", style: TextStyle(fontSize: 23)),
                                        onPressed: (){
                                          Navigator.push(context, MaterialPageRoute(builder:(context) => signup()));
                                        },
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                        )
                    )
                ),
              ],
            )
        )
    );
  }
}


