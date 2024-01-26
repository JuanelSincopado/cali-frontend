import 'package:flutter/material.dart';
import 'package:frontend/features/procedure/domain/entities/procedure.dart';
import 'package:frontend/injection_container.dart';

import '../../domain/use_cases/get_procedures.dart';

class ProcedureProvider with ChangeNotifier {
  ProcedureProvider.init() {
    _getAllProcedures();
  }

  List<ProcedureEntity> _procedures = [];
  bool _isLoading = true;

  List<ProcedureEntity> get procedures => _procedures;
  bool get isLoading => _isLoading;

  set procedures(List<ProcedureEntity> procedures) {
    _procedures = procedures;
    notifyListeners();
  }

  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  Future<void> _getAllProcedures() async {
    final GetProcedureUseCase procedureUseCase = sl();

    procedures = await procedureUseCase.call();

    isLoading = false;
  }
}
