import 'modulo.dart';

class MenuResponse {

  final String perfil;

  final List<Modulo> modulos;

  MenuResponse({

    required this.perfil,

    required this.modulos,

  });

  factory MenuResponse.fromJson(Map<String, dynamic> json) {

    return MenuResponse(

      perfil: json["perfil"],

      modulos: (json["modulos"] as List)
          .map((e) => Modulo.fromJson(e))
          .toList(),

    );

  }

}