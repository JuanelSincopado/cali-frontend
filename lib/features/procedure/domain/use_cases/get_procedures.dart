import 'package:frontend/features/procedure/domain/entities/procedure.dart';
import 'package:frontend/features/procedure/domain/repositories/procedure_repository.dart';

class GetProcedureUseCase {
  final ProcedureRepository _repository;

  GetProcedureUseCase(this._repository);

  Future<List<ProcedureEntity>> call() {
    return _repository.getAll();
  }
}
