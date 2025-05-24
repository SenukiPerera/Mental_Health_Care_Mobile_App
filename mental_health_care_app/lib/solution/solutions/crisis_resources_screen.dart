import 'package:flutter/material.dart';
import 'package:mental_health_care_app/solution/constants/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class CrisisResourcesScreen extends StatelessWidget {
  const CrisisResourcesScreen({super.key});

  final List<Map<String, String>> hotlines = const [
    {"name": "National Institute of Mental Health", "number": "0112578234"},
    {"name": "Mind Heals Sri Lanka", "number": "0713120740"},
    {
      "name": "Sithnivana Mental Health Rehabilitation & Counselling Centre",
      "number": "0342239245"
    },
  ];

  final List<Map<String, String>> calmingTips = const [
    //{"emoji": "🧘", "tip": "Take 10 deep, slow breaths."},
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
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorA.withOpacity(0.1),
        borderRadius: BorderRadius.circular(14),
        //border: Border.all(color: colorA.withOpacity(0.15)),
        // boxShadow: [
        //   BoxShadow(
        //     color: colorA.withOpacity(0.1),
        //     blurRadius: 6,
        //     offset: const Offset(0, 2),
        //   ),
        // ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: colorD,
            ),
          ),
          //const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("📞 $number",
                  style: const TextStyle(color: colorE, fontSize: 16)),
              Row(
                children: [
                  IconButton(
                    onPressed: () => _launchCall(number),
                    icon: const Icon(
                      Icons.call,
                      color: Colors.green,
                      size: 30,
                    ),
                  ),
                  IconButton(
                    onPressed: () => _launchSMS(number),
                    icon: const Icon(
                      Icons.sms,
                      color: Colors.orange,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTipCard(String emoji, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: colorB,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 20)),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 15, color: colorE, height: 1.4),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFallbackHelp() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorA.withOpacity(0.2),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "📵 What if I can’t call or text?",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: colorD,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "- Try asking someone nearby like a friend, family member, or neighbor.\n"
            "- Go to a safe place: a clinic, library, or someone you trust.\n"
            "- Focus on calming yourself for a few minutes using the tips above.\n"
            "- Remember: This moment will pass - you are not alone.",
            style: TextStyle(color: colorE, fontSize: 16, height: 1.5),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: colorB,
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
        //automaticallyImplyLeading: false, // This removes the back arrow
      ),
      // appBar: AppBar(
      //   backgroundColor: colorB,
      //   elevation: 0,
      //   title: const Text('Crisis Resources', style: TextStyle(color: colorD)),
      //   iconTheme: const IconThemeData(color: colorD),
      // ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "You are not alone.",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: colorE,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              "Fast help is available. Use any of the tools below.",
              style: TextStyle(fontSize: 17, color: colorE),
            ),
            const SizedBox(height: 30),
            const Text(
              "Urgent Contacts",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: colorD,
              ),
            ),
            //const SizedBox(height: 12),
            for (var hotline in hotlines)
              _buildHotlineCard(hotline['name']!, hotline['number']!),
            const SizedBox(height: 12),
            _buildFallbackHelp(),
            const SizedBox(height: 35),
            const Text(
              "Quick Calming Tips",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: colorD,
              ),
            ),
            const SizedBox(height: 6),
            for (var tip in calmingTips)
              _buildTipCard(tip['emoji']!, tip['tip']!),
            //_buildFallbackHelp(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
