import 'package:flutter/material.dart';
import 'package:navigation_route_parsing/main_layout.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Login',
      showAppBar: false,
      child: Container(
        color: MainLayout.backgroundColor,
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 32.0,
                vertical: 24.0,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset(
                      'assets/images/login.png',
                      height: 200,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 200,
                          decoration: BoxDecoration(
                            color: MainLayout.primaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.image_not_supported_outlined,
                              size: 80,
                              color: MainLayout.primaryColor,
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 40),

                    const Text(
                      'Welcome Back!',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w800,
                        color: MainLayout.textTitleColor,
                        letterSpacing: -0.5
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Sign in to your account to continue',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16,
                        color: MainLayout.textSubtitleColor,
                      ),
                    ),
                    const SizedBox(height: 48),

                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelText: 'Email Address',
                        labelStyle: const TextStyle(
                          color: MainLayout.labelColor,
                        ),
                        prefixIcon: const Icon(Icons.email_outlined, 
                          color: MainLayout.primaryColor),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            color: MainLayout.inputBorderColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            color: MainLayout.primaryColor,
                            width: 2,
                          ),
                        ),
                        filled: true,
                        fillColor: MainLayout.inputFillColor,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email address';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),

                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: const TextStyle(
                          color: MainLayout.labelColor,
                        ),
                        prefixIcon: const Icon(Icons.lock_outline, 
                          color: MainLayout.primaryColor),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            color: MainLayout.inputBorderColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            color: MainLayout.primaryColor,
                            width: 2,
                          ),
                        ),
                        filled: true,
                        fillColor: MainLayout.inputFillColor,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),

                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) =>
                              const HomePage()
                            )
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        backgroundColor: MainLayout.primaryColor,
                        foregroundColor: Colors.white,
                        elevation: 0,
                      ),
                      child: const Text(
                        'Log In',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.0,
                        )
                      ),
                    ),
                    const SizedBox(height: 24),

                    
                  ],
                ),
              ),
            ),
          ),
        ),
      )
    );
  }
}