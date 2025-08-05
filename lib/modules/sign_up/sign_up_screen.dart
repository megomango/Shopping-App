import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    void submitForm() {
      if (_formKey.currentState!.validate()) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(loc!.dialog1),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close dialog
                  Navigator.pushReplacementNamed(context, '/home'); // Go to home
                },
                child: Text(loc.close),
              ),
            ],
          ),
        );
      }
    }
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Container(
            width: 350,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                         Text(
                          loc!.createAcc,
                          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.purple),
                        ),
                        const SizedBox(height: 8),
                         Text(
                          loc.description1,
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(loc.name, style: TextStyle(color: Colors.black),),
                  const SizedBox(height: 5),
                  TextFormField(
                    controller: nameController,
                    decoration:  InputDecoration(labelText: loc.nameLabel,labelStyle: TextStyle(fontSize: 13,), border: OutlineInputBorder()),
                    validator: (value) {
                      if (value == null || value.isEmpty) return "Please Enter Your Full Name";
                      if (value[0] != value[0].toUpperCase()) return "First letter must be uppercase";
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  Text(loc.email, style: TextStyle(color: Colors.black),),
                  const SizedBox(height: 5),
                  TextFormField(
                    controller: emailController,
                    decoration:  InputDecoration(labelText: loc.emailLabel,labelStyle: TextStyle(fontSize: 13,), border: OutlineInputBorder()),
                    validator: (value) {
                      if (value == null || value.isEmpty) return "Please Enter Your Email";
                      if (!value.contains("@")) return "Please Email Must Have @";
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  Text(loc.password, style: TextStyle(color: Colors.black),),
                  const SizedBox(height: 5),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration:  InputDecoration(labelText: loc.passLabel,labelStyle: TextStyle(fontSize: 13,), border: OutlineInputBorder()),
                    validator: (value) {
                      if (value == null || value.length < 6) return "Password must be at least 6 characters";
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  Text(loc.confirmPass, style: TextStyle(color: Colors.black),),
                  const SizedBox(height: 5),
                  TextFormField(
                    controller: confirmPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(labelText: loc.confirmLabel,labelStyle: TextStyle(fontSize: 13,), border: OutlineInputBorder()),
                    validator: (value) {
                      if (value != passwordController.text) return "Passwords do not match";
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: ElevatedButton(
                      onPressed: submitForm,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 50),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      child: Text(
                        loc.createAcc,
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
