import 'package:abc_app/nav_bar/Home/home_screen.dart';
import 'package:abc_app/nav_bar/Message/message_screen.dart';
import 'package:abc_app/nav_bar/Profile/profile_screen.dart';
import 'package:abc_app/nav_bar/Subscription/subscription_screen.dart';
import 'package:abc_app/nav_bar/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _index = 0;

  final _screens = const [
    HomeScreen(),
    SubscriptionScreen(),
    MessageScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _index, children: _screens),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _index,
        onChanged: (i) => setState(() => _index = i),
      ),
    );
  }
}
