import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/login_request.dart';
import '../models/login_response.dart';
import '../models/usuario.dart';

class AuthService {

  static const String baseUrl =
      "http://192.168.1.16:8080/autenticacion";

  /*********************************************
   * LOGIN
   *********************************************/

  Future<LoginResponse?> login(LoginRequest request) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/login"),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(request.toJson()),
      );

      if (response.statusCode == 200) {
        final usuario = LoginResponse.fromJson(
          jsonDecode(response.body),
        );

        await guardarSesion(usuario);

        return usuario;
      }

      print("Error ${response.statusCode}");
      print(response.body);

      return null;
    } catch (e) {
      print("Error Login: $e");
      return null;
    }
  }

  /*********************************************
   * GUARDAR SESIÓN
   *********************************************/

  Future<void> guardarSesion(LoginResponse usuario) async {

    final prefs = await SharedPreferences.getInstance();

    await prefs.setString("token", usuario.token);

    await prefs.setString("usuario", usuario.usuario);

    await prefs.setString("correo", usuario.correo);

    await prefs.setString("nombre", usuario.nombre);

    await prefs.setString("perfil", usuario.menu.perfil);

  }

  /*********************************************
   * OBTENER TOKEN
   *********************************************/

  Future<String?> obtenerToken() async {

    final prefs =
    await SharedPreferences.getInstance();

    return prefs.getString("token");

  }

  /*********************************************
   * ¿ESTÁ LOGUEADO?
   *********************************************/

  Future<bool> estaLogueado() async {

    final prefs =
    await SharedPreferences.getInstance();

    return prefs.containsKey("token");

  }

  /*********************************************
   * CERRAR SESIÓN
   *********************************************/

  Future<void> logout() async {

    final prefs =
    await SharedPreferences.getInstance();

    await prefs.clear();

  }

  Future<LoginResponse?> obtenerSesion() async {

    final prefs = await SharedPreferences.getInstance();

    final data = prefs.getString("login");

    if (data == null) {
      return null;
    }

    return LoginResponse.fromJson(
      jsonDecode(data),
    );

  }

}