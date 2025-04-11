import 'package:bca_student_app/pages/screens/sign_in.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _usernameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 100),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  "Create Account",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.green[400],
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              const SizedBox(height: 35),

              // Username Field
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  controller: _usernameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person_2_rounded, color: Colors.yellow[300]),
                    hintText: "Username",
                    hintStyle: const TextStyle(color: Colors.black),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),

              // Email Field
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  controller: _emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined, color: Colors.yellow[300]),
                    hintText: "Email",
                    hintStyle: const TextStyle(color: Colors.black),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),

              // Password Field
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    } else if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_open_outlined, color: Colors.yellow[300]),
                    hintText: "Password",
                    hintStyle: const TextStyle(color: Colors.black),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Register Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Register account",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          // TODO: Save the data or navigate to next screen
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Account Registered Successfully')),
                          );
                          // For now, let’s navigate to the Signin page after successful registration
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Signin()));
                        }
                      },
                      child: ClipOval(
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(color: Colors.blue[300]),
                          child: const Icon(Icons.arrow_forward_ios_outlined),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Already have account
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: Row(
                  children: [
                    const Text(
                      "Already have an account ",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Signin()));
                      },
                      child: const Text(
                        "Signin",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
