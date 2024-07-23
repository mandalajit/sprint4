import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe/features/auth/presentation/viewmodel/auth_view_model.dart';

import '../../domain/entity/auth_entity.dart';

class RegisterView extends ConsumerStatefulWidget {
  const RegisterView({super.key});

  @override
  ConsumerState<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends ConsumerState<RegisterView> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

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
          text: const TextSpan(
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
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Here's your first step with us!",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 30,
                  color: Color(0xFF000000),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              _buildRegisterForm(),
              const SizedBox(height: 20),
              const Text(
                "Or Sign up with Google",
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 12),
              Image.asset(
                'assets/images/google_logo.png',
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Form _buildRegisterForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _buildTextField(
            controller: _fullNameController,
            label: 'Full Name',
            icon: Icons.person,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter full name";
              }
              return null;
            },
          ),
          const SizedBox(height: 40),
          _buildTextField(
            controller: _emailController,
            label: 'Email',
            icon: Icons.email,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter email";
              }
              return null;
            },
          ),
          const SizedBox(height: 40),
          _buildTextField(
            controller: _phoneController,
            label: 'Phone Number',
            icon: Icons.phone,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter phone number";
              }
              return null;
            },
          ),
          const SizedBox(height: 40),
          _buildTextField(
            controller: _passwordController,
            label: 'Password',
            icon: Icons.vpn_key,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter password";
              }
              return null;
            },
          ),
          const SizedBox(height: 40),
          SizedBox(
            height: 40,
            width: 130,
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  var user = AuthEntity(
                    fullname: _fullNameController.text,
                    email: _emailController.text,
                    phonenumber: _phoneController.text,
                    password: _passwordController.text,
                  );
                  ref.read(authViewModelProvider.notifier).registerUser(user);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF0000),
              ),
              child: const Text(
                "Sign in",
                style: TextStyle(
                  color: Color(0xFF000000),
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextFormField _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    required String? Function(String?) validator,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: Icon(
          icon,
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
      validator: validator,
    );
  }
}
