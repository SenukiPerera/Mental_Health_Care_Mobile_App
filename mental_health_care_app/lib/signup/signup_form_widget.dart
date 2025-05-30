import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mental_health_care_app/authentication/controllers/signup_controller.dart';
import 'package:mental_health_care_app/user_profile/widgets/textFormField.dart';

class signup_form_widget extends StatelessWidget {
  const signup_form_widget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final formKey = GlobalKey<FormState>();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textFormField(
              controller: controller.fullName,
              labelText: 'Full Name',
              icon: Icons.person,
            ),
            const SizedBox(height: 20),
            textFormField(
              controller: controller.email,
              labelText: 'Email',
              icon: Icons.email,
            ),
            const SizedBox(height: 20),
            textFormField(
              controller: controller.phone,
              labelText: 'Phone Number',
              icon: Icons.phone,
            ),
            const SizedBox(height: 20),
            textFormField(
              controller: controller.password,
              labelText: 'Password',
              icon: Icons.lock,
              obscureText: true,
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.blue,
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    await SignUpController.instance
                        .signupUser(); // ✅ await this
                  }
                },
                child: const Text("Sign Up",
                    style: TextStyle(color: Colors.white, fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
