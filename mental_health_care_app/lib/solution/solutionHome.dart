import 'package:flutter/material.dart';
import 'package:mental_health_care_app/home_page/home_page.dart';
import 'package:mental_health_care_app/screens/resources_screen.dart';
import 'package:mental_health_care_app/solution/constants/colors.dart';
import 'package:mental_health_care_app/solution/solutions/crisis_resources_screen.dart';
//import 'package:mental_health_care_app/solution/solutions/creative_expression.dart';
import 'package:mental_health_care_app/solution/solutions/mindfulness_screen.dart';
//import 'package:mental_health_care_app/solution/solutions/physical_wellness_screen.dart';
import 'package:mental_health_care_app/solution/solutions/sleep_improvement_screen.dart';

class Solutions extends StatefulWidget {
  const Solutions({super.key});

  @override
  State<Solutions> createState() => _SolutionsState();
}

class _SolutionsState extends State<Solutions> {
  int _selectedIndex = 3; // Start with Profile tab selected

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

  void navigateToSolution(String title) {
    switch (title) {
      case 'Mindfulness & Breathing':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MindfulnessPage()),
        );
        break;
      // case 'Journaling':
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(builder: (context) => const JournalingPage()),
      //   );
      //   break;
      // case 'Physical Wellness':
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(builder: (context) => const PhysicalWellnessPage()),
      //   );
      //   break;
      case 'Sleep Improvement':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SleepImprovementScreen(),
          ),
        );
        break;
      case 'Crisis Resources':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CrisisResourcesScreen(),
          ),
        );
        break;
      case 'Physical Wellness':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const PhysicalWellness(),
          ),
        );
        break;
      case 'Creative Expression':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CreativeExpression(),
          ),
        );
        break;
      // // Add more cases for future pages PhysicalWellness
      // default:
      //   ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(content: Text('Page for "$title" not yet implemented.')),
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

      //backgroundColor: colorB,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Solutions',
          style: TextStyle(
            color: colorA,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false, // This removes the back arrow
      ),
      // appBar: AppBar(
      //   backgroundColor: colorA,
      //   title: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       const Text(
      //         'Solutions',
      //         style: TextStyle(
      //           fontSize: 35,
      //           fontWeight: FontWeight.bold,
      //           color: colorB,
      //         ),
      //       ),
      //       //IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
      //     ],
      //   ),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //const SizedBox(height: 20),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     const Text(
            //       'Solutions',
            //       style: TextStyle(
            //         fontSize: 35,
            //         fontWeight: FontWeight.bold,
            //         color: colorE,
            //       ),
            //     ),
            //     IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
            //   ],
            // ),
            // const SizedBox(height: 20),

            //const SizedBox(height: 12),
            const Text(
              'Hi, here are solutions tailored for your needs',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: colorE,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Explore solutions that can help you feel more balanced and in control.',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.normal,
                color: colorD,
              ),
            ),
            // const SizedBox(height: 15),
            // const Text(
            //   'Explore solutions that can help you feel more balanced and in control.',
            //   style: TextStyle(fontSize: 18, color: colorD),
            // ),
            const SizedBox(height: 30),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 1,
                children: [
                  buildSolutionCard(
                    'Mindfulness & Breathing',
                    Icons.self_improvement,
                    colorA.withOpacity(0.3),
                  ),
                  buildSolutionCard(
                    'Creative Expression',
                    Icons.palette,
                    colorA.withOpacity(0.45),
                  ),
                  buildSolutionCard(
                    'Sleep Improvement',
                    Icons.nights_stay,
                    colorA.withOpacity(0.4),
                  ),
                  buildSolutionCard(
                    'Physical Wellness',
                    Icons.favorite,
                    colorA.withOpacity(0.45),
                  ),
                  buildSolutionCard(
                    'Crisis Resources',
                    Icons.support_agent,
                    colorA.withOpacity(0.475),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: Colors.white,
      //   selectedItemColor: Colors.blue,
      //   unselectedItemColor: Colors.black,
      //   type: BottomNavigationBarType.fixed,
      //   currentIndex: _selectedIndex,
      //   onTap: _onTapItem,
      //   items: const [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      //     BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Resources'),
      //     BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.health_and_safety),
      //       label: 'Solutions',
      //     ),
      //     BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      //   ],
      // ),
    );
  }

  Widget buildSolutionCard(String title, IconData icon, Color bgColor) {
    return GestureDetector(
      onTap: () => navigateToSolution(title),
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 80, color: colorE),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
