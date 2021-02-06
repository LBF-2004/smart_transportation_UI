import 'package:app/QuoteDetailPage.dart';
import 'package:flutter/material.dart';

class myaccount extends StatefulWidget {
  @override
  _myaccountState createState() => _myaccountState();
}

class _myaccountState extends State<myaccount> {
  final List<String> entries = <String>['Quote A', 'Quote B', 'Quote C']; //define
  final List<int> colorCodes = <int>[600, 500, 100]; //define
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: entries.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 50,
                    color: Colors.amber[colorCodes[index]],
                    child: ListTile(
                        title: Center(child: Text('Entry ${entries[index]}'
                        )
                        ),
                            onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder:(context) => quotedetailpage()));
                        }
                    ),

                  );
                })));
  }
}
