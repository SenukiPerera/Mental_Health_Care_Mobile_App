import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mental_health_care_app/home_page/home_page.dart';
import 'package:mental_health_care_app/main.dart';
import 'package:mental_health_care_app/screens/resources_screen.dart';
import 'package:mental_health_care_app/user_profile/widgets/profileMenu.dart';
import 'package:mental_health_care_app/user_profile/updateProfile.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int _selectedIndex = 4; // Start with Profile tab selected
  final User? user = FirebaseAuth.instance.currentUser;

  // Method to handle BottomNavigationBar taps
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigate to different screens based on selected index
    if (_selectedIndex == 0) {
      // Index 0 corresponds to the home tab
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomePage()), // Navigate to Home screen
      );
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ResourcesScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor:
            Colors.blue, // Profile icon and label in blue when selected
        unselectedItemColor:
            Colors.black, // All other icons and labels in black
        type: BottomNavigationBarType.fixed, // Keeps all labels visible
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Resources',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.health_and_safety),
            label: 'Solutions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Profile',
          style: TextStyle(
            color: blueBackgroungColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false, // This removes the back arrow
      ),
      body: SingleChildScrollView(
        child: SafeArea(
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
                          Icons.edit,
                          color: Colors.white,
                          size: 18.0,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  user?.displayName ?? 'No name',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  user?.email ?? 'No email',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 180,
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
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 10,
                ),

                //Menu
                ProfilemenuWidget(
                  title: 'Settings',
                  icon: Icons.settings,
                  onPress: () {},
                ),
                ProfilemenuWidget(
                  title: 'profile Management',
                  icon: Icons.manage_accounts,
                  onPress: () {},
                ),
                ProfilemenuWidget(
                  title: 'Help Center',
                  icon: Icons.help_center,
                  onPress: () {},
                ),
                ProfilemenuWidget(
                  title: 'Privacy policy',
                  icon: Icons.privacy_tip,
                  onPress: () {},
                ),

                const SizedBox(
                  height: 20,
                ),
                Divider(
                  color: Colors.grey.withOpacity(0),
                ),
                const SizedBox(
                  height: 30,
                ),

                ProfilemenuWidget(
                  title: 'Log Out',
                  icon: Icons.login_outlined,
                  onPress: () {
                    Navigator.pushNamed(context, '/LoginScreen');
                  },
                  endIcon: false,
                  textColor: Colors.red,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
