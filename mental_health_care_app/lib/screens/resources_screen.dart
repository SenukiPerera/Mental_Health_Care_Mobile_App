import 'package:flutter/material.dart';
import 'package:mental_health_care_app/home_page/home_page.dart';
import 'package:mental_health_care_app/solution/solutionHome.dart';
import 'package:mental_health_care_app/user_profile/profile.dart';
import 'stress_management_page.dart';
import 'depression.dart'; // ✅ Import the depression page

class ResourcesScreen extends StatefulWidget {
  const ResourcesScreen({super.key});

  @override
  State<ResourcesScreen> createState() => _ResourcesScreenState();
}

class _ResourcesScreenState extends State<ResourcesScreen> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else if (index == 4) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Profile()),
      );
    } else if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Solutions()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> cardData = [
      {
        'title': 'Stress Management',
        'color': const Color.fromARGB(255, 74, 197, 76),
        'image': 'assets/images/stressmanagement.png',
      },
      {
        'title': 'Anxiety',
        'color': const Color.fromARGB(255, 232, 87, 3),
        'image': 'assets/images/anxiety.png',
      },
      {
        'title': 'Depression',
        'color': const Color.fromARGB(255, 33, 65, 145),
        'image': 'assets/images/depression.png',
      },
      {
        'title': 'Self Love',
        'color': const Color.fromARGB(255, 250, 197, 22),
        'image': 'assets/images/selflove.png',
      },
      {
        'title': 'Guided Meditation',
        'color': const Color.fromARGB(255, 200, 21, 255),
        'image': 'assets/images/guidedmeditation.png',
      },
    ];

    final List<Map<String, dynamic>> featuredResources = [
      {
        'title': 'Daily Meditation for Calmness',
        'description':
            'Take a few moment to center yourself and find calm with this 10-minute guided meditation.',
        'image': 'assets/images/calm.png',
        'buttonText': 'Listen Now',
      },
      {
        'title': 'Coping with Anxiety: Practical Tips',
        'description':
            'Learn effective strategies to reduce anxiety and regain control of your emotions.',
        'image': 'assets/images/practice.png',
        'buttonText': 'Read More',
      },
      {
        'title': 'Boost your Self-Love with Daily Affirmations',
        'description':
            'Discover the power of positive affirmations to nurture self-love and confidence.',
        'image': 'assets/images/affirments.png',
        'buttonText': 'Start Listening',
      },
    ];

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
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // 🔝 Top Bar
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/MindcareLogo.png',
                          width: 28,
                          height: 28,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.warning, color: Colors.white),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'Resource Library',
                          style: TextStyle(
                            color: Color(0xFF4A90E2),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Handle SOS
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4A90E2),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text('SOS',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),

              // 🔍 Search Bar
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search resources...',
                    prefixIcon:
                        const Icon(Icons.search, color: Color(0xFF4A90E2)),
                    filled: true,
                    fillColor: const Color(0xFFF0F4F8),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),

              // 🔄 Horizontal Resource Cards
              Container(
                height: 200,
                margin: const EdgeInsets.only(top: 10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(cardData.length, (index) {
                      final item = cardData[index];
                      return Padding(
                        padding: EdgeInsets.only(
                          left: index == 0 ? 20 : 10,
                          right: index == cardData.length - 1 ? 20 : 0,
                        ),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(12),
                          onTap: () {
                            if (item['title'] == 'Stress Management') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => StressManagementPage(),
                                ),
                              );
                            } else if (item['title'] == 'Depression') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DepressionPage(),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      '${item['title']} page is under construction'),
                                ),
                              );
                            }
                          },
                          child: Container(
                            width: 140,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: item['color'],
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    item['image'],
                                    width: 120,
                                    height: 120,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  item['title'],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 8),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // 🌟 Featured Resources Title
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Featured Resources',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4A90E2),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // 🌟 Featured Resource Cards
              Column(
                children: featuredResources.map((item) {
                  return Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            item['image'],
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['title'],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                item['description'],
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.black54,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: TextButton(
                                  onPressed: () {
                                    // TODO: Handle button action
                                  },
                                  child: Text(
                                    item['buttonText'],
                                    style: const TextStyle(
                                      color: Color(0xFF4A90E2),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: 20),

              // 📚 Explore More Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // TODO: Handle explore more
                    },
                    icon: const Icon(Icons.explore),
                    label: const Text(
                      'Explore More Resources',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4A90E2),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
