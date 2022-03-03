import 'dart:convert';

VersionApp versionAppFromJson(String str) =>
    VersionApp.fromJson(json.decode(str));

String versionAppToJson(VersionApp data) => json.encode(data.toJson());

class VersionApp {
  VersionApp({
    this.currentVersionMessage,
    this.minVersionMessage,
    this.currentVersion,
    this.minVersion,
  });

  String? currentVersionMessage;
  String? minVersionMessage;
  String? currentVersion;
  String? minVersion;

  factory VersionApp.fromJson(Map<String, dynamic> json) => VersionApp(
        currentVersionMessage: json["mensajeVersionActual"],
        minVersionMessage: json["minVersionMessage"],
        currentVersion: json["versionActual"],
        minVersion: json["versionMinima"],
      );

  Map<String, dynamic> toJson() => {
        "mensajeVersionActual": currentVersionMessage,
        "minVersionMessage": minVersionMessage,
        "versionActual": currentVersion,
        "versionMinima": minVersion,
      };

  static VersionApp defaultVersion() {
    return VersionApp(
      currentVersionMessage: '',
      minVersionMessage: '',
      currentVersion: '1.0.0',
      minVersion: '1.0.0',
    );
  }
}
