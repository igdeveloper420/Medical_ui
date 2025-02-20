import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medical/Screens/Login-Signup/Profile_screen.dart';
import 'package:medical/Screens/Login-Signup/shedule_screen.dart';
import 'package:medical/Screens/Views/Dashboard_screen.dart';
import 'package:medical/Screens/Widgets/TabbarPages/message_tab_all.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with SingleTickerProviderStateMixin {
  int _pageIndex = 0;
  late AnimationController _animationController;
  late Animation<double> _animation;
  late Animation<double> _scaleAnimation;

  List<IconData> icons = [
    FontAwesomeIcons.home,
    FontAwesomeIcons.envelope,
    FontAwesomeIcons.clipboardCheck,
    FontAwesomeIcons.user,
  ];

  List<Widget> pages = [
    const Dashboard(),
    const message_tab_all(),
    const shedule_screen(),
    const Profile_screen()
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _scaleAnimation = Tween<double>(begin: 0.9, end: 1.0).animate(_animation);
  }

  void _onTabTapped(int index) {
    setState(() {
      _pageIndex = index;
    });
    _animationController.forward(from: 0); // Animation Start
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FadeTransition(
        opacity: _animation,
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: pages[_pageIndex],
        ),
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: icons,
        iconSize: 26,
        height: 70,
        activeIndex: _pageIndex,
        splashSpeedInMilliseconds: 200,
        gapLocation: GapLocation.none,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        activeColor: const Color.fromARGB(255, 248, 0, 0),
        inactiveColor: const Color.fromARGB(255, 0, 0, 0),
        backgroundColor: Colors.transparent, // ✅ Removes the square box effect
        elevation: 0, // ✅ Removes shadow effect
        onTap: _onTabTapped,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
