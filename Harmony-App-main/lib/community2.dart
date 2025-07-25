import 'package:flutter/material.dart';
import 'community3.dart';

class InterestsSelectionPage extends StatefulWidget {
  const InterestsSelectionPage({super.key});

  @override
  State<InterestsSelectionPage> createState() => _InterestsSelectionPageState();
}

class _InterestsSelectionPageState extends State<InterestsSelectionPage> {
  final Map<String, bool> _selectedInterests = {
    'Painting': false,
    'Craft': false,
    'Yoga & Meditation': false,
    'Cooking': false,
    'Baking': false,
    'Graphics Designing': false,
    'Makeup & Skincare': false,
    'Fashion': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.purple),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      
        backgroundColor: Colors.transparent,
        elevation: 0
        ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                
                // Title
                const Text(
                  'Select what you find interesting',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 40),
                
                // Interest Cards with Checkboxes
                ..._selectedInterests.keys.map((interest) {
                  return _buildInterestCard(
                    title: interest,
                    icon: _getIconForInterest(interest),
                    isSelected: _selectedInterests[interest]!,
                    onChanged: (value) {
                      setState(() {
                        _selectedInterests[interest] = value!;
                      });
                    },
                  );
                }),
                
                const SizedBox(height: 40),
                
                // Continue Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle continue action with selected interests
                      final selected = _selectedInterests.entries
                          .where((e) => e.value)
                          .map((e) => e.key)
                          .toList();
                          Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => InterestSuggestionsPage(selectedInterests: selected),
    ),
  );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  IconData _getIconForInterest(String interest) {
    switch (interest) {
      case 'Painting':
        return Icons.draw;
      case 'Craft':
        return Icons.draw_rounded;
      case 'Yoga & Meditation':
        return Icons.self_improvement;
      case 'Cooking':
        return Icons.food_bank;
      case 'Baking':
        return Icons.cookie;
      case 'Graphics Designing':
        return Icons.design_services;
      case 'Makeup & Skincare':
        return Icons.brush;
      case 'Fashion':
        return Icons.face_retouching_natural;
      default:
        return Icons.star;
    }
  }

  Widget _buildInterestCard({
    required String title,
    required IconData icon,
    required bool isSelected,
    required ValueChanged<bool?> onChanged,
  }) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          onChanged(!isSelected);
        },
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Icon(icon, size: 30, color: Colors.purple),
              const SizedBox(width: 16),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              Checkbox(
                value: isSelected,
                onChanged: onChanged,
                activeColor: Colors.purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}