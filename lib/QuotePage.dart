import 'package:app/AuthManager.dart';
import 'package:flutter/material.dart';
import 'PackageTypeDropDown.dart';
import 'HomePage.dart';
import 'package:http/http.dart' as http;
import 'DisplayPrice.dart';
import 'package:app/PickupCityDropdown.dart';

class quotepage extends StatefulWidget {
  @override
  _quotepageState createState() => _quotepageState();
}
class _quotepageState extends State<quotepage> {
  TextEditingController orgZipcodeController = TextEditingController();
  TextEditingController desZipcodeController = TextEditingController();
  TextEditingController numcodeController = TextEditingController();
  TextEditingController itemDescriptionController = TextEditingController();
  String price = "not avialble ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          padding: EdgeInsets.all(60),
          child: Column(
            children: <Widget>[
              Expanded(
                  flex: 12,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      controller: itemDescriptionController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Item Description"),
                    ),
                  )),
              Expanded(
                  flex: 12,
                  child: Container(
                      padding: EdgeInsets.all(10),
                      width: 300,
                      child: packagetypedropdown()
                  )),
              Expanded(
                  flex: 12,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Weight Per Pallet",
                      ),
                    ),
                  )),
              Expanded(
                  flex: 11,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      controller: numcodeController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: "# of Pallet"),
                    ),
                  )),
              Expanded(
                  flex: 11,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Does this shipment contain hazardous items?"),
                    ),
                  )),
              Expanded(
                  flex: 11,
                  child: Container(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        controller: orgZipcodeController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Origin city"),
                      ),
                  )),
              Expanded(
                  flex: 11,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      controller: desZipcodeController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Delivery zip code"),
                    ),
                  )),
              Expanded(
                flex: 11,
                child: Container(
                    padding: EdgeInsets.all(10),
                    child: SizedBox(
                      width: 200,
                      // height: 200,
                      child: RaisedButton(
                        child: Text("Confirm"),
                        onPressed: () {
                          print (desZipcodeController.text.toString());
                          print (orgZipcodeController.text.toString());
                          print (numcodeController.text.toString());
                          http.get("http://10.0.2.2:5000/submit_quote/" +
                              orgZipcodeController.text.toString() + "/" + desZipcodeController.text.toString() + "/" +
                              numcodeController.text.toString() + "/" + AuthManager.email + "/" + itemDescriptionController.text.toString())
                              .then((res){
                            print("Request success!");
                            print (res.body);
                            setState(() {
                            });
                          }).catchError((error){
                            print("Request failed!");
                            print(error);
                          });

                        },
                      ),
                    )),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  child: Text(
                      "Price (in dollars): " + price
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
