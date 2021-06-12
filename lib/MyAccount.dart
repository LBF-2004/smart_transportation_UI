import 'package:app/AuthManager.dart';
import 'package:app/QuoteDetailPage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final List<String> entries = <String>['A', 'B', 'C'];
final List<int> colorCodes = <int>[600, 500, 100];
// ${entries[index]}

class myaccount extends StatefulWidget {
  @override
  _myaccountState createState() => _myaccountState();
}

class _myaccountState extends State<myaccount> {
  var entries = [ ];
  int countOccurrencesUsingLoop(List<String> list, String element) {
    if (list == null || list.isEmpty) {
      return 0;
    }

    int num = 0;
    for (int i = 0; i < list.length; i++) {
      if (list[i] == element) {
        num++;
      }
    }
    return num;
  }


//define


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    http.get("http://10.0.2.2:5000" + "/" + "list_all_my_quotes" + "/" + AuthManager.email).then((res){
      print("Request success!");

      print (res.body);
      entries = [];
      var quotes = json.decode(res.body);
      for(var q in quotes) {
        print(q);
        entries.add(q);
      }
      setState(() {
      });
    }).catchError((error){
      print("Request failed!");
      print(error);
    });



  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 50,
          child: RaisedButton(
            child: Text("Quote"),
            onPressed: () {
              showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return AlertDialog(
                        title: Text("Quote Detail"),
                        content: SingleChildScrollView(
                            child: ListBody(
                              children: [
                                Text("Origin City: "),
                                Text("Destination: "),
                                Text("Container Count: "),
                                Text("Item Description: "),
                                Text("Result: ")
                              ],
                            )
                        )
                    );
                  }
              );
            }
          )

        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
