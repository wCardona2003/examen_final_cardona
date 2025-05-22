import 'package:examen_final_cardona/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/login_screen.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    final user = prefs.getString('username');
    final pass = prefs.getString('password');
    return user != null && pass != null;
  }

  Future<List<String?>> getUserData() async {
    final prefs = await SharedPreferences.getInstance(); 
    final user = prefs.getString('username');
    final pass = prefs.getString('password');
    if(user != null && pass != null){
      return [user,pass];
    } else {
      return ["",""]; 
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: FutureBuilder<bool>(
        future: isLoggedIn(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            print(isLoggedIn());
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          return snapshot.data == true ? LoginScreen(userData: getUserData()) : LoginScreen(userData: getUserData());
        },
      ),
    );
  }
}
