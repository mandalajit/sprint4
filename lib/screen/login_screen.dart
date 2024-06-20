import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe/screen/dashboard_screen.dart';
import 'package:recipe/screen/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? email;
  String? password;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEFAE0),
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Image.asset('assets/images/logo.png'),
        ),
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'food',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              TextSpan(
                text: 'recipe',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.orange,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Color(0xFFFEFAE0),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Welcome Back",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 40,
              color: Color(0xFF946E54),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "Login to continue",
            style: TextStyle(
              fontSize: 22,
              color: Color(0xFF946E54),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    onChanged: (value) {
                      email = value;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      suffixIcon: Icon(
                        Icons.email,
                        size: 25,
                        color: Colors.black.withOpacity(0.7),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xFF946E54),
                          width: 1.5,
                          style: BorderStyle.solid,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(3)),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    obscureText: true,
                    obscuringCharacter: '*',
                    onChanged: (value) {
                      password = value;
                    },
                    decoration: InputDecoration(
                      labelText: 'Password',
                      suffixIcon: Icon(
                        Icons.vpn_key_rounded,
                        size: 25,
                        color: Colors.black.withOpacity(0.7),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xFF946E54),
                          width: 1.5,
                          style: BorderStyle.solid,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(3)),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 50,
                    width: 100,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if (email == "Admin" && password == "Admin") {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => DashBoardScreen()),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Invalid email or password'),
                              ),
                            );
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFD9A26C),
                      ),
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Color(0xFFFEFAE0), fontSize: 20),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(fontSize: 18),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => RegisterScreen()),
                          );
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Color(0xFFD9A26C),
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
