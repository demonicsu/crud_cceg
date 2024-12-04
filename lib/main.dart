import 'package:crud2411/pages/crear_cursos.dart';
import 'package:crud2411/pages/editar_cursos.dart';
import 'package:crud2411/pages/home_page.dart';
import 'package:crud2411/pages/login_page.dart';
import 'package:flutter/material.dart';

//Firebase
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
  }
  
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: '/login',
      routes: {
        '/login': (context) => const Login(),
        '/': (context) => const Home(),
        '/create': (context) => const CrearCursos(),
        '/edit': (context) => const EditarCursos(),
      },
    );
  }
}