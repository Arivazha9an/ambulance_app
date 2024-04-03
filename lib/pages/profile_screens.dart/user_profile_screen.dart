import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_ambulance/constants.dart';
import 'package:new_ambulance/controllers/user_profile_controller.dart';
import 'package:new_ambulance/pages/widgets/custom_button.dart';
import 'package:new_ambulance/pages/widgets/custom_text_form.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final UserProfileController _userController =
      Get.put(UserProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20).copyWith(top: 40),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  "assets/profile.png",
                  width: 50,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Form(
                child: Column(
                  children: [
                    CustomTextFormField(
                      controller: _userController.nameController,
                      hintText: "Name",
                      keyboardType: TextInputType.name,
                    ),
                    const SizedBox(height: 10),
                    CustomTextFormField(
                      controller: _userController.dobController,
                      hintText: "DOB",
                      keyboardType: TextInputType.datetime,
                      readOnly: true,
                      ontap: () {
                        _showDate();
                      },
                    ),
                    const SizedBox(height: 10),
                    CustomTextFormField(
                      controller: _userController.ageController,
                      hintText: "Age",
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 10),
                    CustomTextFormField(
                      controller: _userController.phnController,
                      hintText: "Alternate Number",
                      maxLength: 10,
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 10),
                    CustomTextFormField(
                      controller: _userController.homeAddController,
                      hintText: "Home Address",
                      keyboardType: TextInputType.streetAddress,
                    ),
                    const SizedBox(height: 10),
                    CustomTextFormField(
                      controller: _userController.officeAddController,
                      hintText: "Office Address",
                      keyboardType: TextInputType.streetAddress,
                    ),
                    const SizedBox(height: 10),
                    CustomTextFormField(
                      controller: _userController.cont1Controller,
                      hintText: "Emergency Contact 1",
                      maxLength: 10,
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 10),
                    CustomTextFormField(
                      controller: _userController.cont2Controller,
                      hintText: "Emergency Contact 2",
                      maxLength: 10,
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 10),
                    CustomTextFormField(
                      controller: _userController.cont3Controller,
                      hintText: "Emergency Contact 3",
                      maxLength: 10,
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 10),
                    CustomTextFormField(
                      controller: _userController.emailController,
                      hintText: "Email",
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              CustomTextButton(
                width: 200,
                title: "SAVE",
                background: deepBlue,
                textColor: white,
                fontSize: 18,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showDate() async {
    var pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      lastDate: DateTime.now(),
      firstDate: DateTime(1950),
    );
    if (pickedDate != null) {
      _userController.dobController.text = pickedDate.toString().split(" ")[0];
    }
  }
}
