import 'package:artificial_soft_task/common/app_color.dart';
import 'package:artificial_soft_task/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomButton(
              onTap: () {
                Get.toNamed("/products");
              },
              title: 'Products',
              fontColor: kSecondaryColor,
              redius: 10.0,
              btnColor: btnClr,
            ),
            const SizedBox(
              height: 15.0,
            ),
            CustomButton(
              onTap: () {
                Get.toNamed("/cart");
              },
              title: 'Cart',
              redius: 10.0,
              btnColor: kSecondaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
