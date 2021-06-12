import 'package:flutter/material.dart';

class pickupcitydropdown extends StatefulWidget {
  @override
  _pickupcitydropdownState createState() => _pickupcitydropdownState();
}

class _pickupcitydropdownState extends State<pickupcitydropdown> {
  String dropdownValue = 'lax';

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
        items: <String>['lax', 'okc', 'tx']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      );
  }
  }
