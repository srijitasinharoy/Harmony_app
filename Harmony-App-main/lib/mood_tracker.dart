import 'package:flutter/material.dart';

class MoodScreen extends StatelessWidget {
  // Mood options with emoji, label, color, and description
  final List<Map<String, dynamic>> moods = [
    {
      "emoji": "😃",
      "label": "Excited",
      "color": Colors.green[700],
      "description": """ 
You are full of energy and enthusiasm today! Keep shining!  
\nHere are some things you can do:\n 
★ Channel the energy into something productive (e.g., a project, workout, or creative task). 
★ Pace yourself so you do not burn out or get overwhelmed.
★ Share the excitement with someone who will hype you up. 
★ Turn it into action—make a plan if it is about an opportunity. 
★ Enjoy the moment and let yourself fully experience the thrill. 
"""
    },
    {
      "emoji": "😊",
      "label": "Happy",
      "color": Colors.green,
      "description": """ 
You're feeling good and positive. Enjoy your day!  
\nHere are some things you can do:\n 
★ Celebrate it! Write down what made you happy today. 
★ Share the joy with a friend, partner, or social media. 
★ Do something fun to keep the momentum going (e.g., music, a hobby, a treat). 
★ Express gratitude by journaling or thanking someone. 
★ Anchor the feeling remember what contributed to it for future reference."""
    },
    {
      "emoji": "😐",
      "label": "Neutral", 
      "color": Colors.yellow,
      "description": """ 
You're feeling just okay. Take it easy and go with the flow.  
\nHere are some things you can do:\n 
★ Check in with yourself - Is there something you're ignoring? 
★ Try something new, to break the routine (small or big changes). 
★ Embrace the calm, Not every day needs to be intense. 
★ Reflect on what's working; Neutral can be a sign of balance. 
★ Engage in mindfulness - Deep breaths, meditation, a nature walk."""
    },
    { 
      "emoji": "😔", 
      "label": "Sad",
      "color": Colors.orange,
      "description": """ 
It's okay to feel low sometimes. Be kind to yourself.  
\nHere are some things you can do:\n 
★ Acknowledge your feelings instead of suppressing them.
★ Comfort yourself — watch a favorite movie, listen to music, or cuddle up. 
★ Reach out to someone you trust for support. 
★ Do something small that feels manageable (a short walk, a warm drink). 
★ Remind yourself that feelings are temporary and will pass."""
    },
    { 
      "emoji": "😟", 
      "label": "Anxious",
      "color": Colors.red,
      "description": """ 
Feeling worried or overwhelmed? Take a deep breath, you've got this!  
\nHere are some things you can do:\n 
★ Pause and breathe—try deep breathing exercises.
★ Write down your worries to get them out of your head. 
★ Move your body - stretching, walking, or a short workout can help). 
★ Ground yourself using the 5-4-3-2-1 method (name things you see, hear, etc.). 
★ Do a calming activity like journaling, coloring, or listening to soft music."""
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.purple),
          onPressed: () => Navigator.pop(context),
        ),
        
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          // ======================= MOOD HEADER ========================
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.purple[900],
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
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        title: Row(
                          children: [
                            Text(mood["emoji"], style: TextStyle(fontSize: 28)),
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
                            child: Text("OK", style: TextStyle(color: Colors.purple)),
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
                        Text(mood["emoji"], style: TextStyle(fontSize: 24)),
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