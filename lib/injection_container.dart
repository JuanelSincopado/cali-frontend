import 'package:frontend/features/procedure/data/data_sources/api_procedure_data_source_impl.dart';
import 'package:frontend/features/procedure/data/repositories/procedure_repository_impl.dart';
import 'package:frontend/features/procedure/domain/data_sources/procedure_data_source.dart';
import 'package:frontend/features/procedure/domain/repositories/procedure_repository.dart';
import 'package:frontend/features/procedure/domain/use_cases/get_procedures.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Data Sources
  sl.registerSingleton<ProcedureDataSource>(ApiProcedureDataSourceImpl());

  // Repositories
  sl.registerSingleton<ProcedureRepository>(ProcedureRepositoryImpl(sl()));

  // Use Cases
  sl.registerSingleton<GetProcedureUseCase>(GetProcedureUseCase(sl()));
}
