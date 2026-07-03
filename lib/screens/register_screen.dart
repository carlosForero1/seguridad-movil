import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {

  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: const Text("Registro"),

      ),

      body: Padding(

        padding: const EdgeInsets.all(20),

        child: ListView(

          children: const [

            TextField(

              decoration: InputDecoration(

                labelText: "Nombre",

              ),

            ),

            SizedBox(height: 15),

            TextField(

              decoration: InputDecoration(

                labelText: "Correo",

              ),

            ),

            SizedBox(height: 15),

            TextField(

              decoration: InputDecoration(

                labelText: "Usuario",

              ),

            ),

            SizedBox(height: 15),

            TextField(

              decoration: InputDecoration(

                labelText: "Contraseña",

              ),

            ),

            SizedBox(height: 20),

            FilledButton(

              onPressed: null,

              child: Text("Registrarse"),

            )

          ],

        ),

      ),

    );

  }

}