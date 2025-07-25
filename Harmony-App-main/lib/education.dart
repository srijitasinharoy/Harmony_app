import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EducationScreen extends StatelessWidget {
  const EducationScreen({super.key});

  final List<Map<String, String>> educationTopics = const [
    {
      "image": "yes.png",
      "title": "What is consent | Why is it needed",
      "driveLink":
          "https://drive.google.com/file/d/1ahIZRNQqUFcL2OzKWV-yGFWTsA1hTX72/view?usp=drive_link",
      "quizLink": "https://forms.gle/G4XkCbkZU9jEP4Dj8"
    },
    {
      "image": "hygiene.png",
      "title": "Importance of reproductive hygiene",
      "driveLink":
          "https://drive.google.com/file/d/1fQY1YjSseQQdltJj5yoz0gQs6ldLDTpu/view?usp=drive_link",
      "quizLink": "https://forms.gle/fuYeMPwNoS3BVGxB6"
    },
    {
      "image": "education.png",
      "title": "Lessons on finance education",
      "driveLink":
          "https://drive.google.com/file/d/1DWRfqYDsSmxsJEyxK8wMRSA5RCy7_Ysq/view?usp=drive_link",
      "quizLink": "https://forms.gle/Mt4yAR46Lp7ZfuSQ7"
    },
    {
      "image": "pcos.png",
      "title": "What is PCOS?",
      "driveLink":
          "https://drive.google.com/file/d/16CpGcpMdFRa47RhY20XiTJR5E2JnZyqV/view?usp=drive_link",
      "quizLink": "https://forms.gle/1EHRSCqg1cFqtJva8"
    },
  ];

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

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
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView.builder(
          itemCount: educationTopics.length,
          itemBuilder: (context, index) {
            final topic = educationTopics[index];
            return EducationCard(
              image: topic["image"]!,
              title: topic["title"]!,
              articleUrl: topic["driveLink"]!,
              quizUrl: topic["quizLink"]!,
              onTapArticle: () => _launchURL(topic["driveLink"]!),
              onTapQuiz: () => _launchURL(topic["quizLink"]!),
            );
          },
        ),
      ),
    );
  }
}

class EducationCard extends StatelessWidget {
  final String image;
  final String title;
  final String articleUrl;
  final String quizUrl;
  final VoidCallback onTapArticle;
  final VoidCallback onTapQuiz;

  const EducationCard({
    super.key,
    required this.image,
    required this.title,
    required this.articleUrl,
    required this.quizUrl,
    required this.onTapArticle,
    required this.onTapQuiz,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: GestureDetector(
              onTap: onTapArticle,
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 25),
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Check your progress",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 5),
                  GestureDetector(
                    onTap: onTapQuiz,
                    child: const Text(
                      "Take quiz",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}