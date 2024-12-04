import 'package:crud2411/services/firebase_service.dart';
import 'package:flutter/material.dart';

class EditarCursos extends StatefulWidget {
  const EditarCursos({super.key});

  @override
  State<EditarCursos> createState() => _EditarCursosState();
}

class _EditarCursosState extends State<EditarCursos> {
  
TextEditingController nameController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    nameController.text=arguments['nombre'];
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Editar curso'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: 'Ingrese modificación',
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
              backgroundColor:Colors.blue,
              foregroundColor: Colors.white
              ),
              onPressed: () async {
                await editarCurso(arguments['uid'], nameController.text)
                .then((_) {
                  Navigator.pop(context);
                });


            }, child: const Text("Actualizar"))
          ],
        ),
      )
    );
  }
}