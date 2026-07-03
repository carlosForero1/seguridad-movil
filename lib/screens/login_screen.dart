import 'package:flutter/material.dart';

import '../models/login_request.dart';
import '../services/auth_service.dart';
import 'home_screen.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();

}

class _LoginScreenState extends State<LoginScreen> {

  final usuarioController = TextEditingController();

  final passwordController = TextEditingController();

  bool cargando = false;

  final auth = AuthService();

  Future<void> login() async {

    setState(() {
      cargando = true;
    });

    final respuesta = await auth.login(

      LoginRequest(

        usuario: usuarioController.text,

        contrasena: passwordController.text,

      ),

    );

    setState(() {
      cargando = false;
    });

    if (respuesta != null) {

      Navigator.pushReplacement(

        context,

        MaterialPageRoute(

          builder: (_) => const HomeScreen(),

        ),

      );

    } else {

      ScaffoldMessenger.of(context).showSnackBar(

        const SnackBar(

          content: Text("Usuario o contraseña incorrectos"),

        ),

      );

    }

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Center(

        child: SizedBox(

          width: 350,

          child: Card(

            elevation: 10,

            child: Padding(

              padding: const EdgeInsets.all(25),

              child: Column(

                mainAxisSize: MainAxisSize.min,

                children: [

                  const Icon(
                    Icons.security,
                    size: 70,
                    color: Colors.blue,
                  ),

                  const SizedBox(height: 15),

                  const Text(

                    "AI SECURITY",

                    style: TextStyle(

                      fontSize: 24,

                      fontWeight: FontWeight.bold,

                    ),

                  ),

                  const SizedBox(height: 25),

                  TextField(

                    controller: usuarioController,

                    decoration: const InputDecoration(

                      labelText: "Usuario",

                      border: OutlineInputBorder(),

                    ),

                  ),

                  const SizedBox(height: 15),

                  TextField(

                    controller: passwordController,

                    obscureText: true,

                    decoration: const InputDecoration(

                      labelText: "Contraseña",

                      border: OutlineInputBorder(),

                    ),

                  ),

                  const SizedBox(height: 20),

                  SizedBox(

                    width: double.infinity,

                    child: ElevatedButton(

                      onPressed: cargando ? null : login,

                      child: cargando

                          ? const CircularProgressIndicator()

                          : const Text("Iniciar sesión"),

                    ),

                  ),

                ],

              ),

            ),

          ),

        ),

      ),

    );

  }

}