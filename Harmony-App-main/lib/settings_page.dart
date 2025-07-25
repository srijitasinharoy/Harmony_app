import 'package:flutter/material.dart';


// Settings Screen
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Image.asset('logo.png', height: 40),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            // Update Alert Box
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Row(
                children: [
                  const Icon(Icons.system_update_alt, color: Colors.black),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Text(
                      "A new update is available!",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios,
                      size: 18, color: Colors.grey[600]),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Settings List
            buildSettingsTile(Icons.language, "Language"),
            buildSettingsTile(Icons.lock, "Privacy Policy"),
            buildSettingsTile(Icons.description, "Terms & Conditions"),
            buildSettingsTile(Icons.info, "About the app"),
            const SizedBox(height: 20),
            buildSettingsTile(Icons.star, "Rate Us"),
            buildSettingsTile(Icons.share, "Share with Friends"),
          ],
        ),
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  // Function to build a Settings ListTile
  Widget buildSettingsTile(IconData icon, String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            spreadRadius: 1,
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.black),
        title: Text(title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        trailing:
            Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[600]),
        onTap: () {
          // Handle onTap event
        },
      ),
    );
  }
}

// Bottom Navigation Bar
Widget buildBottomNavigationBar() {
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.black,
    unselectedItemColor: Colors.black54,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Explore"),
      BottomNavigationBarItem(
          icon: Icon(Icons.notifications), label: "Notifications"),
      BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: "Saved"),
    ],
  );
}
