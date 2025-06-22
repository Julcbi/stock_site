import 'package:flutter/material.dart';
import 'sign_in_form.dart';
import 'sign_up_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isSignIn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xFFF9F9FC),
      body: SafeArea(
       child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 40),

                // LOGO + Nome
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(Icons.trending_up, color: Colors.white),
                    ),
                    const SizedBox(width: 10),
                    const GradientText(
                      'Invisto',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      gradient: LinearGradient(
                        colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),
                const Text('Welcome back', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                const Text('Sign in to your account or create a new one',
                    style: TextStyle(fontSize: 14, color: Colors.grey)),
                const SizedBox(height: 40),

                // CONTAINER BRANCO COM BOTÕES E CONTEÚDO
                Container(
                  width: 400,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // ABAS: SIGN IN / SIGN UP
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () => setState(() => isSignIn = true),
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                decoration: BoxDecoration(
                                  color: isSignIn ? Colors.white : const Color(0xFFF0F0F0),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                  ),
                                  border: Border(
                                    bottom: BorderSide(
                                      color: isSignIn ? const Color(0xFF6A11CB) : Colors.transparent,
                                      width: 2,
                                    ),
                                  ),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Sign In',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => setState(() => isSignIn = false),
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                decoration: BoxDecoration(
                                  color: isSignIn ? const Color(0xFFF0F0F0) : Colors.white,
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(12),
                                  ),
                                  border: Border(
                                    bottom: BorderSide(
                                      color: !isSignIn ? const Color(0xFF6A11CB) : Colors.transparent,
                                      width: 2,
                                    ),
                                  ),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const Divider(height: 1),
                      const SizedBox(height: 10),

                      // Conteúdo: SignInForm ou SignUpForm
                      isSignIn ? const SignInForm() : const SignUpForm(),

                    ],
                  ),
                ),
              ],
            )
          ),
      )
      ),
    );
  }
}


class GradientText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Gradient gradient;

  const GradientText(this.text, {super.key, required this.style, required this.gradient});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style.copyWith(color: Colors.white)),
    );
  }
}
