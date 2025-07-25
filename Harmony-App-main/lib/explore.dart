import 'package:flutter/material.dart';

void main() {
  runApp(const CommunityApp());
}

class CommunityApp extends StatelessWidget {
  const CommunityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ExploreCommunityScreen(),
    );
  }
}


class ExploreCommunityScreen extends StatelessWidget {
  // List of community categories
  final List<Map<String, String>> communityCategories = [
    {
      "label": "Yoga",
      "image": "yoga.png",
      "description":
          """Join a community of yoga enthusiasts and improve your well-being.
      \nYoga, an ancient Indian practice, harmonizes the mind, body, and soul through physical postures (asanas), breathing techniques (pranayama), and meditation.
\u2605 Physical Benefits:
Yoga enhances flexibility, strengthens muscles, improves posture, and boosts immunity. It also helps manage chronic pain and promotes better circulation.
\u2605 Mental and Emotional Benefits:
Yoga reduces stress, anxiety, and depression by calming the mind and fostering emotional balance. It improves focus, concentration, and mental clarity.
\u2605 Why Yoga is Necessary:
In today’s hectic lifestyle, stress, poor posture, and unhealthy habits lead to various health issues. Yoga provides a natural and effective solution to combat these problems. It helps manage lifestyle diseases such as hypertension and diabetes while promoting better sleep and increased energy levels. Incorporating yoga into daily life ensures a balanced, healthier, and more peaceful existence."""
    },
    {
      "label": "Swimming",
      "image": "swimming.png",
      "description": """Find swimming clubs and training groups in your area.
      Swimming is a full-body exercise that offers numerous physical, mental, and emotional benefits. It engages all major muscle groups, improving strength, flexibility, and cardiovascular health.
\u2605 Physical Benefits:
Swimming enhances stamina, promotes heart health, and aids in weight management. It improves lung capacity, boosts endurance, and increases overall fitness. Being a low-impact activity, it is gentle on joints, making it suitable for people of all ages.
\u2605 Mental and Emotional Benefits:
Swimming reduces stress, anxiety, and depression by promoting relaxation. The rhythmic nature of swimming helps improve focus, mental clarity, and emotional well-being.
\u2605 Why Swimming is Necessary:
In today’s sedentary lifestyle, maintaining physical fitness is crucial. Swimming provides a fun and effective way to stay active while reducing the risk of chronic diseases. It is also a life-saving skill, ensuring safety in water-related situations. Incorporating swimming into daily routines promotes a healthier and more balanced life."""
    },
    {
      "label": "Gardening",
      "image": "gardening.png",
      "description": """Connect with fellow gardeners and grow your green space.
      Gardening is a rewarding activity that promotes physical health, mental well-being, and environmental sustainability. It connects individuals with nature while offering numerous benefits.
\u2605 Physical Benefits:
Gardening involves physical activity that improves strength, flexibility, and cardiovascular health. It helps reduce stress, lowers blood pressure, and boosts immunity.
\u2605 Mental and Emotional Benefits:
Gardening reduces anxiety, depression, and stress by providing a calming and therapeutic environment. It promotes mindfulness, improves focus, and fosters a sense of accomplishment.
\u2605 Why Gardening is Necessary:
In today’s fast-paced world, connecting with nature is essential for maintaining balance. Gardening encourages sustainable living by promoting organic practices and reducing environmental impact. It also provides fresh, chemical-free produce, contributing to a healthier diet. Moreover, gardening instills patience, responsibility, and a sense of nurturing, making it a valuable activity for all age groups. Incorporating gardening into daily life promotes overall well-being and environmental awareness."""
    },
    {
      "label": "Crafting/Drawing",
      "image": "crafting.png",
      "description": """Showcase your creativity and learn new art techniques.
      Crafting and drawing are creative activities that enhance cognitive skills, emotional well-being, and self-expression. They provide an outlet for imagination and artistic exploration.
\u2605 Cognitive and Emotional Benefits:
Crafting and drawing improve hand-eye coordination, fine motor skills, and concentration. They stimulate creative thinking, problem-solving, and patience. These activities also reduce stress, anxiety, and depression by promoting relaxation and focus.
\u2605 Self-Expression and Skill Development:
Drawing and crafting allow individuals to express emotions, thoughts, and ideas visually. They encourage originality, boost confidence, and cultivate a sense of achievement.
\u2605 Why Crafting and Drawing are Necessary:
In a world driven by technology, engaging in creative activities like crafting and drawing helps balance screen time and promotes mindfulness. They provide a productive way to unwind while fostering emotional growth and critical thinking. Incorporating these activities into daily life nurtures creativity, enhances mental health, and enriches overall well-being."""
    },
    {
      "label": "Graphic Design",
      "image": "graphic_design.png",
      "description": """Enhance your design skills and collaborate with others.
      Graphic design is a powerful communication tool that combines creativity, technology, and visual storytelling to convey ideas effectively. It plays a crucial role in shaping perceptions and engaging audiences.
\u2605 Visual Communication and Brand Identity:
Graphic design enhances brand identity by creating visually appealing logos, websites, and advertisements. It helps businesses communicate their message clearly and attract target audiences.
\u2605 Enhances User Experience:
Good design improves user experience by making information easily accessible and engaging. It boosts readability, navigation, and interaction, ensuring a positive impression.
\u2605 Why Graphic Design is Necessary:
In today’s digital era, where visual content dominates, graphic design is essential for standing out in a competitive market. It helps businesses establish credibility, build trust, and convey professionalism. Additionally, graphic design is used in various fields, from education to entertainment, making it a valuable skill for effective communication and innovation."""
    },
    {
      "label": "Makeup/Skincare",
      "image": "makeup.png",
      "description": """Share beauty tips and learn about the latest trends.
      Makeup and skincare play a vital role in enhancing appearance, boosting confidence, and maintaining healthy skin. While skincare focuses on nourishing and protecting the skin, makeup helps highlight features and express individuality.
\u2605 Skincare Benefits:
A proper skincare routine prevents acne, delays signs of aging, and maintains hydration. It protects the skin from environmental damage, promotes a healthy glow, and ensures long-term skin health.
\u2605 Makeup Benefits:
Makeup enhances natural beauty, covers imperfections, and boosts self-confidence. It allows individuals to express creativity and adapt their appearance to different occasions.
\u2605 Why Makeup and Skincare are Necessary:
In today’s environment, where pollution and stress affect skin health, skincare is essential for protection and nourishment. Makeup, when used responsibly, enhances self-expression and promotes confidence. Incorporating both into daily routines helps maintain healthy skin while allowing individuals to embrace their unique beauty."""
    },
    {
      "label": "Baking",
      "image": "baking.png",
      "description": """Join a group of baking enthusiasts and share recipes.
      Baking is a creative and rewarding activity that promotes relaxation, skill development, and healthier eating habits. It blends precision, patience, and artistry, offering numerous benefits.
\u2605 Physical and Mental Benefits:
Baking enhances fine motor skills, improves focus, and encourages creativity. It also serves as a therapeutic activity that reduces stress and promotes mindfulness. The process of measuring, mixing, and decorating engages the mind, offering a sense of accomplishment.
\u2605 Health and Family Bonding:
Baking at home allows control over ingredients, ensuring healthier alternatives to store-bought products. It also fosters family bonding by encouraging shared experiences and creating lasting memories.
\u2605 Why Baking is Necessary:
In today’s fast-paced life, baking provides an opportunity to slow down and engage in a meaningful, enjoyable activity. It promotes healthier choices, encourages creativity, and strengthens relationships, making it a valuable addition to daily routines."""
    },
    {
      "label": "Cooking",
      "image": "cooking.png",
      "description": """Discover new recipes and participate in cooking events.
      Cooking is a fundamental life skill that promotes healthier eating, creativity, and self-sufficiency. It allows individuals to control ingredients, ensuring balanced nutrition and better health.
\u2605 Health Benefits:
Home-cooked meals are generally healthier than processed foods, as they contain fewer additives and preservatives. Cooking promotes mindful eating and helps manage portion sizes, reducing the risk of lifestyle diseases.
\u2605 Emotional and Social Benefits:
Cooking fosters creativity, improves focus, and provides a sense of accomplishment. It also strengthens relationships by bringing families and friends together through shared meals and experiences.
\u2605 Why Cooking is Necessary:
In today’s fast-paced world, where processed foods dominate, cooking ensures healthier, cost-effective, and personalized meals. It empowers individuals to make informed food choices and promotes a balanced lifestyle. Additionally, cooking helps develop patience, discipline, and problem-solving skills, making it an essential practice for overall well-being and self-reliance."""
    },
    {
      "label": "Stitching/Knitting",
      "image": "knitting.png",
      "description":
          """Learn and share stitching, embroidery, and knitting techniques.
          Stitching and knitting are valuable skills that promote creativity, patience, and mindfulness. These activities engage the mind and hands, offering a sense of accomplishment while fostering artistic expression.
\u2605 Cognitive and Emotional Benefits:
Stitching and knitting enhance focus, fine motor skills, and hand-eye coordination. They reduce stress, anxiety, and depression by promoting relaxation and mindfulness. The repetitive motions involved provide a calming effect, improving mental well-being.
\u2605 Practical and Creative Benefits:
These skills enable individuals to create personalized clothing, accessories, and home decor. They also promote sustainability by encouraging the repair and reuse of fabrics, reducing waste.
\u2605 Why Stitching and Knitting are Necessary:
In today’s fast-paced world, engaging in creative and mindful activities like stitching and knitting provides a productive escape from digital distractions. These skills cultivate patience, boost confidence, and encourage self-sufficiency, making them essential for personal growth and sustainable living."""
    },
  ];

  ExploreCommunityScreen({super.key});

  // Function to show the description popup
  void showDescriptionDialog(
      BuildContext context, String title, String description) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title:
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          content: Text(description),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Close", style: TextStyle(color: Colors.blue)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Explore your Community!",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                // Grid layout for categories
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // 3 columns
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 30,
                    childAspectRatio: 0.80, // Adjust to fit image and text
                  ),
                  itemCount: communityCategories.length,
                  itemBuilder: (context, index) {
                    var category = communityCategories[index];
                    return GestureDetector(
                      onTap: () {
                        showDescriptionDialog(
                          context,
                          category['label']!,
                          category['description']!,
                        );
                      },
                      child: Column(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 10,
                                  spreadRadius: 10,
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.all(12),
                            child: Image.asset(
                              category['image']!,
                              width: 40, // Adjust image size
                              height: 40,
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(height: 1),
                          Text(
                            category['label']!,
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}