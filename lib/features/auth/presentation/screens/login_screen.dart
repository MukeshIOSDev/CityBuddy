import 'package:citybuddy/features/auth/presentation/screens/signup_screen.dart';
import 'package:flutter/material.dart';

// Entry point of the app
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contractor+ Login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.green,
        scaffoldBackgroundColor: AppColors.softWhite,
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
        ),
      ),
      home: const LoginPage(),
    );
  }
}

// Login page UI
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(), // Hide keyboard when tapping outside
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 30),

                // Welcome Text
                const Text(
                  "Welcome Back!",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.textDark),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Let’s get you connected in your city, with\nCityBuddy",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: AppColors.textDark),
                ),
                const SizedBox(height: 24),

                // Email or Phone Field
                // Modern Email TextField
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Enter your email or phone',
                    hintText: 'Enter your email or phone',
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: AppColors.lightGray),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: AppColors.lightGray),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: AppColors.green, width: 2),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Password Field
                // Modern Password TextField
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Enter your password',
                    hintText: 'Enter your password',
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: AppColors.lightGray),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: AppColors.lightGray),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: AppColors.green, width: 2),
                    ),
                  ),
                ),

                // Forgot Password Button
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      print("Forgot Password tapped");
                    },
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(color: AppColors.blue),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Create Account
                const Text("Don’t have an account?", style: TextStyle(color: AppColors.textDark)),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUpScreen()),
                    );
                  },
                  child: const Text(
                    "Create",
                    style: TextStyle(color: AppColors.darkBlue),
                  ),
                ),

                const SizedBox(height: 12),

                // Social Buttons
                // ElevatedButton.icon(
                //     onPressed: () {},
                //     style: ElevatedButton.styleFrom(
                //       backgroundColor: Colors.white,
                //       foregroundColor: Colors.black87,
                //       side: const BorderSide(color: Colors.black12),
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(30),
                //       ),
                //       minimumSize: const Size(double.infinity, 48),
                //     ),
                //    icon: Image.network(
                //       'https://upload.wikimedia.org/wikipedia/commons/5/53/Google_%22G%22_Logo.svg',
                //       height: 20,
                //     ),
                //     label: const Text("Sign in with Google"),
                //   ),

                const SizedBox(height: 12),

                ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black87,
                      side: const BorderSide(color: Colors.black12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      minimumSize: const Size(double.infinity, 48),
                    ),
                    icon: const Icon(Icons.apple, size: 20),
                    label: const Text("Sign in with Apple"),
                  ),

                const SizedBox(height: 24),

                // Login Button
                ElevatedButton(
                  onPressed: () {
                    print("Login button pressed");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.darkBlue,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text("Login", style: TextStyle(
                    fontWeight: FontWeight.w600
                  ),),
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Color constants
class AppColors {
  static const Color green = Color(0xFF2ECC71);        // Emerald Green
  static const Color darkBlue = Color(0xFF2C3E50);     // Midnight Blue
  static const Color softWhite = Color(0xFFECF0F1);    // Soft White
  static const Color lightGray = Color(0xFFBDC3C7);    // Light Gray
  static const Color blue = Color(0xFF3498DB);         // Light Blue
  static const Color textDark = Color(0xFF34495E);     // Text Color
}