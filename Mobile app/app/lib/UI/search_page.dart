import 'dart:convert';

import 'package:app/UI/search_box.dart';
import 'package:app/UI/stock_tile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Widget> widgets = [
    SearchBox(),
    SizedBox(
      height: 16,
    )
  ];

  @override
  void initState() {
    for (int i = history.length - 1; i >= 0; i--) {
      widgets.add(ListTile(
        title: Text(history[i]),
        onTap: ()async{
          var res = await http.get(Uri.parse(
            'https://api-for-hackathon.herokuapp.com/ohlc/${history[i].toUpperCase()}'));
        if (res.statusCode == 200) {
          var data = jsonDecode(res.body);
          StockTile tile = new StockTile(
              ukey: data[0]['key'],
              price: data[0]['close'].toDouble(),
              change: data[0]['open'].toDouble() - data[0]['close'].toDouble());
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => Scaffold(
                        backgroundColor: Colors.black,
                        appBar: AppBar(
                          backgroundColor: Colors.black,
                        ),
                        body: ListView(
                          children: [tile],
                        ),
                      )));
        }
        },
      ));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: widgets,
      ),
    );
  }
}
