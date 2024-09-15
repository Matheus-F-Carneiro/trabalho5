import 'package:trabalho5/view/lista_vagas.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: 'AIzaSyAdA0GeyzhcDoQpYyOtn6riccZ4oITwUL0',
    appId: '1:686751681787:android:83a51033c7e38c3bbd745e',
    messagingSenderId: '686751681787',
    projectId: 'trabalho-5-2eb03',
    storageBucket: 'trabalho-5-2eb03.appspot.com',
  ));
  runApp(VagaApp());
}

class VagaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue[200],
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.blue[200], // Your accent color
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blue[200],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: ListaVagas(),
    );
  }
}
