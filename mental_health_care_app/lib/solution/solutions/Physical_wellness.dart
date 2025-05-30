import 'package:flutter/material.dart';
import 'package:mental_health_care_app/solution/constants/colors.dart';

class PhysicalWellness extends StatelessWidget {
  const PhysicalWellness({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: colorB,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Physical Wellness',
          style: TextStyle(color: colorA, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: colorA, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text(
              "Boost your mental health through movement, nutrition, and care.",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: colorE,
                // height: 1.4,
                // letterSpacing: 0.3,
              ),
              //textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            _buildSectionCard(
              title: 'Move Your Body',
              description: 'Even 10 minutes of walking can lift your mood.',
              icon: Icons.directions_run,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      //color: colorA.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(25),
                      border:
                          Border.all(color: colorA.withOpacity(0.3), width: 1),
                    ),
                    child: const Text(
                      '7-Minute Routine:',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: colorA,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  _buildBullet('Jumping Jacks – 30 secs'),
                  _buildBullet('Wall Sit – 30 secs'),
                  _buildBullet('Push-ups – 30 secs'),
                  _buildBullet('Crunches – 30 secs'),
                  _buildBullet('Step-ups – 30 secs'),
                  _buildBullet('Squats – 30 secs'),
                  _buildBullet('Plank – 30 secs'),
                ],
              ),
            ),
            const SizedBox(height: 24),
            _buildSectionCard(
              title: 'Eat for Your Mind',
              description: 'A healthy diet supports emotional stability.',
              icon: Icons.restaurant,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildBullet('Leafy greens (spinach, kale)'),
                  _buildBullet('Fatty fish (salmon, sardines)'),
                  _buildBullet('Berries (blueberries, strawberries)'),
                  _buildBullet('Nuts (walnuts, almonds)'),
                  _buildBullet('Whole grains (oats, brown rice)'),
                ],
              ),
            ),
            const SizedBox(height: 24),
            _buildSectionCard(
              title: 'Rest is Productive',
              description: 'Proper rest improves emotional regulation.',
              icon: Icons.self_improvement,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildBullet('Take short naps during the day'),
                  _buildBullet('Avoid screens 1 hour before bed'),
                  _buildBullet('Keep a consistent sleep schedule'),
                  _buildBullet('Practice calming bedtime routines'),
                ],
              ),
            ),
            const SizedBox(height: 24),
            _buildSectionCard(
              title: 'Stay Hydrated',
              description: 'Water boosts focus and reduces fatigue.',
              icon: Icons.local_drink,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildBullet('Aim for 8 cups of water/day'),
                  _buildBullet('Keep a water bottle with you'),
                  _buildBullet('Flavor water with lemon/mint'),
                  _buildBullet('Drink a glass before meals'),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: const Text(
                'Quick Tips',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: colorE,
                  letterSpacing: 0.3,
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 110,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 4),
                children: [
                  _buildTipCard(
                      'Stretch for 5 minutes', Icons.accessibility_new),
                  _buildTipCard('Eat colorful veggies', Icons.local_dining),
                  _buildTipCard('Drink 8 cups of water', Icons.water_drop),
                  _buildTipCard('Take a nature walk', Icons.park),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionCard({
    required String title,
    required String description,
    required IconData icon,
    required Widget child,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: colorA.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        //border: Border.all(color: colorA.withOpacity(0.15), width: 2),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: colorC.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(icon, color: colorC, size: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: colorE,
                        letterSpacing: 0.3,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 15,
                        color: colorD,
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          child,
        ],
      ),
    );
  }

  Widget _buildBullet(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 6,
            height: 6,
            margin: const EdgeInsets.only(top: 8, right: 12),
            decoration: BoxDecoration(
              color: colorC,
              borderRadius: BorderRadius.circular(3),
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 15,
                color: colorD,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTipCard(String text, IconData icon) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: colorA.withOpacity(0.08),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: colorA.withOpacity(0.2), width: 2),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: colorC, size: 22),
          ),
          const SizedBox(height: 8),
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: colorE,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}



