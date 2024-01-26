// To parse this JSON data, do
//
//     final tramite = tramiteFromJson(jsonString);

import 'dart:convert';

import 'package:frontend/features/procedure/domain/entities/procedure.dart';

List<ApiProcedure> apiProceduresFromJson(String str) => List<ApiProcedure>.from(
    json.decode(str).map((x) => ApiProcedure.fromJson(x)));

String apiProceduresToJson(List<ApiProcedure> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ApiProcedure {
  String id;
  String title;
  List<ApiTramiteOption> options;

  ApiProcedure({
    required this.id,
    required this.title,
    required this.options,
  });

  factory ApiProcedure.fromJson(Map<String, dynamic> json) => ApiProcedure(
        id: json["_id"],
        title: json["title"],
        options: List<ApiTramiteOption>.from(
            json["options"].map((x) => ApiTramiteOption.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "options": List<dynamic>.from(options.map((x) => x.toJson())),
      };

  ProcedureEntity toEntity() => ProcedureEntity(
        id: id,
        title: title,
        options: options.map((e) => e.toEntity()).toList(),
      );
}

class ApiTramiteOption {
  String id;
  String title;
  String? url;
  List<ApiOptionOption> options;

  ApiTramiteOption({
    required this.id,
    required this.title,
    this.url,
    required this.options,
  });

  factory ApiTramiteOption.fromJson(Map<String, dynamic> json) =>
      ApiTramiteOption(
        id: json["_id"],
        title: json["title"],
        url: json["url"],
        options: json["options"] == null
            ? []
            : List<ApiOptionOption>.from(
                json["options"]!.map((x) => ApiOptionOption.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "url": url,
        "options": List<dynamic>.from(options.map((x) => x.toJson())),
      };

  TramiteOptionEntity toEntity() => TramiteOptionEntity(
        id: id,
        title: title,
        url: url,
        options: options.map((e) => e.toEntity()).toList(),
      );
}

class ApiOptionOption {
  String title;
  String? url;

  ApiOptionOption({
    required this.title,
    this.url,
  });

  factory ApiOptionOption.fromJson(Map<String, dynamic> json) =>
      ApiOptionOption(
        title: json["title"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "url": url,
      };

  OptionOptionEntity toEntity() => OptionOptionEntity(
        title: title,
        url: url,
      );
}
