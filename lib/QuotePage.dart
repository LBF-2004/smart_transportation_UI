import 'package:app/AuthManager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'PackageTypeDropDown.dart';
import 'HomePage.dart';
import 'package:http/http.dart' as http;
import 'DisplayPrice.dart';
import 'package:app/PickupCityDropdown.dart';
import 'TestRadioTileList.dart';

class quotepage extends StatefulWidget {
  @override
  _quotepageState createState() => _quotepageState();
}

class _quotepageState extends State<quotepage> {
  TextEditingController orgZipcodeController = TextEditingController();
  TextEditingController desZipcodeController = TextEditingController();
  TextEditingController itemDescriptionController = TextEditingController();
  TextEditingController LengthController = TextEditingController();
  TextEditingController WidthController = TextEditingController();
  TextEditingController HeightController = TextEditingController();
  TextEditingController additionalNeedController = TextEditingController();
  TextEditingController WeightController = TextEditingController();
  

  String price = "not available ";
  String destinationType = 'Business';
  String desiredLengthUnit = 'CM';
  String desiredContainerType = "20 GP";
  String desiredWeightUnit = "KG";
  // FTL/LTL: From - to; facilitityType: Bussiness/ residential ; dimension (weight / unit) ; additional service (eg. need lift gate); commodity
  // FCL: from - to ; containertype: 20, 40, 45"; commodity
  //
  
  SingingCharacter _character = SingingCharacter.FTL;

  @override
  Widget build(BuildContext context) {
    var finalValue;
    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(30),
      child: SingleChildScrollView(

        child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                RadioListTile<SingingCharacter>(
                  title: const Text('FTL/LTL'),
                  value: SingingCharacter.FTL,
                  groupValue: _character,
                  onChanged: (SingingCharacter value) {
                    setState(() {
                      _character = value;
                    });
                  },
                ),
                RadioListTile<SingingCharacter>(
                  title: const Text('FCL'),
                  value: SingingCharacter.jefferson,

                  groupValue: _character,
                  onChanged: (SingingCharacter value) {
                    setState(() {
                      _character = value;

                    });
                  },
                ),
              ],
            )
            ),
      _character == SingingCharacter.FTL ?
          ListView(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: itemDescriptionController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "Commodity"),
                ),
    ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      controller: orgZipcodeController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "From",
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      controller: desZipcodeController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: "To"),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.all(10),
                      child: DropdownButton(
                        value: destinationType,
                        icon: const Icon(Icons.arrow_downward),
                        iconSize: 24,
                        onChanged: (String newValue) {
                          setState(() {
                            destinationType = newValue;
                            print(destinationType);
                          });
                        },
                        items: <String>['Business', 'Residential']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      )),
                  Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 25,
                            child: Container(
                              padding: EdgeInsets.only(right:5),
                              child: TextField(
                                  controller: LengthController,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(), labelText: "Length")),
                            ),
                          ),
                          Expanded(
                            flex: 25,
                            child: Container(
                              padding: EdgeInsets.only(right:5),
                              child: TextField(
                                  controller: WidthController,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(), labelText: "Width")),
                            ),
                          ),
                          Expanded(
                            flex: 25,
                            child: Container(
                              padding: EdgeInsets.only(right:5),
                              child: TextField(
                                  controller: HeightController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: "Height",
                                  )),
                            ),
                          ),
                          Expanded(
                              flex: 29,
                              child: Container(
                                padding: EdgeInsets.only(left:5),
                                child: DropdownButton(
                                  value: desiredLengthUnit,
                                  icon: const Icon(Icons.arrow_downward),
                                  iconSize: 24,
                                  onChanged: (String newSecondValue) {
                                    setState(() {
                                      desiredLengthUnit = newSecondValue;
                                    });
                                  },
                                  items: <String>["CM", "INCH"]
                                      .map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ))
                        ],
                      )),
              Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 80,

                        child: Container(
                          padding: EdgeInsets.only(right: 5),
                          child: TextField(
                              controller: WeightController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Weight",
                              )),
                        ),
                      ),
                      Expanded(
                        flex:30,
                        child: Container(
                          padding: EdgeInsets.only(left: 5),
                          child: DropdownButton(
                            value: desiredWeightUnit,
                            icon: const Icon(Icons.arrow_downward),
                            iconSize: 24,
                            onChanged: (String newValue) {
                              setState(() {
                                desiredWeightUnit = newValue;
                              });
                            },
                            items: <String>["KG", "LBS"]
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      )
                    ],
                  )
              ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      controller: additionalNeedController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Enter Any Additional Need"), // extra need (see email)
                    ),
                  ),

              Container(
                  padding: EdgeInsets.all(10),
                  child: SizedBox(
                    width: 200,
                    // height: 200,
                    child: RaisedButton(
                      child: Text("Confirm"),
                      onPressed: () {
                        print(desZipcodeController.text.toString());
                        print(orgZipcodeController.text.toString());
                        http
                            .get("http://10.0.2.2:5000/submit_FTL_quote/" +
                            orgZipcodeController.text.toString() + "/" +
                            desZipcodeController.text.toString() + "/" +
                            AuthManager.email + "/" +
                            itemDescriptionController.text.toString() + "/" +
                            destinationType + "/" +
                            LengthController.text.toString() +"/" +
                            HeightController.text.toString() + "/" + 
                            WeightController.text.toString() + "/" +
                            desiredLengthUnit + desiredWeightUnit + additionalNeedController.text.toString()
                        )
                            .then((res) {
                          print("Request success!");
                          print(res.body);
                          setState(() {});
                        }).catchError((error) {
                          print("Request failed!");
                          print(error);
                        });
                      },
                    ),
                  )),


            ]
          ):
      ListView(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: itemDescriptionController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "Commodity"),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: orgZipcodeController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "From",
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: desZipcodeController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "To"),
              ),
            ),
            Container(
                padding: EdgeInsets.all(10),
                child: DropdownButton(
                  value: desiredContainerType,
                  icon: const Icon(Icons.arrow_downward),
                  iconSize: 24,
                  onChanged: (String newValue) {
                    setState(() {
                      desiredContainerType = newValue;
                    });
                  },
                  items: <String>['20 GP', '40 GP' ,'45 GP']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                )),
