import 'package:flutter/material.dart';

import 'package:pagina_de_peliculas/screens/add_actor.dart';
import 'package:pagina_de_peliculas/widgets/actor_display_list.dart';

class ActorList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

      },
      child: Scaffold(
        backgroundColor: Colors.black,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => AddActor(),
              ),
            );
          },
          backgroundColor: Colors.indigoAccent,
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 50,
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 20.0,
            ),
            child: ActorDisplayList()
          ),
        ),
      ),
    );
  }
}
