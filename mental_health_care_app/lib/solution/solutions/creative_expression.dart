import 'package:flutter/material.dart';
import 'package:mental_health_care_app/solution/constants/colors.dart';

class CreativeExpression extends StatelessWidget {
  const CreativeExpression({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Creative Expression',
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
              "Express yourself creatively to heal, discover, and grow.",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: colorE,
              ),
            ),
            const SizedBox(height: 32),
            _buildSectionCard(
              title: 'Art Therapy',
              description: 'Use colors and shapes to express your emotions.',
              icon: Icons.palette,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border:
                          Border.all(color: colorA.withOpacity(0.3), width: 1),
                    ),
                    child: const Text(
                      'Try These Activities:',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: colorA,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  _buildBullet('Draw your feelings with colors'),
                  _buildBullet('Create a mood collage with magazines'),
                  _buildBullet('Paint abstract shapes representing emotions'),
                  _buildBullet('Sketch gratitude symbols'),
                  _buildBullet('Make mandalas for mindfulness'),
                  _buildBullet('Design positive affirmation cards'),
                ],
              ),
            ),
            const SizedBox(height: 24),
            _buildSectionCard(
              title: 'Music & Sound',
              description: 'Create rhythms and melodies to process emotions.',
              icon: Icons.music_note,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildBullet('Hum or sing your current mood'),
                  _buildBullet('Create playlists for different emotions'),
                  _buildBullet('Make rhythms with household items'),
                  _buildBullet('Record voice memos of positive thoughts'),
                  _buildBullet('Listen and move to calming music'),
                ],
              ),
            ),
            const SizedBox(height: 24),
            _buildSectionCard(
              title: 'Creative Writing',
              description: 'Transform thoughts and feelings into words.',
              icon: Icons.edit,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildBullet('Write poetry about your experiences'),
                  _buildBullet('Create fictional stories with happy endings'),
                  _buildBullet('Draft letters to your future self'),
                  _buildBullet('Compose gratitude lists creatively'),
                  _buildBullet('Write stream-of-consciousness for 10 minutes'),
                ],
              ),
            ),
            const SizedBox(height: 24),
            _buildSectionCard(
              title: 'Movement & Dance',
              description: 'Express emotions through body movement.',
              icon: Icons.directions_run,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildBullet('Dance freely to your favorite songs'),
                  _buildBullet('Create movements that show your feelings'),
                  _buildBullet('Practice gentle stretching sequences'),
                  _buildBullet('Do yoga poses that feel good'),
                  _buildBullet('Walk in patterns that inspire you'),
                ],
              ),
            ),
            const SizedBox(height: 24),
            _buildSectionCard(
              title: 'Digital Creation',
              description: 'Use technology for creative self-expression.',
              icon: Icons.computer,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildBullet('Take photos of things that make you smile'),
                  _buildBullet('Create digital mood boards'),
                  _buildBullet('Design inspirational phone wallpapers'),
                  _buildBullet('Make short videos of positive moments'),
                  _buildBullet('Write encouraging social media posts'),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: const Text(
                'Quick Creative Boosts',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: colorE,
                  letterSpacing: 0.3,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Column(
              children: [
                _buildTipCard('Doodle for 5 minutes', Icons.brush),
                const SizedBox(height: 12),
                _buildTipCard('Hum a happy tune', Icons.music_note),
                const SizedBox(height: 12),
                _buildTipCard('Write 3 good things', Icons.favorite),
                const SizedBox(height: 12),
                _buildTipCard('Dance to one song', Icons.music_video),
                const SizedBox(height: 12),
                _buildTipCard('Take nature photos', Icons.camera_alt),
              ],
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
      width: double.infinity,
      decoration: BoxDecoration(
        color: colorA.withOpacity(0.08),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: colorA.withOpacity(0.2), width: 2),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: colorC, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: colorE,
                height: 1.2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}