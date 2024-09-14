//TODO: import 'package:trabalho5/view/lista_vagas.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(CursoApp());
}

class CursoApp extends StatelessWidget {
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
      // TODO: home: ListaVagas(),
    );
  }
}
