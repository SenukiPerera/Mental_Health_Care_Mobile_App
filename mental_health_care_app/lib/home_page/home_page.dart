import 'package:flutter/material.dart';
import '../main.dart';
import 'package:mental_health_care_app/util/emoji_faces.dart';
import 'package:mental_health_care_app/user_profile/profile.dart';
import 'package:mental_health_care_app/screens/resources_screen.dart';
import 'package:mental_health_care_app/screens/depression_test_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ResourcesScreen()),
      );
    } else if (index == 4) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Profile()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Resources'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(
              icon: Icon(Icons.health_and_safety), label: 'Solutions'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(0, 4),
                    blurRadius: 6,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hello, User!',
                      style: TextStyle(
                        color: blueBackgroungColor,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: blueBackgroungColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        "SOS",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20.0),
                    Container(
                      decoration: BoxDecoration(
                        color: lightBlueBackgroundColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'How are you feeling today?',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 25.0),
                          const Row(
                            children: [
                              EmojiFaces(),
                            ],
                          ),
                          const SizedBox(height: 20.0),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25.0),
                    Text(
                      'Explore Our Resources',
                      style: TextStyle(
                        color: blueBackgroungColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 25.0),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(children: [
                        _buildResourceCard(
                          imagePath: 'assets/images/image1.jpg',
                          title: 'Coping with Anxiety',
                          description:
                              'Explore effective strategies to manage\nanxiety in your daily life.',
                        ),
                        const SizedBox(width: 12.0),
                        _buildResourceCard(
                          imagePath: 'assets/images/image2.jpg',
                          title: 'Managing Stress',
                          description:
                              'Learn how to manage stress with practical techniques.',
                        ),
                      ]),
                    ),
                    const SizedBox(height: 25.0),
                    Container(
                      child: Center(
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/Meditation.png',
                              width: 164,
                              height: 164,
                            ),
                            Text(
                              'Explore self depression test',
                              style: TextStyle(
                                color: blueBackgroungColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const DepressionTestScreen(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(120, 40),
                                backgroundColor: blueBackgroungColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Text(
                                'Start Test',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 25.0),
                    Container(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Icon(Icons.chat,
                              size: 100, color: blueBackgroungColor),
                          Text(
                            'Chat with an Expert',
                            style: TextStyle(
                              color: blueBackgroungColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // TODO: Open Chat screen
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(120, 40),
                              backgroundColor: blueBackgroungColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              'Chat Now',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25.0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build resource cards
  Widget _buildResourceCard({
    required String imagePath,
    required String title,
    required String description,
  }) {
    return Container(
      height: 257,
      width: 250,
      decoration: BoxDecoration(
        color: lightBlueBackgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Image.asset(
              imagePath,
              width: 280,
              height: 110,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            title,
            style: TextStyle(
              color: blueBackgroungColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 8.0),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ResourcesScreen(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(120, 40),
              backgroundColor: blueBackgroungColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'Read More',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
