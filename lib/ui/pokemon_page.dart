import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:dashboard_app/pokemon/api/pokeController.dart';
import 'package:dashboard_app/pokemon/model/pokemon_model.dart';
import 'package:dashboard_app/pokemon/pages/custom_clipper.dart';

class PokemonPage extends StatefulWidget {
  const PokemonPage({Key? key}) : super(key: key);

  @override
  _PokemonPageState createState() => _PokemonPageState();
}

//Get Pokemon data based on API
class _PokemonPageState extends State<PokemonPage> {
  var _pokeDataModel;
  @override
  void initState() {
    super.initState();
    _pokeDataModel = PokeController().getData();
  }

  //Use flutter swiper for nice UI experience.
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Poke Universe',
                  style: TextStyle(
                      color: Colors.black, fontSize: 18, letterSpacing: 12),
                ),
                SizedBox(
                  height: 40,
                ),
                FutureBuilder<PokeModel>(
                    future: _pokeDataModel,
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return Center(child: CircularProgressIndicator());


                        default:
                          if (snapshot.hasError) {
                            return  Center(child: CircularProgressIndicator());

                          } else {
                            return Container(
                              height: 520,
                              width: MediaQuery.of(context).size.width,
                              child: Swiper(
                                viewportFraction: 0.8,
                                fade: 0.3,
                                scale: 0.9,
                                autoplay: true,
                                itemCount: snapshot.data!.pokemon.length,
                                itemBuilder: (BuildContext context, int index) {
                                  var pokeList = snapshot.data!.pokemon[index];
                                  return ClipPath(
                                    clipper: CardClipper(),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width * 0.8,
                                      height:
                                      MediaQuery.of(context).size.width * 0.8 * 1.55,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Colors.orange,
                                            Colors.deepOrangeAccent,
                                          ],
                                          begin: Alignment.topRight,
                                          end: Alignment.bottomLeft,
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Spacer(
                                            flex: 4,
                                          ),
                                          Image(
                                            image: NetworkImage(pokeList.img,scale: 0.6),
                                            fit: BoxFit.fill,
                                          ),
                                          SizedBox(
                                            height: 60,
                                          ),
                                          Container(
                                            height: 80,
                                            width: MediaQuery.of(context).size.width,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft: Radius.circular(10),
                                                    bottomRight: Radius.circular(10)),
                                                color: Colors.white),
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Text(pokeList.name,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 20)),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text(
                                                          "Height "
                                                              '${pokeList.height}',
                                                          style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 13)),
                                                      Text(
                                                          "Weight "
                                                              '${pokeList.weight}',
                                                          style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 13)),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },

                              ),
                            );
                          }
                      }
                    }),
              ],
            ),
          )),
    );
  }
}