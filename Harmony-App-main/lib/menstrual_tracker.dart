import 'package:flutter/material.dart';
import 'mood_tracker.dart';
import 'symptomps.dart';
import 'period_date.dart';

class MenstrualTrackerScreen extends StatelessWidget {
  const MenstrualTrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.purple),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
            const SizedBox(height: 16),

            // Calendar Strip
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                  7,
                  (index) => Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: index == 6
                                ? Colors.purple
                                : Colors.grey.shade200,
                            child: Text((9 + index).toString(),
                                style: TextStyle(
                                    color: index == 6
                                        ? Colors.white
                                        : Colors.black)),
                          ),
                          Text(
                              [
                                'Sun',
                                'Mon',
                                'Tue',
                                'Wed',
                                'Thu',
                                'Fri',
                                'Sat'
                              ][index],
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.purple)),
                        ],
                      )),
            ),
            const SizedBox(height: 35),

            // Date and Phase Information
            Center(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.purple[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text("4th March 2025",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Text("Day 5 of your luteal phase",
                        style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute
                      (builder: (context) => MoodScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple[300]),
                  child: const Text("Track your mood",
                      style: TextStyle(color: Colors.white)),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute
                      (builder: (context) => EditMenstruationDateScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple[300]),
                  child:
                      const Text("Edit Date", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Informational Section
            const Text(
              "Want to know more about your phase?",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MenstrualPhaseScreen()),
                );
              },
              child: const Text("Click here to learn more",
                  style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                      fontSize: 20)),
            ),
            const SizedBox(height: 16),

            // Video Cards
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: const [
                    InfoCard(
                        title: "Tips to reduce cramps during periods",
                        image: Icons.video_library),
                    InfoCard(
                        title: "Why do we need to exercise regularly?",
                        image: Icons.video_library),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final IconData image;
  const InfoCard({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.purple[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(image, size: 10, color: Colors.purple),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          TextButton(onPressed: () {}, child: const Text("Play Video")),
        ],
      ),
    );
  }
}