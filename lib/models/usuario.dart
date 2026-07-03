class Usuario {

  int? id;

  String nombre;

  String cargo;

  String correo;

  String usuario;

  String contrasena;

  bool? activo;

  String? equipo;

  int? perfilId;

  Usuario({

    this.id,

    required this.nombre,

    required this.cargo,

    required this.correo,

    required this.usuario,

    required this.contrasena,

    this.activo,

    this.equipo,

    this.perfilId,

  });

  Map<String, dynamic> toJson() {

    return {

      "id": id,

      "nombre": nombre,

      "cargo": cargo,

      "correo": correo,

      "usuario": usuario,

      "contrasena": contrasena,

      "activo": activo,

      "equipo": equipo,

      "perfilId": perfilId,

    };

  }

}