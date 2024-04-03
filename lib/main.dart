import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:new_ambulance/constants.dart";
import "package:new_ambulance/pages/auth_screens/sign_in_page.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primaryColor: deepBlue,
        fontFamily: 'Poppins',
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: SignInScreen(),
    );
  }
}
