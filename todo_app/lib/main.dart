import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/pages/global_variables.dart';
import 'package:todo_app/splash_screen_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor:  Color.fromARGB(255, 238, 199, 37), systemNavigationBarColor: Color.fromARGB(255, 238, 199, 37)),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Items(),
      child: MaterialApp(
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: const Color.fromARGB(255, 238, 199, 37),
            foregroundColor: Colors.black,
            centerTitle: true,
            elevation: 0.5,
            titleTextStyle: GoogleFonts.actor(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 238, 199, 37),
          ),
          primaryColor: const Color.fromARGB(255, 238, 199, 37),
          scaffoldBackgroundColor: Colors.black87,
          iconTheme: const IconThemeData(color: Colors.white, size: 50),
          textTheme: const TextTheme(
            titleLarge: TextStyle(fontSize: 40, color: Colors.black),
            bodyMedium: TextStyle(fontSize: 26, color: Colors.black),
            bodySmall: TextStyle(fontSize: 15, color: Colors.black),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: const SplashScreenPage(),
      ),
    );
  }
}
