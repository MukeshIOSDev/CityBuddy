import 'package:flutter/material.dart';

void main() {
  runApp(const ContractorPlusApp());
}

class ContractorPlusApp extends StatelessWidget {
  const ContractorPlusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contractor+ Login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFECF0F1),
        primaryColor: const Color(0xFF2ECC71),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2ECC71)),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Color(0xFF34495E)),
        ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: const TextStyle(color: Color(0xFF2ECC71)),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFF2ECC71)),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 80,
              color: const Color(0xFF2C3E50),
              child: const Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Need Help',
                        style: TextStyle(color: Color(0xFFECF0F1)),
                      ),
                      SizedBox(width: 4),
                      Icon(Icons.info_outline, color: Color(0xFFECF0F1)),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              "Welcome Back!",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF34495E),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Streamline your business journey with\nContractor+",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Color(0xFF34495E)),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: TextField(
                decoration: const InputDecoration(
                  labelText: 'Enter Your Email Or Phone Number',
                ),
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  text:
                      "We’ll send you a verification code for password-free sign in. Or you can ",
                  style: TextStyle(color: Color(0xFF34495E), fontSize: 13),
                  children: [
                    TextSpan(
                      text: "login with password",
                      style: TextStyle(
                        color: Color(0xFF3498DB),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: " instead."),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Don’t Have An Account?",
              style: TextStyle(fontSize: 14, color: Color(0xFF34495E)),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                "Create",
                style: TextStyle(
                  color: Color(0xFF2C3E50),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Color(0xFF34495E),
                      side: const BorderSide(color: Color(0xFFBDC3C7)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      minimumSize: const Size(double.infinity, 48),
                    ),
                    icon: Image.network(
                      'https://upload.wikimedia.org/wikipedia/commons/5/53/Google_%22G%22_Logo.svg',
                      height: 20,
                    ),
                    label: const Text("Sign in with Google"),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Color(0xFF34495E),
                      side: const BorderSide(color: Color(0xFFBDC3C7)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      minimumSize: const Size(double.infinity, 48),
                    ),
                    icon: const Icon(Icons.apple, size: 20),
                    label: const Text("Sign in with Apple"),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2C3E50),
                  minimumSize: const Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Login",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}