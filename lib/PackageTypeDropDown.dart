
import 'package:flutter/material.dart';


/// This is the main application widget.


/// This is the stateful widget that the main application instantiates.
class packagetypedropdown extends StatefulWidget {
//  MyStatefulWidget({Key? key}) : super(key: key);

  @override
  _packagetypedropdownState createState() => _packagetypedropdownState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _packagetypedropdownState extends State<packagetypedropdown> {
  String dropdownValue = 'Pallet';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Container(
        padding: EdgeInsets.only(left: 100),
          child: Icon(Icons.arrow_downward)),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.grey),

      underline: Container(
        height: 2,
        color: Colors.grey,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>['Pallet', 'Pallet(48*40)']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

