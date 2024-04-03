import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_ambulance/constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isGoBack;
  const CustomAppBar({
    Key? key,
    required this.title,
    this.isGoBack = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: isGoBack
          ? Container(
              margin: const EdgeInsets.only(left: 10),
              width: 25,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x26000000),
                    offset: Offset(0, 4),
                    blurRadius: 15,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Center(
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 24,
                  ),
                  onPressed: () => Get.back(),
                ),
              ),
            )
          : Container(),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: lightBlack,
          letterSpacing: 1,
        ),
      ),
      centerTitle: true,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
