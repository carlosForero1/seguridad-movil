class Modulo {

  final String nombre;
  final String ruta;
  final String icono;
  final List<String> permisos;

  Modulo({
    required this.nombre,
    required this.ruta,
    required this.icono,
    required this.permisos,
  });

  factory Modulo.fromJson(Map<String, dynamic> json) {

    return Modulo(
      nombre: json["nombre"],
      ruta: json["ruta"],
      icono: json["icono"],
      permisos: List<String>.from(json["permisos"] ?? []),
    );

  }

}