import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final userController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> login() async {
    final user = userController.text.trim();
    final pass = passwordController.text.trim();

    if (user.isEmpty || pass.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Por favor, rellena todos los campos")),
      );
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', user);
    await prefs.setString('password', pass);

    Navigator.pushReplacement(
      // ignore: use_build_context_synchronously
      context,
      MaterialPageRoute(builder: (_) => HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Iniciar Sesión"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child:Column(
          children: [
            TextField(
              controller: userController,
              decoration: InputDecoration(
                labelText: "Usuario"
              ),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: "Contraseña"
              ),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: login,
              child: Text('Login'),
            ),
          ],
        )
        ),
    );
  }
}
