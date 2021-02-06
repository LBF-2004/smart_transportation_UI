import 'package:flutter/material.dart';
import 'PackageTypeDropDown.dart';
import 'HomePage.dart';

class quotepage extends StatefulWidget {
  @override
  _quotepageState createState() => _quotepageState();
}
class _quotepageState extends State<quotepage> {
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
              flex: 12,
              child: Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "# of Pallet"),
                ),
              )),
          Expanded(
              flex: 12,
              child: Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Does this shipment contain hazardous items?"),
                ),
              )),
          Expanded(
              flex: 12,
              child: Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Pick up zip code"),
                ),
              )),
          Expanded(
              flex: 12,
              child: Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Delivery zip code"),
                ),
              )),
          Expanded(
            flex: 12,
            child: Container(
                padding: EdgeInsets.all(10),
                child: SizedBox(
                  width: 200,
                  height: 200,
                  child: RaisedButton(
                    child: Text("Confirm"),
                  onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePage()));
                    },
                  ),
                )),
          ),
        ],
      ),
    ));
  }
}
