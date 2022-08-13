import 'package:dashboard_app/ui/exchange_page.dart';
import 'package:dashboard_app/ui/pokemon_page.dart';
import 'package:dashboard_app/ui/weather_page.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget{
  Dashboard({Key? key}) : super(key: key);

  @override
  _dashboardState createState() => _dashboardState();
}

//Dashboard Page with bottom navigation (Weather, Pokemon, Exchange)
class _dashboardState extends State<Dashboard> {
  int currentIndex = 0;
  final screens = [
    //Weather Widget
    WeatherPage(),
    //Pokemon Widget
    PokemonPage(),
    //Crypto Exchnage Widget
    ExchangePage()
  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        iconSize: 40,
        selectedFontSize: 20,
        unselectedFontSize: 15,
        showUnselectedLabels: false,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        //Set Bottom Navigation
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud),
            label: 'Weather',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.catching_pokemon),
            label: 'Pokemon',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.currency_exchange),
            label: 'Exchange',
            backgroundColor: Colors.blue,
          ),

        ],
      ),
    );
  }
}