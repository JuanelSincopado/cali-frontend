import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/tramite_provider.dart';
import 'screen/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TramiteProvider.init()),
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
