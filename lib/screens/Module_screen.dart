import 'package:flutter/material.dart';

import '../models/modulo.dart';

class ModuleScreen extends StatelessWidget {

  final Modulo modulo;

  const ModuleScreen(this.modulo,{super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: Text(modulo.nombre),

      ),

      body: Padding(

        padding: const EdgeInsets.all(20),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Text(

              modulo.nombre,

              style: const TextStyle(

                fontSize: 25,

                fontWeight: FontWeight.bold,

              ),

            ),

            const SizedBox(height:20),

            Text("Ruta: ${modulo.ruta}"),

            const SizedBox(height:20),

            const Text(

              "Permisos",

              style: TextStyle(

                fontSize:20,

                fontWeight: FontWeight.bold,

              ),

            ),

            const SizedBox(height:10),

            ...modulo.permisos.map(

                  (e)=>ListTile(

                leading: const Icon(Icons.check),

                title: Text(e),

              ),

            )

          ],

        ),

      ),

    );

  }

}