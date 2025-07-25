import 'package:flutter/material.dart';

class MenstrualPhaseScreen extends StatelessWidget {
  const MenstrualPhaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ), // Light background
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 20),

              // Header Section - Date & Phase
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.pink[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    const Text(
                      "4th March 2025",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    RichText(
                      text: const TextSpan(
                        text: "Day 5 of your luteal phase",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                        children: [
                         
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Symptoms Section
              const Text(
                "Physical symptoms you might have:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  symptomButton("Mild pelvic pain"),
                  symptomButton("Breast tenderness"),
                  symptomButton("Increased vaginal discharge"),
                  symptomButton("Mild bloating"),
                  symptomButton("Higher sex drive"),
                ],
              ),

              const SizedBox(height: 20),

              // Log Other Symptoms & Track Mood Buttons
              const Text(
                "Do you have any other symptoms?",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(child: logSymptomsButton(context)),
                  const SizedBox(width: 10),
                ],
              ),

              const SizedBox(height: 30),

              // Education Section
              const Text(
                "Know more about your phase!",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              Row(
                children: [
                  educationCard("ovulation.png", "What is ovulation?", context,
                      width: 200, height: 200),
                  const SizedBox(width: 15),
                  educationCard("pain.png", "Is ovulation painful?", context,
                      width: 200, height: 200),
                ],
              ),

              const SizedBox(height: 80), // Space for bottom navigation
            ],
          ),
        ),
      ),
    );
  }

  // Symptom Selection Button Widget
  Widget symptomButton(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.pink[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  // Log Symptoms Button
  Widget logSymptomsButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Future Navigation for Log Symptoms
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.pink[300],
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Center(
          child: Text(
            "Log Here",
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }

  // Education Section Card Widget
  Widget educationCard(String imagePath, String title, BuildContext context,
      {double? width, double? height}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.pink[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Image.asset(imagePath, width: width, height: height),
            const SizedBox(height: 10),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  foregroundColor: Colors.white),
              child: const Text("Play Video"),
            ),
            const SizedBox(height: 5),
            TextButton(
              onPressed: () {},
              child: const Text("Read here"),
            ),
          ],
        ),
      ),
    );
  }
}

class MoodTrackerScreen extends StatelessWidget {
  // Mood options with emoji, label, color, and description
  final List<Map<String, dynamic>> moods = [
    {
      "emoji": "🤩",
      "label": "Excited",
      "color": Colors.green[700],
      "description": """
You are full of energy and enthusiasm today! Keep shining! ✨
      \nHere are some things you can do:\n
      \u2605 Channel the energy into something productive (e.g., a project, workout, or creative task).
      \u2605 Pace yourself so you do not burn out or get overwhelmed.
      \u2605 Share the excitement with someone who will hype you up.
      \u2605 Turn it into action—make a plan if it is about an opportunity.
      \u2605 Enjoy the moment and let yourself fully experience the thrill.
      """
    },
    {
      "emoji": "😁",
      "label": "Happy",
      "color": Colors.green,
      "description": """
You're feeling good and positive. Enjoy your day! 🌈
      \nHere are some things you can do:\n
      \u2605 Celebrate it! Write down what made you happy today.
      \u2605 Share the joy.
      \u2605 with a friend, partner, or social media.
      \u2605 Do something fun to keep the momentum going (e.g., music, a hobby, a treat).
      \u2605 Express gratitude by journaling or thanking someone.
      \u2605 Anchor the feeling remember what contributed to it for future reference."""
    },
    {
      "emoji": "😐",
      "label": "Neutral",
      "color": Colors.yellow,
      "description": """
You're feeling just okay. Take it easy and go with the flow. 🌿
      \nHere are some things you can do:\n
      \u2605 Check in with yourself - Is there something you're ignoring?
      \u2605 Try something new, to break the routine (small or big changes).
      \u2605 Embrace the calm, Not every day needs to be intense.
      \u2605 Reflect on what’s working; Neutral can be a sign of balance.
      \u2605Engage in mindfulness
      \u2605 Deep breaths, meditation, a nature walk."""
    },
    {
      "emoji": "😔",
      "label": "Sad",
      "color": Colors.orange,
      "description": """
It's okay to feel low sometimes. Be kind to yourself. 💙
      \nHere are some things you can do:\n
      \u2605 Acknowledge your feelings instead of suppressing them.
      \u2605 Comfort yourself — watch a favorite movie, listen to music, or cuddle up.
      \u2605 Reach out to someoneyou trust for support.
      \u2605 Do something small that feels manageable (a short walk, a warm drink).
      \u2605 Remind yourself that feelings are temporary and will pass."""
    },
    {
      "emoji": "😰",
      "label": "Anxious",
      "color": Colors.red,
      "description": """
Feeling worried or overwhelmed? Take a deep breath, you've got this! 💪
      \nHere are some things you can do:\n
 "    \u2605 Pause and breathe", "—try deep breathing exercises.
      \u2605 Write down your worries to get them out of your head.
      \u2605 Move your body - stretching, walking, or a short workout can help).
      \u2605 Ground yourself using the 5-4-3-2-1 method (name things you see, hear, etc.).
      \u2605 Do a calming activity like journaling, coloring, or listening to soft music."""
    },
  ];

  MoodTrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Background color
      body: Column(
        children: [
          // ========================== TOP BAR ==========================

          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            decoration: BoxDecoration(
              color: Colors.pink[50], // Light pink background
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.menu, color: Colors.purple, size: 30), // Menu icon
                Image.asset('logo.png', height: 40), // Lotus logo
                CircleAvatar(
                  backgroundColor: Colors.purple,
                  child: Icon(Icons.person, color: Colors.white),
                ), // Profile Icon
              ],
            ),
          ),

          SizedBox(height: 20),

          // ======================= MOOD HEADER ========================
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.purple[900], // Dark Purple Background
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                "How are you feeling today?",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          SizedBox(height: 20),

          // ======================= MOOD OPTIONS =======================
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemCount: moods.length,
              itemBuilder: (context, index) {
                final mood = moods[index];
                return GestureDetector(
                  onTap: () {
                    // Show Popup Dialog when mood is selected
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        title: Row(
                          children: [
                            Text(mood["emoji"],
                                style: TextStyle(fontSize: 28)), // Emoji
                            SizedBox(width: 10),
                            Text(
                              mood["label"],
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        content: Text(
                          mood["description"],
                          style: TextStyle(fontSize: 16),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text("OK",
                                style: TextStyle(color: Colors.purple)),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 6),
                    padding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                    decoration: BoxDecoration(
                      color: mood["color"],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Text(mood["emoji"],
                            style: TextStyle(fontSize: 24)), // Emoji
                        SizedBox(width: 12),
                        Text(
                          mood["label"],
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
