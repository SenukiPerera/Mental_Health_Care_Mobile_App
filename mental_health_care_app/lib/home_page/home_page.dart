import 'package:flutter/material.dart';
import '../main.dart';
import 'package:mental_health_care_app/util/emoji_faces.dart';
import 'package:mental_health_care_app/user_profile/profile.dart'; // Import your Profile screen

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // Method to handle BottomNavigationBar taps
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigate to different screens based on selected index
    if (_selectedIndex == 4) {
      // Index 4 corresponds to the Profile tab
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Profile()), // Navigate to Profile screen
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue, // Home icon and label when selected
        unselectedItemColor: Colors.black, // All other icons and labels
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
      body: SafeArea(
        child: Column(
          children: [
            // Greeting Row (Fixed)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: Offset(0, 4), // 👇 bottom shadow
                    blurRadius: 6,
                    spreadRadius: 0,
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

            // Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20.0),
                    // Mood Tracker Container
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
                          Center(
                            child: SizedBox(
                              height: 40,
                              width: 200,
                              child: ElevatedButton(
                                onPressed: () {
                                  // Navigate to mood history
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: blueBackgroungColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: const Text(
                                  'View Mood History',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25.0),
                    // Resources Section
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
                        // Resource 1
                        Container(
                          height: 257,
                          width: 250,
                          decoration: BoxDecoration(
                            color: lightBlueBackgroundColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                ),
                                child: Image.asset(
                                  'assets/images/image1.jpg',
                                  width: 280,
                                  height: 110,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              Text(
                                'Coping with Anxiety',
                                style: TextStyle(
                                  color: blueBackgroungColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                'Explore effective strategies to manage\nanxiety in your daily life.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(120, 40),
                                    backgroundColor: blueBackgroungColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: Text(
                                    'Read More',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  )),
                              SizedBox(
                                height: 8.0,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 12.0,
                        ),
                        // Resource 2
                        Container(
                          height: 257,
                          width: 250,
                          decoration: BoxDecoration(
                            color: lightBlueBackgroundColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                ),
                                child: Image.asset(
                                  'assets/images/image2.jpg',
                                  width: 280,
                                  height: 110,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              Text(
                                'Managing Stress',
                                style: TextStyle(
                                  color: blueBackgroungColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                'Learn how to manage stress with practical techniques.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(120, 40),
                                    backgroundColor: blueBackgroungColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: Text(
                                    'Read More',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  )),
                              SizedBox(
                                height: 8.0,
                              ),
                            ],
                          ),
                        ),
                      ]),
                    ),

                    const SizedBox(height: 25.0),
                    // Meditation Section
                    Container(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                            SizedBox(
                              height: 8.0,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  // Navigate to the next page
                                },
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(120, 40),
                                  backgroundColor: blueBackgroungColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Text(
                                  'Start Test',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 25.0),
                    // Chat Section
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
                              // Open Chat screen
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(120, 40),
                              backgroundColor: blueBackgroungColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
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
}
