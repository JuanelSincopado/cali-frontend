class ProcedureEntity {
  String id;
  String title;
  List<TramiteOptionEntity> options;

  ProcedureEntity({
    required this.id,
    required this.title,
    required this.options,
  });

  bool hasSubOptions() {
    return options.map((e) => e.options.isNotEmpty).contains(true);
  }
}

class TramiteOptionEntity {
  String id;
  String title;
  String? url;
  List<OptionOptionEntity> options;

  TramiteOptionEntity({
    required this.id,
    required this.title,
    this.url,
    required this.options,
  });
}

class OptionOptionEntity {
  String title;
  String? url;

  OptionOptionEntity({
    required this.title,
    this.url,
  });
}
