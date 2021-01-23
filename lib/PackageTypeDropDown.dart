
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
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>['One', 'Two', 'Free', 'Four']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

