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
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

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
                  suffixIcon: _errorMessageUser != ""
                      ? const Icon(
                          Icons.error,
                        )
                      : null,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(5),
            ),
            SizedBox(
              width: 300,
              child: TextFormField(
                controller: passwordController,
                obscureText: _obscureText,
                decoration: InputDecoration(
                  labelText: 'Password',
                  errorText: _errorMessagePassword == ""
                      ? null
                      : _errorMessagePassword,
                  border: const OutlineInputBorder(),
                  suffixIcon: _errorMessagePassword != ""
                      ? const Icon(
                          Icons.error,
                        )
                      : InkWell(
                    onTap: _toggle,
                    child: Icon(
                      _obscureText
                          ? Icons.visibility_off
                          : Icons.visibility,
                      size: 15.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
            ),
            ElevatedButton(
              child: const Text('Login'),
              onPressed: () {
                if (userIdController.text.isEmpty) {
                  setState(() {
                    _errorMessageUser = 'User ID cannot be empty';
                  });
                  return;
                } else if (passwordController.text.isEmpty) {
                  setState(() {
                    _errorMessagePassword = 'Password cannot be empty';
                  });
                  return;
                }
                // replace navigation to home page
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
            ),
            const Spacer(),
            const Text("a Leading and Outstanding University",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const Padding(
              padding: EdgeInsets.all(10),
            ),
          ],
        ),
      ),
    );
  }
}
