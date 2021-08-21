import 'QuotePage.dart';
import 'MyAccount.dart';
import 'PortPage.dart';

/// Flutter code sample for BottomNavigationBar

import 'package:flutter/material.dart';

/// This is the main application widget.

/// This is the stateful widget that the main application instantiates.
class HomePage extends StatefulWidget {
  // HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[quotepage(), myaccount()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quote Page'),
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home), // change icon
            title: Text('Quote'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.business,
            ),
            title: Text('My'),
          ),
//          BottomNavigationBarItem(
//            icon: Icon(
//              Icons.business,
//            ),
//            title: Text('Port'),
//          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
