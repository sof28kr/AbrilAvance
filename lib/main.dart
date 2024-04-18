import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sqflite_note_app_tutorial/screens/IngresoFirma.dart';
import 'package:sqflite_note_app_tutorial/screens/add_task_screen.dart';
import 'package:sqflite_note_app_tutorial/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: GoRouter(initialLocation: '/Inicio', routes: [
        GoRoute(
          path: '/Lista_Participantes',
          builder: (context, state) => AddTaskScreen(),
        ),
        GoRoute(
          path: '/Inicio',
          builder: (context, state) => HomeScreen(),
        ),
        GoRoute(
          path: '/IngresoFirma',
          builder: (context, state) => IngresoFirma(),
        )
      ]),
    );
  }
}
