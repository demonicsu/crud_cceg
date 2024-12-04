import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

TextEditingController nameController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Image(image: AssetImage('assets/cceg.png')),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
              "Plataforma de cursos y asesorías online",
              style: TextStyle(
                fontWeight: FontWeight.bold, // Hace que el texto sea negrita
              ),
                        ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
              backgroundColor:Colors.blue,
              foregroundColor: Colors.white
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              child: const Text('Iniciar sesión'),
            ),
          ],
        ),
      ),
    );
  }
}