import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:mental_health_care_app/solution/constants/colors.dart';

class MindfulnessPage extends StatefulWidget {
  const MindfulnessPage({super.key});

  @override
  State<MindfulnessPage> createState() => _MindfulnessPageState();
}

class _MindfulnessPageState extends State<MindfulnessPage>
    with SingleTickerProviderStateMixin {
  bool sessionStarted = false;
  int countdown = 3;
  bool breathingActive = false;
  int sessionTime = 60;
  String breathingText = "Ready?";
  bool sessionCompleted = false;
  bool sessionStarting = false; // NEW: Tracks session countdown stage

  Timer? countdownTimer;
  Timer? sessionTimer;

  double circleSize = 300;
  Duration currentPhaseDuration = const Duration(seconds: 4);

  final AudioPlayer _audioPlayer = AudioPlayer();
  List<String> playlist = [
    'assets/music/abc.mp3',
    'assets/music/abcd.mp3',
    'assets/music/abcde.mp3',
  ];

  int currentTrackIndex = 1;
  bool userDecidedOnMusic = false;
  bool musicEnabled = false;
  bool isMuted = false;
  bool isPlaying = false;
  bool loop = true;

  bool showSuccessAnimation = false;
  late AnimationController successAnimationController;
  late Animation<double> fadeAnimation;

  @override
  void initState() {
    super.initState();
    successAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    fadeAnimation = CurvedAnimation(
      parent: successAnimationController,
      curve: Curves.easeIn,
    );
  }

  @override
  void dispose() {
    countdownTimer?.cancel();
    sessionTimer?.cancel();
    _audioPlayer.dispose();
    successAnimationController.dispose();
    super.dispose();
  }

  bool isSessionCompleted() => sessionCompleted;

  Future<void> startSession() async {
    if (!userDecidedOnMusic) {
      bool? choice = await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: colorB,
          title: const Text(
            "Play Calm Music?",
            style: TextStyle(
              fontSize: 25,
              color: colorE,
              fontWeight: FontWeight.w500,
            ),
          ),
          content: const Text(
            "Would you like to play relaxing music during your session?",
            style: TextStyle(fontSize: 18, color: colorD),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text("No",
                  style: TextStyle(fontSize: 18, color: colorC)),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text("Yes",
                  style: TextStyle(fontSize: 18, color: colorC)),
            ),
          ],
        ),
      );

      userDecidedOnMusic = true;
      musicEnabled = choice ?? false;

      if (musicEnabled) await playMusic(currentTrackIndex);
    } else if (musicEnabled) {
      await _audioPlayer.resume();
    }

    setState(() {
      countdown = 3;
      sessionStarted = true;
      sessionStarting = true;
      breathingText = "Get Ready...";
      sessionCompleted = false;
      showSuccessAnimation = false;
    });

    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (countdown > 1) {
          countdown--;
        } else {
          countdownTimer?.cancel();
          sessionStarting = false;
          startBreathingCycle();
          breathingActive = true;
        }
      });
    });
  }

  Future<void> playMusic(int index) async {
    currentTrackIndex = index;
    await _audioPlayer
        .setSource(AssetSource(playlist[index].replaceFirst('assets/', '')));
    await _audioPlayer
        .setReleaseMode(loop ? ReleaseMode.loop : ReleaseMode.stop);
    await _audioPlayer.setVolume(isMuted ? 0 : 0.5);
    await _audioPlayer.resume();
    setState(() => isPlaying = true);
  }

  void startBreathingCycle() {
    int elapsedTime = 0;
    sessionTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (elapsedTime >= sessionTime) {
        sessionTimer?.cancel();
        breathingActive = false;
        sessionCompleted = true;
        sessionStarted = false;
        _audioPlayer.pause();
        setState(() {
          breathingText = "Session Completed!";
          circleSize = 0;
          showSuccessAnimation = true;
          isPlaying = false; // NEW: update player button state
        });
        successAnimationController.forward();
        return;
      }

      setState(() {
        breathingText = getBreathingPhase(elapsedTime);
      });

      elapsedTime++;
    });
  }

  String getBreathingPhase(int seconds) {
    int phase = seconds % 12;
    if (phase < 4) {
      updateCircle(500, const Duration(seconds: 4));
      return "Breathe In";
    } else if (phase < 6) {
      updateCircle(500, const Duration(seconds: 2));
      return "Hold";
    } else if (phase < 10) {
      updateCircle(300, const Duration(seconds: 4));
      return "Breathe Out";
    } else {
      updateCircle(300, const Duration(seconds: 2));
      return "Rest";
    }
  }

  void updateCircle(double size, Duration duration) {
    if (!sessionStarted) return;
    setState(() {
      circleSize = size;
      currentPhaseDuration = duration;
    });
  }

  void stopSession() {
    countdownTimer?.cancel();
    sessionTimer?.cancel();
    _audioPlayer.pause();
    setState(() {
      breathingText = "Session Ended.";
      breathingActive = false;
      sessionStarted = false;
      sessionStarting = false;
      circleSize = 350;
      isPlaying = false;
      sessionCompleted = false;
      showSuccessAnimation = false;
    });
  }

  void resetSession() {
    setState(() {
      breathingText = "Ready?";
      sessionCompleted = false;
      sessionStarted = false;
      sessionStarting = false;
      circleSize = 300;
      showSuccessAnimation = false;
      successAnimationController.reset();
    });
  }

  void togglePlayPause() {
    if (isSessionCompleted()) return; // prevent toggling after session ends

    if (isPlaying) {
      _audioPlayer.pause();
    } else {
      _audioPlayer.resume();
    }
    setState(() => isPlaying = !isPlaying);
  }

  void nextTrack() {
    int next = (currentTrackIndex + 1) % playlist.length;
    playMusic(next);
  }

  void prevTrack() {
    int prev = (currentTrackIndex - 1 + playlist.length) % playlist.length;
    playMusic(prev);
  }

  void toggleLoop() {
    setState(() => loop = !loop);
    _audioPlayer.setReleaseMode(loop ? ReleaseMode.loop : ReleaseMode.stop);
  }

  void toggleMute() {
    setState(() => isMuted = !isMuted);
    _audioPlayer.setVolume(isMuted ? 0.0 : 0.5);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Mindfulness & Breathing',
          style: TextStyle(color: colorA, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: colorA, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, colorC.withOpacity(0.01)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Breathing exercise for stress",
                  style: TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold, color: colorE),
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                "This calming breathing technique for stress, anxiety and panic takes just a few seconds and can be done anywhere.",
                style: TextStyle(fontSize: 18, color: colorD),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      AnimatedContainer(
                        duration: currentPhaseDuration,
                        width: circleSize,
                        height: circleSize,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: colorA.withOpacity(0.3),
                        ),
                      ),
                      if (showSuccessAnimation)
                        FadeTransition(
                          opacity: fadeAnimation,
                          child: const Icon(
                            Icons.check_circle,
                            color: Colors.green,
                            size: 100,
                          ),
                        ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            sessionStarting
                                ? countdown.toString()
                                : breathingText,
                            style: const TextStyle(
                                fontSize: 40, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 40),
                          ElevatedButton(
                            onPressed: () {
                              if (isSessionCompleted()) {
                                resetSession();
                              } else if (sessionStarted && breathingActive) {
                                stopSession();
                              } else if (!sessionStarted) {
                                startSession();
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 16),
                              backgroundColor: colorA,
                            ),
                            child: Text(
                              isSessionCompleted()
                                  ? "Session Completed"
                                  : sessionStarting
                                      ? "Starting Session..."
                                      : sessionStarted && breathingActive
                                          ? "End Session"
                                          : "Start Session",
                              style:
                                  const TextStyle(fontSize: 18, color: colorB),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              if (musicEnabled)
                Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 80),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: colorA.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      const Text("Now Playing: Calm Track",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                              onPressed: prevTrack,
                              icon: const Icon(Icons.skip_previous)),
                          IconButton(
                            onPressed: togglePlayPause,
                            icon: Icon(
                              isSessionCompleted()
                                  ? Icons
                                      .pause // Lock icon state when session done
                                  : isPlaying
                                      ? Icons.pause
                                      : Icons.play_arrow,
                            ),
                          ),
                          IconButton(
                              onPressed: nextTrack,
                              icon: const Icon(Icons.skip_next)),
                          IconButton(
                            onPressed: toggleMute,
                            icon: Icon(
                                isMuted ? Icons.volume_off : Icons.volume_up),
                          ),
                          IconButton(
                            onPressed: toggleLoop,
                            icon: Icon(loop ? Icons.repeat_one : Icons.repeat),
                          ),
                        ],
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
}
