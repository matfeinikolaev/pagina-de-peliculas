import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class Database {
  static String? userUid;

  static Future<void> addMovie({
    required String title,
    required String genre,
    required String year,
  }) async {
    DocumentReference documentReferencer = _firestore.collection('movies').doc();
    DocumentReference genreReferencer = _firestore.collection('genres').doc();
    Map<String, dynamic> data = <String, dynamic>{
      "title": title,
      "genre": genre,
      "year": year,
    };
    Map<String, dynamic> genreData = <String, dynamic>{
        "genre": genre,
        "title": title,
        "year": year,
    };
    await documentReferencer
        .set(data)
        .whenComplete(() => print("Movie added to the database"))
        .catchError((e) => print(e));
    await genreReferencer
        .set(genreData)
        .whenComplete(() => print("Genre added to the database"))
        .catchError((e) => print(e));
  }

  static Future<void> addActor({
    required String name,
    required String sex,
    required String movie,
  }) async {
    DocumentReference documentReferencer = _firestore.collection('actors').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "name": name,
      "sex": sex,
      "movie": movie,
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Actor added to the database"))
        .catchError((e) => print(e));
  }

  static Future<void> updateMovie({
    required String title,
    required String genre,
    required String year,
    required String docId,
  }) async {
    DocumentReference documentReferencer =
    _firestore.collection('movies').doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "title": title,
      "genre": genre,
      "year": year
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => print("Movie updated in the database"))
        .catchError((e) => print(e));
  }


  static Future<void> updateActor({
    required String name,
    required String sex,
    required String movie,
    required String docId,
  }) async {
    DocumentReference documentReferencer =
      _firestore.collection('actors').doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "name": name,
      "sex": sex,
      "movie": movie
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => print("Actor updated in the database"))
        .catchError((e) => print(e));
  }

  static Stream<QuerySnapshot> getGenres() {
    CollectionReference notesItemCollection = _firestore.collection('genres');

    return notesItemCollection.snapshots();
  }

  static Stream<QuerySnapshot> getMovies() {
    CollectionReference notesItemCollection = _firestore.collection('movies');

    return notesItemCollection.snapshots();
  }

  static Stream<QuerySnapshot> getActors() {
    CollectionReference notesItemCollection = _firestore.collection('actors');

    return notesItemCollection.snapshots();
  }

  static Future<void> deleteMovie({
    required String docId,
  }) async {
    DocumentReference documentReferencer = _firestore.collection('movies').doc(docId);

    await documentReferencer
        .delete()
        .whenComplete(() => print('Movie deleted from the database'))
        .catchError((e) => print(e));
  }

  static Future<void> deleteActor({
    required String docId,
  }) async {
    DocumentReference documentReferencer = _firestore.collection('actors').doc(docId);

    await documentReferencer
        .delete()
        .whenComplete(() => print('Actor deleted from the database'))
        .catchError((e) => print(e));
  }
}
