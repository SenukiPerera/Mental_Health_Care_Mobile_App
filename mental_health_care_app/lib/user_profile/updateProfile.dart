import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mental_health_care_app/authentication/controllers/profile_contoller.dart';
import 'package:mental_health_care_app/main.dart';
import 'package:mental_health_care_app/user_profile/widgets/textFormField.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  final ProfileController controller = Get.put(ProfileController());
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  void loadUserData() async {
    await controller.fetchUserData();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, color: blueBackgroungColor),
        ),
        title: const Text(
          'Edit Profile',
          style: TextStyle(
            color: blueBackgroungColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(25.0),
                child: Form(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            height: 120,
                            width: 120,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset(
                                'assets/images/profile_picture.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: blueBackgroungColor,
                              ),
                              child: const Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                                size: 18.0,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 50),
                      textFormField(
                        controller: controller.fullNameController,
                        labelText: 'Full Name',
                        icon: Icons.person,
                      ),
                      const SizedBox(height: 20),
                      textFormField(
                        controller: controller.emailController,
                        labelText: 'Email',
                        icon: Icons.email,
                      ),
                      const SizedBox(height: 20),
                      textFormField(
                        controller: controller.phoneController,
                        labelText: 'Phone Number',
                        icon: Icons.phone,
                      ),
                      const SizedBox(height: 20),
                      textFormField(
                        controller: controller.passwordController,
                        labelText: 'Password',
                        icon: Icons.lock,
                        obscureText: true,
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () async {
                            await controller.updateUserData();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: blueBackgroungColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'Save Profile',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
