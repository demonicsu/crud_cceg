import 'package:crud2411/services/firebase_service.dart';
import 'package:flutter/material.dart';

class CrearCursos extends StatefulWidget {
  const CrearCursos({super.key});

  @override
  State<CrearCursos> createState() => _CrearCursosState();
}

class _CrearCursosState extends State<CrearCursos> {

TextEditingController nameController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Crear curso'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: 'Ingrese nombre del curso',
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
              backgroundColor:Colors.blue,
              foregroundColor: Colors.white
              ),
              onPressed: () async {
                await guardarCurso(nameController.text).then((_) {
                  Navigator.pop(context);
                });

            }, child: const Text("Guardar"))
          ],
        ),
      )

    );
  }
}