import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pagina_de_peliculas/widgets/movie_list.dart';
import 'package:pagina_de_peliculas/widgets/actor_list.dart';
import 'package:pagina_de_peliculas/widgets/genre_list.dart';

class MainList extends StatefulWidget {
  @override
  _MainListState createState() => _MainListState();
}

class _MainListState extends State<MainList> {
  final FocusNode _uidFocusNode = FocusNode();
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _uidFocusNode.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FutureBuilder(
                  future: _initializeFirebase(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error initializing Firebase');
                    } else if (snapshot.connectionState == ConnectionState.done) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.indigoAccent,
                                fixedSize: Size(240, 80),
                                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                                textStyle: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold
                                )
                            ),
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => MovieList(),
                                ),
                              );
                            },
                            child: const Text('Peliculas'),
                          ),
                          const SizedBox(height: 30),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.indigoAccent,
                              fixedSize: Size(240, 80),
                              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                              textStyle: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold
                              )
                            ),
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => ActorList(),
                                ),
                              );
                            },
                            child: const Text('Actores'),
                          ),

                          const SizedBox(height: 30),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.indigoAccent,
                              fixedSize: Size(240, 80),
                              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                              textStyle: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold
                              )
                            ),
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => GenreList(),
                                ),
                              );
                            },
                            child: const Text('Categorias'),
                          ),

                        ],
                      );
                    } else {
                      return CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.orange,
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
