import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_ambulance/constants.dart';
import 'package:new_ambulance/controllers/auth_controller.dart';
import 'package:new_ambulance/pages/home_page.dart';
import 'package:new_ambulance/pages/widgets/custom_app_bar.dart';
import 'package:new_ambulance/pages/widgets/custom_button.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final AuthController _authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Verify code",
        isGoBack: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(child: Image.asset("assets/verifyOtp.png")),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 250,
                child: Text(
                  "A code has been sent to +91 ${_authController.phoneController.text} via SMS",
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: const TextStyle(
                    color: grey2,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  textFieldOtp(true, false),
                  const SizedBox(width: 10),
                  textFieldOtp(false, false),
                  const SizedBox(width: 10),
                  textFieldOtp(false, false),
                  const SizedBox(width: 10),
                  textFieldOtp(false, true),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextButton(
                width: 300,
                title: "Verify OTP",
                background: deepBlue,
                textColor: white,
                fontSize: 18,
                onTap: () {
                  if (_authController.otpValue.length == 4) {
                    Get.offAll(() => const Home());
                  } else {
                    Get.snackbar(
                        "Invalid OTP", "Please review your otp and try again");
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    shape: const RoundedRectangleBorder(),
                  ),
                  child: const Text(
                    "Resend code (1 : 23)",
                    style: TextStyle(
                      color: deepBlue,
                      decoration: TextDecoration.underline,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget textFieldOtp(bool first, bool last) {
    return Container(
      height: 60,
      child: AspectRatio(
        aspectRatio: 0.8,
        child: TextField(
          autofocus: true,
          cursorColor: deepBlue,
          onChanged: (value) {
            if (value.length == 1) {
              _authController.otpValue += value;
            } else {
              _authController.otpValue = _authController.otpValue
                  .substring(0, _authController.otpValue.length - 1);
            }
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.length == 0 && first == false) {
              FocusScope.of(context).previousFocus();
            }
            print(_authController.otpValue);
          },
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: const InputDecoration(
            counter: Offstage(),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(width: 2, color: deepBlue),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(width: 2, color: deepBlue),
            ),
          ),
        ),
      ),
    );
  }
}
