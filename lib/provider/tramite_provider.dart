import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/tramite.dart';

class TramiteProvider with ChangeNotifier {
  TramiteProvider.init() {
    _getAllTramites();
  }

  List<Tramite> _tramites = [];
  bool _isLoading = true;

  List<Tramite> get tramites => _tramites;
  bool get isLoading => _isLoading;

  set tramites(List<Tramite> tramites) {
    _tramites = tramites;
    notifyListeners();
  }

  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  Future<void> _getAllTramites() async {
    try {
      final url = Uri.parse('http://localhost:3000/');

      final response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });

      if (response.statusCode == 200) {
        final apiTramites = jsonDecode(response.body) as List;

        tramites = tramiteFromJson(jsonEncode(apiTramites));
      } else {
        throw Exception('Error al obtener los trámites');
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading = false;
    }
  }
}
