import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:insta_ui/functions/authfunctions.dart';

class Authentication extends StatefulWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  final _formKey = GlobalKey<FormState>();
  bool isLogin = false;
  String email = '';
  String password = '';
  String username = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.black,
      body: Form(
        key: _formKey,
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Instagram logo text

                // Username field (only in signup)
                if (!isLogin)
                  TextFormField(
                    key: const ValueKey('username'),
                    decoration: _textInputDecoration("Username"),
                    style: const TextStyle(color: Colors.white),
                    validator: (value) =>
                        value!.length < 3 ? 'Username too short' : null,
                    onSaved: (value) => username = value!,
                  ),

                const SizedBox(height: 16),

                // Email
                TextFormField(
                  key: const ValueKey('email'),
                  decoration: _textInputDecoration("Email"),
                  style: const TextStyle(color: Colors.white),
                  validator: (value) =>
                      !(value!.contains('@')) ? 'Invalid Email' : null,
                  onSaved: (value) => email = value!,
                ),

                const SizedBox(height: 16),

                // Password
                TextFormField(
                  obscureText: true,
                  key: const ValueKey('password'),
                  decoration: _textInputDecoration("Password"),
                  style: const TextStyle(color: Colors.white),
                  validator: (value) =>
                      value!.length < 6 ? 'Password too short' : null,
                  onSaved: (value) => password = value!,
                ),

                const SizedBox(height: 24),

                // Submit button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        isLogin
                            ? signin(email, password)
                            : signup(email, password);
                      }
                    },
                    child: Text(
                      isLogin ? 'Log In' : 'Sign Up',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Divider
                Row(
                  children: const [
                    Expanded(child: Divider(color: Colors.white24)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child:
                          Text("OR", style: TextStyle(color: Colors.white70)),
                    ),
                    Expanded(child: Divider(color: Colors.white24)),
                  ],
                ),

                const SizedBox(height: 20),

                // Google Sign-In (fixed overflow)
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      backgroundColor: Colors.white10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      // TODO: Implement actual Google Sign-In
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          'https://static.dezeen.com/uploads/2025/05/sq-google-g-logo-update_dezeen_2364_col_0.jpg',
                          height: 24,
                          width: 24,
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          'Continue with Google',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Toggle Login <-> Signup
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isLogin = !isLogin;
                    });
                  },
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(color: Colors.white70),
                      children: [
                        TextSpan(
                            text: isLogin
                                ? "Don't have an account? "
                                : "Already have an account? "),
                        TextSpan(
                          text: isLogin ? "Sign up" : "Log in",
                          style: const TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Custom input decoration
  InputDecoration _textInputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: Colors.white54),
      contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      filled: true,
      fillColor: Colors.white12,
    );
  }
}
