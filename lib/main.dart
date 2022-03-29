import 'package:flutter/material.dart';
import 'package:upi_dalam_data/homepage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Login page';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final userIdController = TextEditingController();
  final passwordController = TextEditingController();
  dynamic userID;
  dynamic password;

  String _errorMessageUser = '';
  String _errorMessagePassword = '';

  @override
  void dispose() {
    userIdController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Image.asset(
              "images/logo-upi.png",
              height: 200,
              width: 200,
            ),
            const Padding(
              padding: EdgeInsets.all(20),
            ),
            const Text('Single Sign-on',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
            const Padding(
              padding: EdgeInsets.all(10),
            ),
            SizedBox(
              width: 300,
              child: TextFormField(
                controller: userIdController,
                decoration: InputDecoration(
                  labelText: 'NIM / NIP / NIDN',
                  errorText: _errorMessageUser == "" ? null : _errorMessageUser,
                  border: const OutlineInputBorder(),
                  suffixIcon: _errorMessageUser != "" ? const Icon(
                    Icons.error,
                  ) : null,
                ),
              ),
            ),
            ElevatedButton(
              child: const Text('Login'),
              onPressed: () {
                if (userIdController.text.isEmpty) {
                  setState(() {
                    _errorMessageUser = 'User ID cannot be empty';
                  });
                  return;
                } else {
                  setState(() {
                    _errorMessageUser = '';
                  });
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
