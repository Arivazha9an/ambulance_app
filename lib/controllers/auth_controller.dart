import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final TextEditingController phoneController = TextEditingController();

  Rx<bool> checkBoxValue = false.obs;
  String otpValue = "";
}
