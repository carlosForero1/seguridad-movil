import 'menuresponse.dart';

class LoginResponse {

  final String nombre;

  final int? cargo;

  final String correo;

  final String usuario;

  final String token;

  final String? horarioInicio;

  final String? horaSalida;

  final bool usoAparatosExternos;

  final MenuResponse menu;

  LoginResponse({

    required this.nombre,

    required this.cargo,

    required this.correo,

    required this.usuario,

    required this.token,

    required this.horarioInicio,

    required this.horaSalida,

    required this.usoAparatosExternos,

    required this.menu,

  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {

    return LoginResponse(

      nombre: json["nombre"],

      cargo: json["cargo"],

      correo: json["correo"],

      usuario: json["usuario"],

      token: json["token"],

      horarioInicio: json["horarioInicio"],

      horaSalida: json["horaSalida"],

      usoAparatosExternos: json["usoAparatosExternos"] ?? false,

      menu: MenuResponse.fromJson(json["menu"]),

    );

  }

}