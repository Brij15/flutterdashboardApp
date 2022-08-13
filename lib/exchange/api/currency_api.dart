import 'dart:convert';

import 'package:dashboard_app/exchange/api/coin_data.dart';
import 'package:http/http.dart' as http;

//API key for coin Exchange
const apiKey = '39EA9CA5-0B3F-4D03-BE2B-0BFC65C689FB';
//Coin Exchange API url
const coinApiUrl = 'https://rest.coinapi.io/v1/exchangerate';

class Currency {
  Future<dynamic> getCurrencies(String currencySelected) async {
    Map<String, String> cryptoPrices = {};

    for (String crypto in cryptoList) {
      String url =
          'https://rest.coinapi.io/v1/exchangerate/$crypto/$currencySelected?apikey=$apiKey';

      /// http.Response response = await http.get(Uri.parse(url));
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        /// interprets a given string as JSON
        var decodedData = jsonDecode(response.body);
        double lastPrice = decodedData['rate'];

        /// key value pair , key(crypto symbol) and value(lastPrice)
        cryptoPrices[crypto] = lastPrice.toStringAsFixed(0);
      } else {
        print(response.statusCode);
        throw 'Problem with the get request';
      }
    }

    return cryptoPrices;
  }
}