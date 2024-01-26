import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/features/procedure/data/models/api_procedure.dart';
import 'package:frontend/features/procedure/domain/entities/procedure.dart';
import 'package:http/http.dart' as http;

import '../../domain/data_sources/procedure_data_source.dart';

class ApiProcedureDataSourceImpl implements ProcedureDataSource {
  @override
  Future<List<ProcedureEntity>> getAll() async {
    try {
      final url = Uri.parse('http://localhost:3000/');

      final response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });

      if (response.statusCode == 200) {
        final apiProcedures = jsonDecode(response.body) as List;
        final procedures = apiProcedures.map((apiProcedure) {
          return ApiProcedure.fromJson(apiProcedure).toEntity();
        }).toList();

        return procedures;
      } else {
        throw Exception('Error al obtener los trámites');
      }
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }
}
