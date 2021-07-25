import 'package:flutter/material.dart';
import 'package:bitcoin_ticker/networking/network.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

import '../constant.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

String selectedValue = currenciesList[0];

class _HomeScreenState extends State<HomeScreen> {
   String price="?";
  Widget androidDropDown() {
    return DropdownButton(
      value: selectedValue,
      onChanged: (String? newvalue) {
        setState(() {
          selectedValue = newvalue!;
          getPrice();
        });
      },
      items: currenciesList
          .map(
            (value) => DropdownMenuItem(
              child: Text("$value"),
              value: value,
            ),
          )
          .toList(),
    );
  }

  Widget iosPiker() {
    return CupertinoPicker(
      itemExtent: 32.0,
      onSelectedItemChanged: (newvalue) {
        setState(() {
          selectedValue = currenciesList[newvalue];
           getPrice();
        });
      },
      children: currenciesList.map((value) => Text(value)).toList(),
    );
  }

  getPrice() async {
    price = await getData(selectedValue);
  }

  @override
  void initState() {
    super.initState();
    getPrice();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "BitCoin Ticker",
          style: KTextStyle,
        )),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "1 BTC = $price $selectedValue",
                  style: KTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              color: Colors.lightBlue[400],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          ),
          Container(
            height: 130.0,
            alignment: Alignment.center,
            color: Colors.lightBlue[400],
            child: Platform.isIOS ? iosPiker() : androidDropDown(),
          ),
        ],
      ),
    );
  }
}
