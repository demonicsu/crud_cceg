import 'package:crud2411/services/firebase_service.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });
  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            LogoAppBar(),
            Column(
              children: [
                Text("CURSOS DISPONIBLES")
              ],
            ),
            
          ],
        
        ),
        toolbarHeight: 100.0,
      ),
      body: FutureBuilder(
      future: verCursos(), 
      builder: ((context,snapshot) {
        if (snapshot.hasData) {
          print(snapshot.data);
          return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
            return Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.amber, Colors.white],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                ),
              child: Dismissible(
                onDismissed: (direction){
                  eliminarCurso(snapshot.data![index]['uid']);
                  snapshot.data?.removeAt(index);
                },
                confirmDismiss: (direction) async {
                  bool result = false;
                  result = await showDialog(context: context, builder: (context) {
                    return AlertDialog(
                      title: Text('¿Estás seguro de eliminar: ${snapshot.data?[index]['nombre']}?'),
                      actions: [
                        TextButton(onPressed: (){
                          Navigator.pop(
                            context, 
                            false,
                            );
                        }, child: const Text("Cancelar", style: TextStyle(color: Colors.red),)),
                        TextButton(onPressed: (){
                          Navigator.pop(
                            context, 
                            true,
                            );
                        }, child: const Text("Si, estoy seguro"))
                      ],
                    );
                  });
                  return result;
                },
                background: Container(
                  color: Colors.red,
                  child: const Icon(Icons.delete),
                ),
                direction: DismissDirection.endToStart,
                key: Key(snapshot.data?[index]["uid"]),
                child: ListTile(
                  title: Text(snapshot.data![index]['nombre']),
                  onTap: (() async {
                    await Navigator.pushNamed(context, "/edit", arguments: {
                      "nombre":snapshot.data?[index]["nombre"],
                      "uid":snapshot.data?[index]["uid"],
                      
                    });
                    setState(() {});
                  })),
              ),
            );
          }
          );
      }else{
        return const Center(child: CircularProgressIndicator());
      }
      }
      )),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: () async {
            await Navigator.pushNamed(context, '/create');
            setState(() {});
          },
          child: const Icon(Icons.add),
          
          ),
    );
  }
}

class LogoAppBar extends StatelessWidget {
  const LogoAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 300, // Ajusta el ancho según sea necesario
      height: 100, // Ajusta la altura según sea necesario
      child: Image(
        image: AssetImage('assets/cceg.png'),
        fit: BoxFit.contain,
      ),
    );
  }
} 
