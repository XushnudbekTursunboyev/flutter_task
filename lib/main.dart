import 'package:flutter/material.dart';
import 'package:flutter_task/data/source/local/hive/hive_helper.dart';
import 'package:flutter_task/presenter/pages/history_page/history_page.dart';
import 'package:flutter_task/presenter/pages/main/main_page.dart';

import 'di/di.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  HiveHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Task',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MainPage(),
        'history': (context) => const HistoryPage(),
      },
    );
  }
}
