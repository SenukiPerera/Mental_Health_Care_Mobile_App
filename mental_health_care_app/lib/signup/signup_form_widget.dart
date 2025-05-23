import 'package:flutter/material.dart';
import 'package:mental_health_care_app/authentication/controllers/signup_controller.dart';
import 'package:mental_health_care_app/user_profile/widgets/textFormField.dart';
import 'package:get/get.dart';
// Make sure to import or define SignUpController as well

class signup_form_widget extends StatelessWidget {
  const signup_form_widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final _formKey = GlobalKey<FormState>();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textFormField(
                controller: controller.fullName,
                labelText: 'Full Name',
                icon: Icons.person,
              ),
              SizedBox(
                height: 20,
              ),
              textFormField(
                controller: controller.email,
                labelText: 'Email',
                icon: Icons.email,
              ),
              SizedBox(
                height: 20,
              ),
              textFormField(
                controller: controller.phone,
                labelText: 'Phone Number',
                icon: Icons.phone,
              ),
              SizedBox(
                height: 20,
              ),
              textFormField(
                controller: controller.password,
                labelText: 'Password',
                icon: Icons.lock,
              ),
              SizedBox(
                height: 20,
              ),
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
                    if (_formKey.currentState!.validate()) {
                      final success = await controller.registerUser();
                      if (success) {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          '/HomeScreen',
                          (route) => false, // Removes all previous routes
                        );
                      } else {
                        Get.snackbar(
                          "Sign Up Failed",
                          "Please try again.",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.redAccent,
                          colorText: Colors.white,
                        );
                      }
                    } else {
                      Get.snackbar(
                        "Invalid Input",
                        "Please fill all fields correctly.",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.orange,
                        colorText: Colors.white,
                      );
                    }
                  },
                  child: const Text("Sign Up",
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
              ),
            ],
          )),
    );
  }
}
