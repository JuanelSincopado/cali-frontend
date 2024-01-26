import 'package:frontend/features/procedure/domain/entities/procedure.dart';

abstract class ProcedureRepository {
  Future<List<ProcedureEntity>> getAll();
}
