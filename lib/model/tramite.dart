// To parse this JSON data, do
//
//     final tramite = tramiteFromJson(jsonString);

import 'dart:convert';

List<Tramite> tramiteFromJson(String str) =>
    List<Tramite>.from(json.decode(str).map((x) => Tramite.fromJson(x)));

String tramiteToJson(List<Tramite> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Tramite {
  String id;
  String title;
  List<TramiteOption> options;

  Tramite({
    required this.id,
    required this.title,
    required this.options,
  });

  factory Tramite.fromJson(Map<String, dynamic> json) => Tramite(
        id: json["_id"],
        title: json["title"],
        options: List<TramiteOption>.from(
            json["options"].map((x) => TramiteOption.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "options": List<dynamic>.from(options.map((x) => x.toJson())),
      };

  bool hasSubOptions() {
    return options.map((e) => e.options.isNotEmpty).contains(true);
  }
}

class TramiteOption {
  String id;
  String title;
  String? url;
  List<OptionOption> options;

  TramiteOption({
    required this.id,
    required this.title,
    this.url,
    required this.options,
  });

  factory TramiteOption.fromJson(Map<String, dynamic> json) => TramiteOption(
        id: json["_id"],
        title: json["title"],
        url: json["url"],
        options: json["options"] == null
            ? []
            : List<OptionOption>.from(
                json["options"]!.map((x) => OptionOption.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "url": url,
        "options": List<dynamic>.from(options.map((x) => x.toJson())),
      };
}

class OptionOption {
  String title;
  String? url;

  OptionOption({
    required this.title,
    this.url,
  });

  factory OptionOption.fromJson(Map<String, dynamic> json) => OptionOption(
        title: json["title"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "url": url,
      };
}
