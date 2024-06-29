import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe/features/auth/presentation/viewmodel/auth_view_model.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEFAE0),
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Image.asset('assets/images/logo.png'),
        ),
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
              text: 'Recipe',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                ),
              ),
              TextSpan(
                text: 'food',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: const Color(0xFFFEFAE0),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Already have an Account?",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 30,
                  color: Color(0xFF000000),
                  fontWeight: FontWeight.bold,
                ),
              ),
              // const SizedBox(height:5),
              // const Text(
              //   "Login to continue",
              //   style: TextStyle(
              //     fontSize: 22,
              //     color: Color(0xFF000000),
              //   ),
              // ),
              const SizedBox(height: 30),
              _buildLoginForm(),
              const SizedBox(height: 20),
              _buildRegisterRow(),
            ],
          ),
        ),
      ),
    );
  }

  Form _buildLoginForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _buildEmailField(),
          const SizedBox(height: 30),
          _buildPasswordField(),
          const SizedBox(height: 30),
          _buildLoginButton(),
        ],
      ),
    );
  }

  TextFormField _buildEmailField() {
    return TextFormField(
      key: const ValueKey('email'),
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email',
        suffixIcon: Icon(
          Icons.email,
          size: 25,
          color: Colors.black.withOpacity(0.7),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF000000),
            width: 1.5,
          ),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(3)),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter email';
        }
        return null;
      },
    );
  }

  TextFormField _buildPasswordField() {
    return TextFormField(
      key: const ValueKey('password'),
      controller: _passwordController,
      obscureText: true,
      obscuringCharacter: '*',
      decoration: InputDecoration(
        labelText: 'Password',
        suffixIcon: Icon(
          Icons.vpn_key_rounded,
          size: 25,
          color: Colors.black.withOpacity(0.7),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF000000),
            width: 1.5,
          ),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(3)),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter password';
        }
        return null;
      },
    );
  }

  SizedBox _buildLoginButton() {
    return SizedBox(
      height: 50,
      width: 100,
      child: ElevatedButton(
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            await ref
                .read(authViewModelProvider.notifier)
                .loginUser(_emailController.text, _passwordController.text);
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFF0000),
        ),
        child: const Text(
          "Login",
          style: TextStyle(
            color: Color(0xFF000000),
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  Row _buildRegisterRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have an account?",
          style: TextStyle(fontSize: 18),
        ),
        ElevatedButton(
          key: const ValueKey('registerButton'),
          onPressed: () {
            ref.read(authViewModelProvider.notifier).openRegisterView();
          },
          child: const SizedBox(
            height: 50,
            child: Center(
              child: Text(
                'Register',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Brand Bold',
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}