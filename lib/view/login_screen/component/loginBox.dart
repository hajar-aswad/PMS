import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pms/controller/screen/auth_controller.dart';
import 'package:pms/core/constants/app_colors.dart';

import 'package:pms/core/constants/app_dimentions.dart';

class loginBox extends GetView<AuthController> {
  const loginBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: AppDimentions.defaultPadding),
      padding: const EdgeInsets.all(AppDimentions.defaultPadding),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: AppColors.primaryColor.withOpacity(0.5),
        ),
        borderRadius: const BorderRadius.all(
            Radius.circular(AppDimentions.defaultPadding)),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 45,
            width: 200,
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.2),
              borderRadius: BorderRadius.circular(40),
            ),
            child: TextFormField(
              controller: controller.emailController,
              decoration: const InputDecoration(
                hintText: 'Email',
                hintStyle: TextStyle(color: Colors.white54, fontSize: 14),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 50,
            width: 200,
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.2),
              borderRadius: BorderRadius.circular(40),
            ),
            child: TextFormField(
              controller: controller.passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Password',
                hintStyle: TextStyle(color: Colors.white54, fontSize: 14),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
              ),
            ),
          ),
          const SizedBox(height: 40),
          Container(
            height: 35,
            width: 100,
            child: ElevatedButton(
              onPressed: () async {
                controller.login();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
              ),
              child: const Text(
                'Log In',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
