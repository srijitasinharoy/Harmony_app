// HARMONY APP
// Selfcare. Health. Empowerment.

// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login_page.dart';
import 'signup_page.dart';

void main() {
  runApp(Firstpage());
}

class Firstpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HARMONY',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: SheHomePage(),
    );
  }
}

class SheHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFE4EC), // Light pink background
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo - Purple Lotus Flower
            Image.asset(
              'logo.png',
              width: 270,
            ),

            // Title - Harmony
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Signuppage()),
                );
              },
              child: Text(
                'HARMONY',
                style: TextStyle(
                  fontFamily: 'Inspiration',
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
            ),
            SizedBox(height: 10),

            // Subtitle - Selfcare. Health. Empowerment.
            Text(
              'Selfcare. Health. Empowerment.',
              style: GoogleFonts.abel(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.purple.shade700,
              ),
            ),

            SizedBox(height: 26),
          ],
        ),
      ),
    );
  }
}
