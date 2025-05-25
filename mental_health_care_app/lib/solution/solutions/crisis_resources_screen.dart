import 'package:flutter/material.dart';
import 'package:mental_health_care_app/solution/constants/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class CrisisResourcesScreen extends StatelessWidget {
  const CrisisResourcesScreen({super.key});

  final List<Map<String, String>> hotlines = const [
    {"name": "National Institute of Mental Health", "number": "0112578234"},
    {"name": "Mind Heals Sri Lanka", "number": "0713120740"},
    {
      "name": "Sithanivana Mental Health Rehabilitation & Counselling Centre",
      "number": "0342239245"
    },
  ];

  final List<Map<String, String>> calmingTips = const [
    {"emoji": "🎧", "tip": "Listen to your favorite relaxing music."},
    {"emoji": "🌿", "tip": "Go outside or near a window and look at the sky."},
    {"emoji": "🚶", "tip": "Take a short walk — even in your room."},
    {
      "emoji": "🧊",
      "tip": "Hold an ice cube or splash cool water on your face.",
    },
    {"emoji": "✍️", "tip": "Write down what you're feeling, no filter."},
    {"emoji": "📺", "tip": "Watch a funny video or something familiar."},
    {
      "emoji": "💆",
      "tip": "Do a quick body scan — relax your shoulders, jaw, hands.",
    },
  ];

  Future<void> _launchCall(String number) async {
    final Uri uri = Uri(scheme: 'tel', path: number);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      debugPrint("Couldn't launch call to $number");
    }
  }

  Future<void> _launchSMS(String number) async {
    final Uri uri = Uri(scheme: 'sms', path: number);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      debugPrint("Couldn't launch SMS to $number");
    }
  }

  Widget _buildHotlineCard(String name, String number) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
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
              // Container(
              //   padding: const EdgeInsets.all(12),
              //   decoration: BoxDecoration(
              //     color: colorC.withOpacity(0.15),
              //     borderRadius: BorderRadius.circular(16),
              //   ),
              //   child: const Icon(Icons.phone, color: colorC, size: 28),
              // ),
              //const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: colorE,
                        letterSpacing: 0.3,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "📞 $number",
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
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    //color: Colors.green.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                        color: Colors.green.withOpacity(0.3), width: 1),
                  ),
                  child: InkWell(
                    onTap: () => _launchCall(number),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.call, color: Colors.green, size: 20),
                        SizedBox(width: 8),
                        Text(
                          'Call Now',
                          style: TextStyle(
                            color: colorD,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 30),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    //color: Colors.orange.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                        color: Colors.orange.withOpacity(0.3), width: 1),
                  ),
                  child: InkWell(
                    onTap: () => _launchSMS(number),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.sms, color: Colors.orange, size: 20),
                        SizedBox(width: 8),
                        Text(
                          'Send SMS',
                          style: TextStyle(
                            color: colorD,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTipCard(String emoji, String text) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
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
            child: Text(emoji, style: const TextStyle(fontSize: 20)),
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

  Widget _buildFallbackHelp() {
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
                child: const Icon(Icons.help, color: colorC, size: 28),
              ),
              const SizedBox(width: 16),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "What if I can't call or text?",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: colorE,
                        letterSpacing: 0.3,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Alternative ways to get help when you need it',
                      style: TextStyle(
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildBullet(
                  'Ask someone nearby like a friend, family member, or neighbor'),
              _buildBullet(
                  'Go to a safe place: a clinic, library, or someone you trust'),
              _buildBullet(
                  'Focus on calming yourself for a few minutes using the tips above'),
              _buildBullet(
                  'Remember: This moment will pass - you are not alone'),
            ],
          ),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Crisis Resources',
          style: TextStyle(
            color: colorA,
            fontWeight: FontWeight.bold,
          ),
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
              "You are not alone. Fast help is available.",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: colorE,
              ),
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: const Text(
                'Urgent Contacts',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: colorD,
                  letterSpacing: 0.3,
                ),
              ),
            ),
            const SizedBox(height: 16),
            for (var hotline in hotlines)
              _buildHotlineCard(hotline['name']!, hotline['number']!),
            const SizedBox(height: 8),
            _buildFallbackHelp(),
            const SizedBox(height: 32),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: const Text(
                'Quick Calming Tips',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: colorE,
                  letterSpacing: 0.3,
                ),
              ),
            ),
            const SizedBox(height: 16),
            for (var tip in calmingTips)
              _buildTipCard(tip['emoji']!, tip['tip']!),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
