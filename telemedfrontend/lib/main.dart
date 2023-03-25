import 'package:flutter/material.dart';
import 'package:telemedfrontend/doctor_dashboard.dart';
import 'package:telemedfrontend/doctor_signup.dart';
import 'package:telemedfrontend/home_screen.dart';
import 'package:telemedfrontend/login_page.dart';
import 'package:telemedfrontend/patient_dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomeScreen(),
        '/login': (context) => LoginPage(
              showRegisterPage: () {},
            ),
        '/signup': (context) => DoctorSignup(),
        '/doctor_dashboard': (context) => DoctorDashboard(),
        '/patient_dashboard': (context) => PatientDashboard(),
      },
    );
  }
}
