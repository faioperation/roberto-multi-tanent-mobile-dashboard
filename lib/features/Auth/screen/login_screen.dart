import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:roberto/features/Auth/screen/forgot_screen.dart';
import 'package:roberto/common/dashboard_layout.dart';
import '../../../app/app_color.dart';
import '../../../common/custom_button.dart';
import '../widget/custom_screen.dart';
import '../widget/custom_textfield.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondary,
      body: CustomScreen(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
                child: SvgPicture.asset(
                  'assets/logo.svg',
                  height: 80,
                ),
            ),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                "Dashboard Login",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: AppColor.black,
                ),
              ),
            ),
            const SizedBox(height: 5),
            const Center(
              child: Text(
                "Secure access to farm management platform",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 20),

            Align(
              alignment: Alignment.centerLeft,
              child: const Text(
                "Email Address",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 8),
            CustomTextfield(
              hintText: "owner@platform.com",
              controller: _emailController,
            ),

            const SizedBox(height: 20),

            Align(
              alignment: Alignment.centerLeft,
              child: const Text(
                "Password",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 8),

            CustomTextfield(
              hintText: "*********",
              isPassword: true,
              controller: _passwordController,
            ),

            const SizedBox(height: 15),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ForgotScreen()),
                );
              },
              child: Align(
                alignment: Alignment.centerRight,
                child: const Text(
                  "Forgot Password?",
                  style: TextStyle(
                    fontSize: 13,
                    color: AppColor.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
            CustomButton(
              text: "Login",
              onTap: () {
                String email = _emailController.text.trim();
                String password = _passwordController.text.trim();

                bool isBusinessOwner = email == "sadia@gmail.com" && password == "11";
                bool isSystemOwner = email == "salman@gmail.com" && password == "11";

                if (isBusinessOwner || isSystemOwner) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => DashboardShell(isSystemOwner: isSystemOwner)),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Invalid email or password"),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
            ),


            const SizedBox(height: 20),

          ],
        ),
      ),
    );
  }
}