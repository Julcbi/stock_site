import 'package:flutter/material.dart';
import 'package:stock_site/pages/home_page.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  bool _showPassword = false;
  bool _rememberMe = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _handleSignIn() {
    final email = _emailController.text.trim();
    final password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      // Mostra alerta se campos estiverem vazios
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Incomplete fields'),
          content: const Text('Please fill in both email and password to continue.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            )
          ],
        ),
      );
      return;
    }

    // Tudo preenchido, pode navegar
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.8,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Campo Email
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: const Icon(Icons.email_outlined),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            const SizedBox(height: 16),

            // Campo Senha
            TextField(
              controller: _passwordController,
              obscureText: !_showPassword,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: const Icon(Icons.lock_outline),
                suffixIcon: IconButton(
                  icon: Icon(_showPassword ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _showPassword = !_showPassword;
                    });
                  },
                ),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            const SizedBox(height: 10),

            // Lembrar + Esqueci senha
            Row(
              children: [
                Checkbox(
                  value: _rememberMe,
                  onChanged: (value) {
                    setState(() {
                      _rememberMe = value ?? false;
                    });
                  },
                ),
                const Text("Remember me"),
                const Spacer(),
                TextButton(
                  onPressed: null, // Desativado
                  child: const Text(
                    'Forgot password?',
                    style: TextStyle(color: Color(0xFF6A11CB)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Botão Sign In
            SizedBox(
              width: double.infinity,
              height: 45,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextButton(
                  onPressed: _handleSignIn,
                  child: const Text('Sign In', style: TextStyle(color: Colors.white)),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Divisor
            Row(
              children: const [
                Expanded(child: Divider()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text("OR CONTINUE WITH"),
                ),
                Expanded(child: Divider()),
              ],
            ),

            const SizedBox(height: 20),

            // Botões Google e Facebook
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.g_mobiledata),
                  label: const Text("Google"),
                ),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.facebook),
                  label: const Text("Facebook"),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Termos e política
            Text.rich(
              TextSpan(
                text: "By signing in, you agree to our ",
                children: [
                  TextSpan(
                    text: "Terms of Service",
                    style: TextStyle(color: Color(0xFF6A11CB)),
                  ),
                  const TextSpan(text: " and "),
                  TextSpan(
                    text: "Privacy Policy",
                    style: TextStyle(color: Color(0xFF6A11CB)),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
