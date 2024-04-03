import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_ambulance/constants.dart';
import 'package:new_ambulance/controllers/family_profile_controller.dart';
import 'package:new_ambulance/pages/widgets/custom_button.dart';
import 'package:new_ambulance/pages/widgets/custom_text_form.dart';

class FamilyProfileScreen extends StatefulWidget {
  const FamilyProfileScreen({super.key});

  @override
  State<FamilyProfileScreen> createState() => _FamilyProfileScreenState();
}

class _FamilyProfileScreenState extends State<FamilyProfileScreen> {
  final FamilyProfileController _profileController =
      Get.put(FamilyProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20).copyWith(top: 50),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "My Family Profile",
                style: TextStyle(
                  color: lightBlack,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Form(
                child: Column(
                  children: [
                    CustomTextFormField(
                      controller: _profileController.nameController,
                      hintText: "Name",
                      keyboardType: TextInputType.name,
                    ),
                    SizedBox(height: 10),
                    CustomTextFormField(
                      controller: _profileController.relationController,
                      hintText: "Relationship",
                      keyboardType: TextInputType.name,
                    ),
                    SizedBox(height: 10),
                    CustomTextFormField(
                      controller: _profileController.phnController,
                      hintText: "Phone Number",
                      maxLength: 10,
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 10),
                    CustomTextFormField(
                      controller: _profileController.altPhnController,
                      hintText: "Alternate Number",
                      maxLength: 10,
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 10),
                    CustomTextFormField(
                      controller: _profileController.homeAddController,
                      hintText: "Home Address",
                      keyboardType: TextInputType.streetAddress,
                    ),
                    SizedBox(height: 10),
                    CustomTextFormField(
                      controller: _profileController.officeAddController,
                      hintText: "Office Address",
                      keyboardType: TextInputType.streetAddress,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: CustomTextButton(
                  width: 200,
                  title: "SAVE",
                  background: deepBlue,
                  textColor: white,
                  fontSize: 18,
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
