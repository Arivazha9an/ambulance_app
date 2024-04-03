import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:new_ambulance/constants.dart';
import 'package:new_ambulance/controllers/auth_controller.dart';
import 'package:new_ambulance/pages/auth_screens/otp_verify_screen.dart';
import 'package:new_ambulance/pages/widgets/custom_button.dart';
import 'package:new_ambulance/pages/widgets/custom_text_form.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final AuthController _authController = Get.put(AuthController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/signInBg.png",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: Colors.white.withOpacity(0.9),
          ),
          signInWidget(context),
        ],
      ),
    );
  }

  Widget signInWidget(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Sign in",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
              color: lightBlack,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Form(
            key: _formKey,
            child: CustomTextFormField(
              width: 300,
              controller: _authController.phoneController,
              hintText: "Enter Your Mobile Number",
              keyboardType: TextInputType.number,
              maxLength: 10,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Obx(() {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  value: _authController.checkBoxValue.value,
                  onChanged: (value) {
                    _authController.checkBoxValue.value = value!;
                  },
                  activeColor: deepBlue,
                  checkColor: white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 100,
                  child: const Text(
                    "By signing in you accept to our terms & conditions",
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 11,
                    ),
                  ),
                )
              ],
            );
          }),
          const SizedBox(
            height: 20,
          ),
          CustomTextButton(
            width: 300,
            title: "GET OTP",
            background: deepBlue,
            textColor: white,
            fontSize: 18,
            onTap: () {
              if (_formKey.currentState!.validate() &&
                  _authController.checkBoxValue.value) {
                Get.snackbar(
                    "OTP Sent to ${_authController.phoneController.text}",
                    "Enter otp and get verified");
                Get.to(() => OtpVerificationScreen());
              }
              if (_authController.checkBoxValue.value == false) {
                Get.snackbar("Error", "Agree to our Terms and Conditions");
                return;
              }
            },
          ),
        ],
      ),
    );
  }
}
