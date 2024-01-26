import 'package:frontend/features/procedure/domain/entities/procedure.dart';

abstract class ProcedureDataSource {
  Future<List<ProcedureEntity>> getAll();
}
