import 'package:flutter/material.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController nameController = TextEditingController();
  String? selectedAgeGroup;

  void continueToHome() {
    if (nameController.text.isNotEmpty &&
    selectedAgeGroup != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(
            userName: nameController.text,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Icon(
              Icons.auto_stories,
              size: 100,
            ),

            const SizedBox(height: 20),

            const Text(
              "ScriboGenie",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),

            const Text(
              "Let's begin your learning journey!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 30),

            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            DropdownButtonFormField<String>(
              value: selectedAgeGroup,
              decoration: const InputDecoration(
                labelText: "Age Group",
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(
                  value: "5-8",
                  child: Text("5 - 8 Years"),
                ),
                DropdownMenuItem(
                  value: "9-12",
                  child: Text("9 - 12 Years"),
                ),
                DropdownMenuItem(
                  value: "13-16",
                  child: Text("13 - 16 Years"),
                ),
                DropdownMenuItem(
                  value: "17+",
                  child: Text("17+ Years"),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  selectedAgeGroup = value;
                });
              },
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: continueToHome,
                child: const Text(
                  "Start Learning",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}