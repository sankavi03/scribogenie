import 'package:flutter/material.dart';
import 'writing_screen.dart';
import 'practice_screen.dart';
import 'progress_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends StatelessWidget {
  final String userName;

  const HomeScreen({
    super.key,
    required this.userName,
  });

  Widget buildButton({
    required BuildContext context,
    required String text,
    required IconData icon,
    required Widget screen,
  }) {
    return SizedBox(
      width: 280,
      height: 60,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => screen,
            ),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            const SizedBox(width: 10),
            Text(
              text,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ScriboGenie"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                const SizedBox(height: 20),

                Text(
                  "👋 Welcome, $userName",
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 30),

                const Icon(
                  Icons.auto_stories,
                  size: 100,
                ),

                const SizedBox(height: 20),

                const Text(
                  "ScriboGenie",
                  style: TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  "Helping Every Word Find Its Way",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 40),

                buildButton(
                  context: context,
                  text: "Start Writing",
                  icon: Icons.edit,
                  screen: const WritingScreen(),
                ),

                const SizedBox(height: 15),

                buildButton(
                  context: context,
                  text: "Practice",
                  icon: Icons.school,
                  screen: const PracticeScreen(),
                ),

                const SizedBox(height: 15),

                buildButton(
                  context: context,
                  text: "Progress",
                  icon: Icons.bar_chart,
                  screen: const ProgressScreen(),
                ),

                const SizedBox(height: 15),

                buildButton(
                  context: context,
                  text: "Settings",
                  icon: Icons.settings,
                  screen: const SettingsScreen(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}