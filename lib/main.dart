import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sqflite_note_app_tutorial/screens/IngresoFirma.dart';
import 'package:sqflite_note_app_tutorial/screens/add_task_screen.dart';
import 'package:sqflite_note_app_tutorial/screens/home_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://oicgtegeayqbqvzoousx.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9pY2d0ZWdlYXlxYnF2em9vdXN4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTM4MTUyNTYsImV4cCI6MjAyOTM5MTI1Nn0.fyhjKUZqSBNuVWZNg5aXQUtH07I6iG-PWQKQrEiphPM',
  );

  runApp(MyApp());
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
