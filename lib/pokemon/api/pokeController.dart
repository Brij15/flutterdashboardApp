

import 'package:http/http.dart' as http;
import 'package:dashboard_app/pokemon/model/pokemon_model.dart';
import 'dart:convert';

// Fetch Pokemon data from the API
class PokeController {
  var url =
      'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';

  Future<PokeModel> getData() async {
    var response = await http.get(Uri.parse(url));
    var dataBindings;

    if (response.statusCode == 200) {
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);

      dataBindings = PokeModel.fromJson(jsonMap);
    }

    return dataBindings;
  }






}