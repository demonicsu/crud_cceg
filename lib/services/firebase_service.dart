import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db= FirebaseFirestore.instance;

Future<List> verCursos() async {
  List curso = [];
  QuerySnapshot snapshot = await db.collection('curso').get();
  for (var doc in snapshot.docs) {
    final Map<String,dynamic> data = doc.data() as Map<String,dynamic>;
    final cursito = {
      "nombre": data['nombre'],
      "uid": doc.id,
      };
      curso.add(cursito);
    }

return curso;

}
Future<void> guardarCurso(String nombre) async {
  await db.collection('curso').add({'nombre':nombre});

}

Future<void> editarCurso(String uid, String nuevoNombre) async {
  await db.collection('curso').doc(uid).set({'nombre':nuevoNombre});
}

Future<void> eliminarCurso(String uid) async {
  await db.collection('curso').doc(uid).delete();
}