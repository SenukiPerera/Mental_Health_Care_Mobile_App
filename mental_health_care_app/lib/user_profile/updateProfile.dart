import 'package:flutter/material.dart';
import 'package:mental_health_care_app/main.dart';
import 'package:mental_health_care_app/user_profile/widgets/textFormField.dart';

class UpdateProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
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
        automaticallyImplyLeading: false, // This removes the back arrow
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 120,
                    width: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image(
                        image: const AssetImage(
                            'assets/images/profile_picture.jpg'),
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
              const SizedBox(
                height: 50,
              ),
              Form(
                  child: Column(
                children: [
                  textFormField(
                    labelText: 'Full Name',
                    icon: Icons.person,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  textFormField(
                    labelText: 'Email',
                    icon: Icons.email,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  textFormField(
                    labelText: 'Phone Number',
                    icon: Icons.phone,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  textFormField(
                    labelText: 'Password',
                    icon: Icons.lock,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to UpdateProfile screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                UpdateProfile(), // Corrected class name
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: blueBackgroungColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Edit Profile',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
