import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:roberto/features/Auth/screen/reset_screen.dart';
import '../../../app/app_color.dart';
import '../../../common/custom_button.dart';
import '../widget/custom_screen.dart';
import '../widget/custom_textfield.dart';


class VerifyScreen extends StatefulWidget {
  const VerifyScreen({super.key});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  bool _rememberMe = false;


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
                "Check Your Email",
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
                "We sent a code to your email address",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 20),

            PinCodeTextField(
                length: 6,
                obscureText: false,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                keyboardType: TextInputType.number,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(8),
                    fieldHeight: 50,
                    fieldWidth: 40,
                    activeColor: AppColor.primary,
                    selectedColor: AppColor.primary,
                    inactiveColor: AppColor.secondary),
                animationDuration: const Duration(milliseconds: 300),
                // controller: OTPController,
                appContext: context,),

            const SizedBox(height: 25),
            CustomButton(
              text: "Verify",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) =>  ResetScreen()),
                );
              },
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {},
              child: RichText(
                text: const TextSpan(
                  text: "You have not received the email?  ",
                  style: TextStyle(
                    fontSize: 13,
                    color: AppColor.black,
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    TextSpan(
                      text: "Resend",
                      style: TextStyle(
                        color: AppColor.primary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}