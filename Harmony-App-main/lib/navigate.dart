import 'package:flutter/material.dart';
import 'home_page.dart';
import 'explore.dart';
import 'notifications.dart';
import 'saved_page.dart';
import 'settings_page.dart';

void main() {
  runApp(const NavigateApp());
}

class NavigateApp extends StatelessWidget {
  const NavigateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navigation',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MainNavigationPage(),
    );
  }
}

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Pages for bottom navigation
  final List<Widget> _pages = [
    const HomeApp(),
    const ExploreApp(),
    const NotificationApp(),
    const SavedApp(),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // ==================== DRAWER ====================
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Drawer Header
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.purple.shade50,
                ),
                child: Center(
                  child: Image.asset('logo.png', height: 60),
                ),
              ),
              // Drawer Items
              ListTile(
                leading: const Icon(Icons.home, color: Colors.purple),
                title: const Text('Home'),
                onTap: () {Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const NavigateApp()),
                    );
                  _scaffoldKey.currentState?.openEndDrawer();
                },
              ),
              ListTile(
                leading: const Icon(Icons.person_2, color: Colors.purple),
                title: const Text('Profile'),
                onTap: () {},
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.settings, color: Colors.purple),
                title: const Text('Settings'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SettingsScreen()),
                    );
    _scaffoldKey.currentState?.openEndDrawer();
                  _scaffoldKey.currentState?.openEndDrawer();
                },
              ),
              ListTile(
                leading: const Icon(Icons.help, color: Colors.purple),
                title: const Text('Help & Support'),
                onTap: () {
                  // Add help navigation
                  _scaffoldKey.currentState?.openEndDrawer();
                },
              ),
            ],
          ),
        ),
      ),
      // ==================== TOP APP BAR ====================
      appBar: AppBar(
        title: Image.asset('logo.png', height: 50),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.purple),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_2_rounded, color: Colors.purple),
            onPressed: () {
              // Notifications functionality
            },
          ),
        ],
      ),
      // ==================== BODY CONTENT ====================
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(), // Disable swipe
        children: _pages,
      ),
      // ==================== BOTTOM NAVIGATION BAR ====================
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.jumpToPage(index);
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Saved',
          ),
        ],
      ),
    );
  }
}

// ==================== PAGE WIDGETS ====================

class HomeApp extends StatelessWidget {
  const HomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class ExploreApp extends StatelessWidget {
  const ExploreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ExploreCommunityScreen(),
    );
  }
}

class NotificationApp extends StatelessWidget {
  const NotificationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotificationScreen()
    );
  }
}

class SavedApp extends StatelessWidget {
  const SavedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SavedScreen()
    );
  }
}