import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/material.dart';
import 'package:movie_quotes/pages/movie_quotes_list_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseUIAuth.configureProviders([
    EmailAuthProvider(),
    GoogleProvider(
        clientId:
            "745415003062-i9ssbrbqqsafuvu7ehm62lfen5tj10vh.apps.googleusercontent.com"),
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie Quotes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MovieQuotesListPage(),
    );
  }
}
