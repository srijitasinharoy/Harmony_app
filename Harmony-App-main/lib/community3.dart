import 'package:flutter/material.dart';

class InterestSuggestionsPage extends StatelessWidget {
  final List<String> selectedInterests;
  
  InterestSuggestionsPage({
    super.key,
    required this.selectedInterests,
  });

  // Mock data for suggestions - replace with your actual data source
  final Map<String, List<Map<String, dynamic>>> interestSuggestions = {
    'Painting': [
      {'title': 'Watercolor Techniques', 'image': 'paint1.png'},
      {'title': 'Brush Strokes & Beyond: Advanced Techniques', 'image': 'paint2.jpg'},
      {'title': 'Exploring Abstract Art with Oils', 'image': 'paint3.jpg'},
      {'title': 'Portrait Painting: Tips and Tricks', 'image': 'paint4.jpg'},
      {'title': 'Acrylic Art for Beginners', 'image': 'paint5.jpg'}
    ],
    'Craft': [
      {'title': 'Paper Craft Wonders: Origami & Beyond', 'image': 'craft1.png'},
      {'title': 'DIY Home Décor: Easy and Creative Ideas', 'image': 'craft2.jpg'},
      {'title': 'Handmade Gifts for Every Occasion', 'image': 'craft3.jpg'},
      {'title': 'Crafting with Recycled Materials', 'image': 'craft4.jpg'},
      {'title': 'Personalized Art Projects for Kids', 'image': 'craft5.jpg'}

    ],
    'Yoga & Meditation': [
      {'title': 'Morning Yoga Flow', 'image': 'yoga1.png'},
      {'title': 'Sunrise Yoga: Energize Your Mornings', 'image': 'yoga2.jpg'},
      {'title': 'Mindfulness Meditation for Stress Relief', 'image': 'yoga3.jpg'},
      {'title': 'Flex & Flow: Power Yoga Sequences', 'image': 'yoga4.jpg'},
      {'title': 'Breathing Techniques for Inner Peace', 'image': 'yoga5.webp'},
    ],
    'Cooking': [
      
      {'title': 'Healthy Meals in 30 Minutes', 'image': 'cook1.png'},
      {'title': 'Flavor Explosion: Quick & Easy Recipes', 'image': 'cook2.webp'},
      {'title': 'Spice It Up: Exploring Indian Cuisine', 'image': 'cook3.jpg'},
      {'title': 'Cooking with Love: Family-Friendly Recipes', 'image': 'cook4.jpg'},
      {'title': 'Plant-Based Dishes Made Simple', 'image': 'cook5.jpg'},
    ],
    'Baking': [
      {'title': 'Art of Sourdough: From Starter to Loaf', 'image': 'baking1.png'},
      {'title': 'Baking Basics: Cakes, Cookies & More', 'image': 'baking2.jpg'},
      {'title': 'Dessert Delights: Creative Treats', 'image': 'baking3.jpg'},
      {'title': 'Perfect Pastries: Tips from the Pros', 'image': 'baking4.jpg'},
      {'title': 'Gluten-Free Baking Made Easy', 'image': 'baking5.jpg'},

    ],
    'Graphics Designing': [  
      {'title': 'Photoshop Essentials: Design Like a Pro', 'image': 'design1.png'},
      {'title': 'Mastering Canva for Beginners', 'image': 'design2.jpg'},
      {'title': 'Logo Design: From Concept to Creation', 'image': 'design3.png'},
      {'title': 'Typography Techniques for Stunning Designs', 'image': 'design4.jpg'},
      {'title': 'UI/UX Design: Best Practices Explained', 'image': 'design5.jpg'},
    ],
    'Makeup & Skincare': [
      {'title': 'DIY Face Masks for Glowing Skin', 'image': 'makeup1.png'},
      {'title': 'Flawless Skin: The Ultimate Skincare Routine', 'image': 'makeup2.jpg'},
      {'title': 'Evening Glam: Step-by-Step Tutorial', 'image': 'makeup3.jpg'},
      {'title': 'Natural Beauty Hacks You Should Know', 'image': 'makeup4.webp'},
      {'title': 'Everyday Makeup Looks in 10 Minutes', 'image': 'makeup5.jpg'},
    ],
    'Fashion': [
      {'title': 'Sustainable Fashion: Dress with Purpose', 'image': 'fashion1.png'},
      {'title': 'Style Guide: Mixing and Matching Outfits', 'image': 'fashion2.png'},
      {'title': 'Fashion on a Budget: Chic Looks for Less', 'image': 'fashion3.png'},
      {'title': 'Accessorize Like a Pro: Tips & Tricks', 'image': 'fashion4.png'},
      {'title': 'Trendy Wardrobe Essentials for 2025', 'image': 'fashion5.png'},
    ],
  };

  @override
  Widget build(BuildContext context) {
    // Get suggestions for selected interests
    final suggestions = selectedInterests
        .expand((interest) => interestSuggestions[interest] ?? [])
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Based on your interest',
        style: TextStyle(
    color: Colors.purple, // Change color here
    fontSize: 20,
  ),),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: suggestions.isEmpty
          ? _buildEmptyState()
          : SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 600),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      const Text(
                        'Suggested for you',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 30),
                      
                      // Suggestions Grid
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                          childAspectRatio: 0.8,
                        ),
                        itemCount: suggestions.length,
                        itemBuilder: (context, index) {
                          final suggestion = suggestions[index];
                          return _buildSuggestionCard(
                            title: suggestion['title'] as String,
                            imagePath: suggestion['image'] as String,
                          );
                        },
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Widget _buildSuggestionCard({
    required String title,
    required String imagePath,
  }) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Image
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  color: Colors.grey[200],
                  child: const Icon(Icons.image, size: 50),
                ),
              ),
            ),
          ),
          // Title
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.search_off, size: 60, color: Colors.grey),
          const SizedBox(height: 20),
          Text(
            'No suggestions found\nSelect more interests',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}