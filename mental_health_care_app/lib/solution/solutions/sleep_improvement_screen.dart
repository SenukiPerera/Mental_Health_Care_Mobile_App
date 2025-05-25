import 'package:flutter/material.dart';
import 'package:mental_health_care_app/solution/constants/colors.dart';

class SleepImprovementScreen extends StatefulWidget {
  const SleepImprovementScreen({super.key});

  @override
  State<SleepImprovementScreen> createState() => _SleepImprovementScreenState();
}

class _SleepImprovementScreenState extends State<SleepImprovementScreen>
    with TickerProviderStateMixin {
  TimeOfDay? bedtime;
  TimeOfDay? wakeTime;
  double? calculatedSleepHours;
  String tipMessage = '';
  String goalMessage = '';
  Color tipColor = Colors.grey;
  List<String> detailedTips = [];
  List<bool> checklistStates = [false, false, false, false, false];
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> selectTime({required bool isBedtime}) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: colorA,
              onSurface: colorE,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        if (isBedtime) {
          bedtime = picked;
        } else {
          wakeTime = picked;
        }
        calculateSleepDuration();
      });
    }
  }

  void calculateSleepDuration() {
    if (bedtime == null || wakeTime == null) return;

    final now = DateTime.now();
    final bed = DateTime(
      now.year,
      now.month,
      now.day,
      bedtime!.hour,
      bedtime!.minute,
    );
    DateTime wake = DateTime(
      now.year,
      now.month,
      now.day,
      wakeTime!.hour,
      wakeTime!.minute,
    );

    if (wake.isBefore(bed)) {
      wake = wake.add(const Duration(days: 1));
    }

    final duration = wake.difference(bed);
    final hours = duration.inMinutes / 60.0;

    setState(() {
      calculatedSleepHours = hours;

      if (hours < 3) {
        tipColor = const Color(0xFFE74C3C);
        tipMessage =
            "Severely sleep-deprived! Let's work on increasing your sleep.";
        goalMessage = "Try to reach at least 4–5 hours consistently this week.";
        detailedTips = [
          "Set a fixed bedtime and wake-up time, even on weekends.",
          "Avoid screens, sugar, and caffeine before bed.",
          "Add 30–60 mins more sleep each night.",
          "Try power naps (max 20 mins) if needed.",
          "Create a relaxing bedtime routine (music, breathing).",
        ];
      } else if (hours >= 3 && hours < 5) {
        tipColor = const Color(0xFFE67E22);
        tipMessage = "Too little sleep! Try to rest more.";
        goalMessage = "Aim for 6 hours per night next.";
        detailedTips = [
          "Avoid screens at least 30 minutes before bed.",
          "Avoid caffeine after 2pm.",
          "Practice deep breathing or meditation.",
          "Sleep and wake at the same time every day.",
          "Make your sleep space quiet and dark.",
        ];
      } else if (hours >= 5 && hours < 6) {
        tipColor = const Color(0xFFF39C12);
        tipMessage = "You're improving, but still not enough sleep.";
        goalMessage = "Step up to 6.5 hours of sleep per night.";
        detailedTips = [
          "Get sunlight early in the day to reset your body clock.",
          "Avoid eating 2 hours before sleep.",
          "Try light exercise like walking.",
          "Keep electronics out of the bedroom.",
          "Track your sleep time and energy levels.",
        ];
      } else if (hours >= 6 && hours < 7.5) {
        tipColor = const Color(0xFFF1C40F);
        tipMessage = "You're doing okay, but there's room to improve.";
        goalMessage = "Aim for consistent 6.5 to 7 hours every night.";
        detailedTips = [
          "Stick to a regular sleep schedule.",
          "Avoid heavy meals close to bedtime.",
          "Use your bed only for sleep.",
          "Dim the lights 1 hour before bed.",
          "Limit naps during the day.",
        ];
      } else if (hours >= 7.5 && hours <= 9) {
        tipColor = const Color(0xFF27AE60);
        tipMessage = "Great sleep hygiene!";
        goalMessage = "Maintain this healthy 7–9 hour sleep range.";
        detailedTips = [
          "Keep your sleep and wake times consistent.",
          "Maintain a cool, dark sleep environment.",
          "Use relaxing sounds or white noise.",
          "Daily movement helps deepen sleep.",
          "Write in a journal to reduce stress at night.",
        ];
      } else {
        tipColor = colorA;
        tipMessage = "You're sleeping a lot – check your energy and mood.";
        goalMessage = "Gradually reduce to 7–8 hours if you feel oversleeping.";
        detailedTips = [
          "Too much sleep may be from stress or low energy.",
          "Avoid staying in bed when you're not sleeping.",
          "Be active during the day to reset your rhythm.",
          "Wake up 15–30 minutes earlier each week.",
          "Talk to a doctor if you're always tired after long sleep.",
        ];
      }
      _animationController.forward();
    });
  }

  Widget _buildTimePickerCard({
    required String title,
    required IconData icon,
    required TimeOfDay? time,
    required VoidCallback onTap,
    required Color accentColor,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 120,
          margin: const EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            color: colorA.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 32,
                color: accentColor,
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: colorE,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                time?.format(context) ?? "Select Time",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: time != null ? colorE : colorD,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSleepSummaryCard() {
    if (calculatedSleepHours == null) return const SizedBox.shrink();

    return FadeTransition(
      opacity: _fadeAnimation,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: colorA.withOpacity(0.1),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: colorB,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: tipColor, width: 1),
                    ),
                    child: Icon(
                      Icons.nightlight_round,
                      color: tipColor,
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Sleep Duration",
                          style: TextStyle(
                            fontSize: 16,
                            color: colorD,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "${calculatedSleepHours!.toStringAsFixed(1)} hours",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: colorE,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: colorB,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.lightbulb_outline,
                          color: tipColor,
                          size: 22,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "Assessment",
                          style: TextStyle(
                            color: tipColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      tipMessage,
                      style: TextStyle(
                        color: colorE,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      goalMessage,
                      style: TextStyle(
                        color: colorD,
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTipsSection() {
    if (detailedTips.isEmpty) return const SizedBox.shrink();

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: colorA.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
        ),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          childrenPadding: const EdgeInsets.only(bottom: 16),
          title: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: colorC.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.tips_and_updates,
                  color: colorC,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                "Personalized Sleep Tips",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: colorE,
                ),
              ),
            ],
          ),
          initiallyExpanded: true,
          children: detailedTips
              .asMap()
              .map(
                (index, tip) => MapEntry(
                  index,
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 4,
                    ),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: colorB.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            color: tipColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(
                              '${index + 1}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            tip,
                            style: TextStyle(
                              fontSize: 15,
                              color: colorE,
                              height: 1.4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
              .values
              .toList(),
        ),
      ),
    );
  }

  Widget _buildMotivationalQuote() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colorC.withOpacity(0.1),
            colorA.withOpacity(0.05),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.format_quote,
                color: colorC,
                size: 24,
              ),
              const SizedBox(width: 8),
              Text(
                "Daily Inspiration",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: colorE,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            "\"A good laugh and a long sleep are the two best cures for anything.\"",
            style: TextStyle(
              fontSize: 16,
              fontStyle: FontStyle.italic,
              color: colorE.withOpacity(0.8),
              height: 1.5,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "— Irish Proverb",
            style: TextStyle(
              fontSize: 14,
              color: colorC,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBedtimeChecklist() {
    final checklistItems = [
      "Turn off screens 30 min before bed",
      "Brush your teeth",
      "Read or meditate for 10 minutes",
      "Prepare tomorrow's tasks",
      "Lights out at set time",
    ];

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: colorA.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey.withOpacity(0.1),
        //     blurRadius: 15,
        //     offset: const Offset(0, 5),
        //   ),
        // ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: colorA.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.checklist,
                    color: colorA,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  "Bedtime Routine Checklist",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: colorE,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ...checklistItems
                .asMap()
                .map(
                  (index, item) => MapEntry(
                    index,
                    CheckboxListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        item,
                        style: TextStyle(
                          fontSize: 15,
                          color: colorE,
                          decoration: checklistStates[index]
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                      value: checklistStates[index],
                      onChanged: (value) {
                        setState(() {
                          checklistStates[index] = value ?? false;
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: colorA,
                      checkColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                )
                .values,
          ],
        ),
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
          'Sleep Improvement',
          style: TextStyle(color: colorA, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: colorA, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              Text(
                "Track Your Sleep Schedule",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: colorE,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Set your bedtime and wake time to get personalized insights",
                style: TextStyle(
                  fontSize: 16,
                  color: colorE.withOpacity(0.6),
                ),
              ),
              const SizedBox(height: 30),

              // Time Picker Cards
              Row(
                children: [
                  _buildTimePickerCard(
                    title: "Bedtime",
                    icon: Icons.bedtime,
                    time: bedtime,
                    onTap: () => selectTime(isBedtime: true),
                    accentColor: colorC,
                  ),
                  _buildTimePickerCard(
                    title: "Wake Time",
                    icon: Icons.wb_sunny,
                    time: wakeTime,
                    onTap: () => selectTime(isBedtime: false),
                    accentColor: colorA,
                  ),
                ],
              ),

              // Sleep Summary Card
              _buildSleepSummaryCard(),

              // Tips Section
              _buildTipsSection(),

              // Motivational Quote
              _buildMotivationalQuote(),

              // Bedtime Checklist
              _buildBedtimeChecklist(),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
