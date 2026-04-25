import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/quiz_screen.dart';
import 'screens/progress_screen.dart';
import 'screens/teacher_dashboard.dart';

class LearnAndConnectApp extends StatelessWidget {
  @override 
  Widget build(BuildContext context) => MaterialApp(
    title: 'Learn & Connect – Lekazi', 
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Color(0xFF0D47A1), 
      appBarTheme: AppBarTheme(
        backgroundColor: Color(0xFF0D47A1), 
        foregroundColor: Colors.white
      )
    ),
    home: LoginScreen(),
    routes: {
      '/home': (_) => HomeScreen(), 
      '/quiz': (_) => QuizScreen(), 
      '/teacher': (_) => TeacherDashboard(), 
      '/progress': (_) => ProgressScreen()
    },
  );
}
