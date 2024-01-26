import 'package:flutter/material.dart';
import 'package:frontend/features/procedure/presentation/providers/procedure_provider.dart';
import 'package:frontend/injection_container.dart';
import 'package:provider/provider.dart';

import 'screen/home/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProcedureProvider.init()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1E8BDB)),
          useMaterial3: true,
        ),
        home: const Home(),
      ),
    );
  }
}
