import 'package:flutter/material.dart';
import 'package:dashboard_app/exchange/api/currency_api.dart';
import 'package:dashboard_app/exchange/api/coin_data.dart';
import 'package:dashboard_app/exchange/widget/widget.dart';

class ExchangePage extends StatefulWidget {
  @override
  _ExchangeState createState() => _ExchangeState();
}

class _ExchangeState extends State<ExchangePage> {
  /// set the default currency
  String selectedCurrency = 'USD';
  Map<String, String> coinValues = {};
  bool isWaiting = false;

  @override
  void initState() {
    super.initState();
    getCurrenciesData();
  }

  //Get Different Country currency list for exchange
  getCurrenciesData() async {
    isWaiting = true;
    try {
      dynamic data = await Currency().getCurrencies(selectedCurrency);
      isWaiting = false;
      setState(() {
        coinValues = data;
      });
    } catch (e) {
      print(e);
    }
  }

  //Bind Currency list for exchange
  List<DropdownMenuItem<String>> dropDown() {
    List<DropdownMenuItem<String>> dropDownItems = [];

    for (String currency in currenciesList) {
      //for every currency in the list we create a new dropdownmenu item
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      // add to the list of menu item
      dropDownItems.add(newItem);
    }
    return dropDownItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'CRYPTO EXCHANGE RATES',
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                //BTC vlaue based on country specific
                CardButton(
                  cryptoCurrency: 'BTC',
                  selectedCurrency: selectedCurrency,
                  value: isWaiting ? '?' : coinValues['BTC'],
                ),
                //ETH vlaue based on country specific
                CardButton(
                  cryptoCurrency: 'ETH',
                  selectedCurrency: selectedCurrency,
                  value: isWaiting ? '?' : coinValues['ETH'],
                ),
                //LTC vlaue based on country specific
                CardButton(
                  cryptoCurrency: 'LTC',
                  selectedCurrency: selectedCurrency,
                  value: isWaiting ? '?' : coinValues['LTC'],
                ),
              ]),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: DropdownButton<String>(
              dropdownColor: Colors.lightBlue,
              value: selectedCurrency,
              items: dropDown(),
              onChanged: (value) {
                setState(() {
                  selectedCurrency = value!;

                  /// call this function each time the value in the drop down changes.
                  getCurrenciesData();
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}