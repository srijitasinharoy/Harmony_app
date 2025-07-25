import 'package:flutter/material.dart';
import 'chatbot.dart';
import 'community1.dart';
import 'menstrual_tracker.dart';
import 'education.dart';
import 'laws.dart';
import 'setup_page.dart';

void main() {
  runApp(Homepage());
}

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Body Content with Background Image
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'home_bg.png',
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 100.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  Text(
                    "Welcome!",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  SizedBox(height: 1),
                  Column(
                    children: [
                      Icon(Icons.format_quote, size: 30, color: Colors.white70),
                      Text(
                        "I raise up my voice—not so that I can shout, but so that those without a voice can be heard.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "~ Malala Yousafzai",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(179, 0, 0, 0)),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        FeatureButton(
                          title: "Menstrual Tracker",
                          icon: const Icon(Icons.calendar_today, color: Colors.white),
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MenstrualTrackerScreen()),
                          ),
                        ),
                        FeatureButton(
                          title: "Community",
                          icon: const Icon(Icons.group, color: Colors.white),
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CommunityPage()),
                          ),
                        ),
                        FeatureButton(
                          title: "Know your rights",
                          icon: const Icon(Icons.info, color: Colors.white),
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => KnowYourRightsScreen()),
                          ),
                        ),
                        FeatureButton(
                          title: "Education",
                          icon: const Icon(Icons.school, color: Colors.white),
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const EducationScreen()),
                            )
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      // Floating Action Button to Chat with Astha
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ChatScreen()),
          );
        },
        backgroundColor: Colors.purple,
        label: const Text(
          'Talk to Astha',
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        icon: const Icon(Icons.chat, color: Colors.white),
      ),
    );
  }
}

// Feature Button Widget
class FeatureButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Icon icon;
  
  const FeatureButton({
    super.key,
    required this.title,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.purple.withOpacity(0.8),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}