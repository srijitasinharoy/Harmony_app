// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(SheApp());
}

class SheApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.pink[50],
        elevation: 0,
        title: Image.asset('logo.png', height: 40), // Lotus Logo
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu, color: Colors.purple, size: 30), // Menu Icon
            onPressed: () {
              Scaffold.of(context).openDrawer(); // Opens Sidebar
            },
          ),
        ),
        actions: [
          IconButton(
            icon:
                Icon(Icons.more_vert, color: Colors.purple), // Three dots menu
            onPressed: () {
              showMenu(
                context: context,
                position: RelativeRect.fromLTRB(1000, 80, 10, 0), // Positioning
                items: [
                  PopupMenuItem(child: Text("Profile")),
                  PopupMenuItem(child: Text("Settings")),
                  PopupMenuItem(child: Text("Logout")),
                ],
              );
            },
          ),
        ],
      ),

      // ====================== SIDEBAR MENU ======================
      drawer: Drawer(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        child: Container(
          color: Colors.pink[50], // Soft pink background
          child: Column(
            children: [
              // Profile Section
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person, color: Colors.purple, size: 40),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "User Name",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "user@example.com",
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),
              ),

              // Sidebar Menu Options
              Expanded(
                child: ListView(
                  children: [
                    _buildDrawerItem(Icons.home, "Home", context),
                    _buildDrawerItem(Icons.article, "News", context),
                    _buildDrawerItem(Icons.chat, "Community Chat", context),
                    _buildDrawerItem(
                        Icons.notifications, "Notifications", context),
                    _buildDrawerItem(Icons.settings, "Settings", context),
                    Divider(thickness: 1, color: Colors.purple[200]),
                    _buildDrawerItem(Icons.logout, "Logout", context),
                  ],
                ),
              ),

              // Footer
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "SHE App v1.0",
                  style: TextStyle(color: Colors.purple, fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      ),

      // ====================== BODY CONTENT ======================
      body: Center(
        child: Text(
          "Welcome to SHE App",
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.purple),
        ),
      ),
    );
  }

  // ====================== DRAWER ITEM WIDGET ======================
  Widget _buildDrawerItem(IconData icon, String title, BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.purple),
      title: Text(title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
      onTap: () {
        Navigator.pop(context);
        // Add navigation logic here if needed
      },
    );
  }
}
