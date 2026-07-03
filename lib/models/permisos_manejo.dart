class PermisosManejo {

  final bool usoUSB;
  final bool usoCmd;
  final bool powerShell;
  final bool permisoDescargas;
  final bool usoInternet;
  final bool redesSociales;
  final bool streaming;
  final bool sitiosNoSeguros;

  final bool clonado;
  final bool clonadoMasivo;

  final bool analisisVirusSimple;
  final bool analisisVirusCompleto;

  PermisosManejo({

    required this.usoUSB,

    required this.usoCmd,

    required this.powerShell,

    required this.permisoDescargas,

    required this.usoInternet,

    required this.redesSociales,

    required this.streaming,

    required this.sitiosNoSeguros,

    required this.clonado,

    required this.clonadoMasivo,

    required this.analisisVirusSimple,

    required this.analisisVirusCompleto,

  });

  factory PermisosManejo.fromJson(

      Map<String, dynamic> json,

      ) {

    return PermisosManejo(

      usoUSB: json["usoUSB"] ?? false,

      usoCmd: json["usoCmd"] ?? false,

      powerShell: json["powerShell"] ?? false,

      permisoDescargas: json["permisoDescargas"] ?? false,

      usoInternet: json["usoInternet"] ?? false,

      redesSociales: json["redesSociales"] ?? false,

      streaming: json["streaming"] ?? false,

      sitiosNoSeguros: json["sitiosNoSeguros"] ?? false,

      clonado: json["clonado"] ?? false,

      clonadoMasivo: json["clonadoMasivo"] ?? false,

      analisisVirusSimple: json["analisisVirusSimple"] ?? false,

      analisisVirusCompleto: json["analisisVirusCompleto"] ?? false,

    );

  }

}