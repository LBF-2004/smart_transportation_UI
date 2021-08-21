//
//
//
//
//
//import 'package:flutter/material.dart';
//import 'PackageTypeDropDown.dart';
//import 'HomePage.dart';
//import 'package:http/http.dart' as http;
//import 'DisplayPrice.dart';
//import 'package:app/PickupCityDropdown.dart';
//
//class portpage extends StatefulWidget {
//  @override
//  _portpageState createState() => _portpageState();
//}
//class _portpageState extends State<portpage> {
//  TextEditingController orgZipcodeController = TextEditingController();
//  TextEditingController desZipcodeController = TextEditingController();
//  TextEditingController numcodeController = TextEditingController();
//  String price = "not avialble ";
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//        body: Container(
//          padding: EdgeInsets.all(60),
//          child: Column(
//            children: <Widget>[
//              Expanded(
//                  flex: 12,
//                  child: Container(
//                    padding: EdgeInsets.all(10),
//                    child: TextField(
//                      decoration: InputDecoration(
//                          border: OutlineInputBorder(),
//                          labelText: "Item Description"),
//                    ),
//                  )),
//              Expanded(
//                  flex: 12,
//                  child: Container(
//                      padding: EdgeInsets.all(10),
//                      width: 300,
//                      child: packagetypedropdown()
//                  )),
//              Expanded(
//                  flex: 12,
//                  child: Container(
//                    padding: EdgeInsets.all(10),
//                    child: TextField(
//                      decoration: InputDecoration(
//                        border: OutlineInputBorder(),
//                        labelText: "Weight Per Pallet",
//                      ),
//                    ),
//                  )),
//              Expanded(
//                  flex: 11,
//                  child: Container(
//                    padding: EdgeInsets.all(10),
//                    child: TextField(
//                      controller: numcodeController,
//                      decoration: InputDecoration(
//                          border: OutlineInputBorder(), labelText: "# of Pallet"),
//                    ),
//                  )),
//              Expanded(
//                  flex: 11,
//                  child: Container(
//                    padding: EdgeInsets.all(10),
//                    child: TextField(
//                      decoration: InputDecoration(
//                          border: OutlineInputBorder(),
//                          labelText: "Does this shipment contain hazardous items?"),
//                    ),
//                  )),
//              Expanded(
//                  flex: 11,
//                  child: Container(
//                    padding: EdgeInsets.all(10),
//                    child: pickupcitydropdown()
//                  )),
//              Expanded(
//                  flex: 11,
//                  child: Container(
//                    padding: EdgeInsets.all(10),
//                    child: TextField(
//                      controller: desZipcodeController,
//                      decoration: InputDecoration(
//                          border: OutlineInputBorder(),
//                          labelText: "Delivery zip code"),
//                    ),
//                  )),
//              Expanded(
//                flex: 11,
//                child: Container(
//                    padding: EdgeInsets.all(10),
//                    child: SizedBox(
//                      width: 200,
//                      // height: 200,
//                      child: RaisedButton(
//                        child: Text("Confirm"),
//                        onPressed: () {
//                          print (desZipcodeController.text.toString());
//                          print (orgZipcodeController.text.toString());
//                          print (numcodeController.text.toString());
//                          http.get("http://52.53.220.182:5000/get_price/" +
//                              orgZipcodeController.text.toString() + "/" + desZipcodeController.text.toString() + "/" +
//                              numcodeController.text.toString())
//                              .then((res){
//                                print("Request success!");
//                                print (res.body);
//                                price = res.body;
//                                setState(() {
//                                });
//                          }).catchError((error){
//                            print("Request failed!");
//                            print(error);
//                          });
//                        },
//                      ),
//                    )),
//              ),
//              Expanded(
//                flex: 5,
//                child: Container(
//                  child: Text(
//                      price
//                  ),
//                ),
//              )
//            ],
//          ),
//        ));
//  }
//}