//            Container(
//                padding: EdgeInsets.all(10),
//                child: Row(
//                  children: [
//                    Expanded(
//                      flex: 25,
//                      child: TextField(
//                          controller: LengthController,
//                          decoration: InputDecoration(
//                              border: OutlineInputBorder(), labelText: "HI")),
//                    ),
//                    Expanded(
//                      flex: 25,
//                      child: TextField(
//                          controller: WidthController,
//                          decoration: InputDecoration(
//                              border: OutlineInputBorder(), labelText: "HI")),
//                    ),
//                    Expanded(
//                      flex: 25,
//                      child: TextField(
//                          controller: HeightController,
//                          decoration: InputDecoration(
//                            border: OutlineInputBorder(),
//                            labelText: "HI",
//                          )),
//                    ),
//                    Expanded(
//                        flex: 29,
//                        child: DropdownButton(
//                          value: firstdropdownValue,
//                          icon: const Icon(Icons.arrow_downward),
//                          iconSize: 24,
//                          onChanged: (String newSecondValue) {
//                            setState(() {
//                              firstdropdownValue = newSecondValue;
//                            });
//                          },
//                          items: <String>["CM", "INCH"]
//                              .map<DropdownMenuItem<String>>((String value) {
//                            return DropdownMenuItem<String>(
//                              value: value,
//                              child: Text(value),
//                            );
//                          }).toList(),
//                        ))
//                  ],
//                )),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: additionalNeedController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Additional Need"), // extra need (see email)
              ),
            ),
            Container(
                padding: EdgeInsets.all(10),
                child: SizedBox(
                  width: 200,
                  // height: 200,
                  child: RaisedButton(
                    child: Text("Confirm"),
                    onPressed: () {
                      print(desZipcodeController.text.toString());
                      print(orgZipcodeController.text.toString());
                      http
                          .get("http://10.0.2.2:5000/submit_FCL_quote/" +
                          orgZipcodeController.text.toString() + "/" +
                          desZipcodeController.text.toString() + "/" +
                          AuthManager.email + "/" +
                          itemDescriptionController.text.toString() + "/" +
                          desiredContainerType
                      )
                          .then((res) {
                        print("Request success!");
                        print(res.body);
                        setState(() {});
                      }).catchError((error) {
                        print("Request failed!");
                        print(error);
                      });
                    },
                  ),
                )),


          ]
      ),
//          Container(
//              padding: EdgeInsets.all(10),
//              width: 300,
//              child: packagetypedropdown()),

//              Container(
//                padding: EdgeInsets.all(10),
//                child: TextField(
//                  controller: desZipcodeController,
//                  decoration: InputDecoration(
//                      border: OutlineInputBorder(),
//                      labelText: "Delivery zip code"),
//                ),
//              ),

          Container(
            child: Text("Quote has been requested..."
               // price
            ),
          )
        ],
        )
      ),
    ));
  }
}
