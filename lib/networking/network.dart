import 'dart:convert';

import 'package:http/http.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

Future<dynamic> getData(String selectedCurrency) async {
  String coinuri = 'https://rest.coinapi.io/v1/exchangerate';
  String apikey = '9D256BD0-D366-4352-B751-4D29C2788CC6';
  try {
String uri='$coinuri/BTC/$selectedCurrency?apikey=$apikey';
    Response response = await get(Uri.parse(uri));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      double price = data['rate'];
      return price.toStringAsFixed(0);
    } else {
      return print(response.statusCode);
    }
  } catch (error) {
    return print("error :$error");
  }
}
