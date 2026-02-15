import 'package:flutter/material.dart';
import 'basic_ui/basic_ui.dart';
import 'advance_ui/adv_ui.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  final List<Widget> pages = [
    BasicUI(),
    AdvanceUI(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],


      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.blue,
        selectedItemColor: Color(0xFFF5CE0A),
        backgroundColor: Color(0xFF2E303C),
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: "Basic",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate_outlined),
            label: "Advanced",
          ),
        ],
      ),
    );
  }
}
