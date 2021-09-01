import 'dart:convert';
import 'dart:math';

import 'package:app/UI/constans.dart';
import 'package:app/UI/stock_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class StockTile extends StatelessWidget {
  final String ukey;
  final String name;
  final double price;
  final double change;

  const StockTile(
      {Key? key,
      required this.ukey,
      required this.price,
      required this.change,
      this.name = 'Apple'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () async {
        var res = await http.get(
            Uri.parse('https://api-for-hackathon.herokuapp.com/ohlc/${ukey}'));
        var data = jsonDecode(res.body);
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (_) => StockDetail(
                      stockDetail: data,
                    )));
      },
      dense: false,
      leading: CircleAvatar(
        child: Text(
          ukey[0],
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: UiColors.avatarBgColor[Random().nextInt(6)],
      ),
      title: Text(
        '\$${ukey}',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        ukey,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 12),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("\$${price.toString()}"),
          Text(
            change > 0
                ? '+${change.toStringAsFixed(2)}%'
                : '-${change.toStringAsFixed(2)}%',
            style: TextStyle(color: change > 0 ? Colors.green : Colors.red),
          )
        ],
      ),
    );
  }
}
