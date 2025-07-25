// ignore_for_file: use_key_in_widget_constructors, unused_import, non_constant_identifier_names, sort_child_properties_last

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

// Importing all pages
import 'first_page.dart';
import 'login_page.dart';
import 'signup_page.dart';
import 'navigate.dart';
import 'home_page.dart';
import 'menstrual_tracker.dart';
import 'laws.dart';
import 'community1.dart';
import 'education.dart';
import 'setup_page.dart';
import 'sidebar.dart';
import 'chatbot.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "api_key",
            authDomain: "harmony-app-f2821.firebaseapp.com",
            projectId: "harmony-app-f2821",
            storageBucket: "harmony-app-f2821.firebasestorage.app",
            messagingSenderId: "491461935691",
            appId: "1:491461935691:web:ce6ff3157be60b774483ce"));
  } else {
    await Firebase.initializeApp();
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Harmony App',
      theme: ThemeData(
        primaryColor: Colors.pinkAccent,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/', // First screen that loads
      routes: {
        '/': (context) => Firstpage(),
        '/Firstpage': (context) => Loginpage(),
        '/Navigatepage': (context) => MyApp(),
        '/menstrual': (context) => MenstrualPage(),
        '/news': (context) => NewsPage(),
        '/settings': (context) => SettingsPage(),
        '/setup': (context) => SetupPage(),

        // Mood Tracker Routes
        '/mood_main': (context) => MoodMain(),
        '/mood1': (context) => Mood1(),
        '/mood2': (context) => Mood2(),
        '/mood3': (context) => Mood3(),
        '/mood4': (context) => Mood4(),
        '/mood5': (context) => Mood5(),
        '/mood_extra': (context) => ExtraMoodPage(),
      },
    );
  }

  Widget LoginPage() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Center(
        child: Text(
          "Login Page Content",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget MenstrualPage() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menstrual Page"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Center(
        child: Text(
          "Menstrual Page Content",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget FirstPage() {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Page"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Center(
        child: Text(
          "First Page Content",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget NewsPage() {
    return Scaffold(
      appBar: AppBar(
        title: Text("News Page"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Center(
        child: Text(
          "News Page Content",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget SettingsPage() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings Page"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Center(
        child: Text(
          "Settings Page Content",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget SetupPage() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Setup Page"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Center(
        child: Text(
          "Setup Page Content",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget MoodMain() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mood Main Page"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Center(
        child: Text(
          "Mood Main Page Content",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget Mood1() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mood 1 Page"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Center(
        child: Text(
          "Mood 1 Page Content",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget Mood2() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mood 2 Page"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Center(
        child: Text(
          "Mood 2 Page Content",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget Mood3() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mood 3 Page"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Center(
        child: Text(
          "Mood 3 Page Content",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget Mood4() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mood 4 Page"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Center(
        child: Text(
          "Mood 4 Page Content",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget Mood5() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mood 5 Page"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Center(
        child: Text(
          "Mood 5 Page Content",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget ExtraMoodPage() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Extra Mood Page"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Center(
        child: Text(
          "Extra Mood Page Content",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Harmony App"),
        backgroundColor: Colors.pinkAccent,
      ),
      drawer: SideBar(), // Sidebar added
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome to Harmony App!",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/first');
              },
              child: Text("Get Started"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SideBar() {}
}
