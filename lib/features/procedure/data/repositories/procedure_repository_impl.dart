import 'package:frontend/features/procedure/domain/entities/procedure.dart';

import '../../domain/data_sources/procedure_data_source.dart';
import '../../domain/repositories/procedure_repository.dart';

class ProcedureRepositoryImpl implements ProcedureRepository {
  final ProcedureDataSource procedureDataSource;

  ProcedureRepositoryImpl(this.procedureDataSource);

  @override
  Future<List<ProcedureEntity>> getAll() {
    return procedureDataSource.getAll();
  }
}
