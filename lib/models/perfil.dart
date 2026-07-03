import 'package:sistema_seguridad/models/permisos_manejo.dart';

class Perfil {

  final int id;

  final String nombre;

  final PermisosManejo permisosManejo;

  Perfil({

    required this.id,

    required this.nombre,

    required this.permisosManejo,

  });

  factory Perfil.fromJson(Map<String, dynamic> json) {

    return Perfil(

      id: json["id"],

      nombre: json["nombre"],

      permisosManejo: PermisosManejo.fromJson(

          json["permisosManejo"]

      ),

    );

  }

}