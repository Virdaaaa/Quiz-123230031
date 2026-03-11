import 'package:flutter/material.dart';
import 'package:belajar_kuisTPM/screen/movie_list_page.dart'; // habis dari login langsung ke movie list page, jadi harus import movie list page juga yaa

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _userController = TextEditingController();
  final _passController = TextEditingController();

  void _login() {
    // Mengecek apakah username adalah "virda" DAN password adalah "031"
    if (_userController.text == "virda" && _passController.text == "031") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              MovieListPage(username: (_userController.text).toString()),
        ),
      );
    } else {
      // Jika salah satu atau keduanya salah
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Username atau Password salah!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Login",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const Text("Welcome back to Minilenst"),
            const SizedBox(height: 30),
            TextField(
              controller: _userController,
              decoration: const InputDecoration(labelText: "Username"),
            ),
            TextField(
              controller: _passController,
              decoration: const InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _login,
                child: const Text("Login"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
