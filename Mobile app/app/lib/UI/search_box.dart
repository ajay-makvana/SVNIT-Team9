import 'dart:convert';

import 'package:app/UI/constans.dart';
import 'package:app/UI/stock_tile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

List<String> history = ['AMZN', 'GOOGL', 'AAPL', 'FB', 'TSLA'];

class SearchBox extends StatelessWidget {
  const SearchBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.grey,
      onChanged: (val) {},
      onSubmitted: (val) async {
        history.add(val);
        var res = await http.get(Uri.parse(
            'https://api-for-hackathon.herokuapp.com/ohlc/${val.toUpperCase()}'));
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
      decoration: InputDecoration(
          fillColor: Colors.grey,
          hintText: 'Search',
          hoverColor: UiColors.primaryColor,
          contentPadding:
              EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: UiColors.primaryColor, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: UiColors.primaryColor, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          suffixIcon: Icon(
            Icons.search,
            color: UiColors.primaryColor,
          )),
    );
  }
}
