// SHE App - Flutter Dart UI - Profile Setup Screen
// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'login_page.dart';
import 'navigate.dart';

void main() => runApp(Setuppage());

class Setuppage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile Setup',
      theme: ThemeData(
        fontFamily: 'Raleway',
        primaryColor: Colors.purple,
      ),
      home: ProfileSetupScreen(),
    );
  }
}

class ProfileSetupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF2F6),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.purple),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Loginpage()),
            ); // Navigate back to the previous page
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(
              'Set up your profile!',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
            SizedBox(height: 20),
            // Profile Picture with Camera Icon
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage:
                      AssetImage('profile_icon.png'), // Add profile image asset
                ),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.camera_alt, color: Colors.black),
                ),
              ],
            ),
            SizedBox(height: 24),
            // Name Field
            TextField(
              decoration: InputDecoration(
                labelText: 'Name',
                filled: true,
                fillColor: Colors.white,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
            SizedBox(height: 16),
            // Date of Birth Field
            TextField(
              decoration: InputDecoration(
                labelText: 'Date of birth',
                hintText: 'DD/MM/YYYY',
                filled: true,
                fillColor: Colors.white,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
            SizedBox(height: 16),
            // Password Management Field with Info Icon
            TextField(
              decoration: InputDecoration(
                labelText: 'Password Management',
                filled: true,
                fillColor: Colors.white,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                suffixIcon: Tooltip(
                  message: 'Option to change the password',
                  child: Icon(LucideIcons.info, color: Colors.purple),
                ),
              ),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NavigateApp()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple[300],
                  ),
                  child: Text("Done", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
