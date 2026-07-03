import 'package:flutter/material.dart';
import 'package:sistema_seguridad/screens/Module_screen.dart';

import '../models/login_response.dart';
import '../models/modulo.dart';
import '../services/auth_service.dart';
import 'login_screen.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {

  final AuthService auth = AuthService();

  LoginResponse? usuario;

  @override
  void initState() {

    super.initState();

    cargarSesion();

  }

  Future<void> cargarSesion() async {

    usuario = await auth.obtenerSesion();

    setState(() {});

  }

  @override
  Widget build(BuildContext context) {

    if(usuario == null){

      return const Scaffold(

        body: Center(
          child: CircularProgressIndicator(),
        ),

      );

    }

    return Scaffold(

      appBar: AppBar(

        title: Text("Bienvenido ${usuario!.nombre}"),

        actions: [

          IconButton(

            icon: const Icon(Icons.logout),

            onPressed: () async {

              await auth.logout();

              Navigator.pushReplacement(

                context,

                MaterialPageRoute(

                  builder: (_) => const LoginScreen(),

                ),

              );

            },

          )

        ],

      ),

      body: ListView(

        padding: const EdgeInsets.all(15),

        children: [

          Text(

            "Perfil: ${usuario!.menu.perfil}",

            style: const TextStyle(

              fontSize: 22,

              fontWeight: FontWeight.bold,

            ),

          ),

          const SizedBox(height: 20),

          ...usuario!.menu.modulos.map(

                (Modulo modulo){

              return Card(

                child: ListTile(

                  leading: const Icon(Icons.dashboard),

                  title: Text(modulo.nombre),

                  subtitle: Text(modulo.ruta),

                  trailing: const Icon(Icons.arrow_forward_ios),

                  onTap: (){

                    Navigator.push(

                      context,

                      MaterialPageRoute(

                        builder: (_) => ModuleScreen(modulo),

                      ),

                    );

                  },

                ),

              );

            },

          )

        ],

      ),

    );

  }

}