
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydoctor/screens/Dashboard.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1681FF),
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 45.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 260,
                  width: 260,
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: const Icon(Icons.local_hospital, color: Color(0xFFFFFFFF), size: 260),
                ),
                const SizedBox(height: 100),
                const Text(
                  "Your Health,\nOne Tap Away",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Find trusted doctors and book appointments\nin seconds — anytime, anywhere",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white70, fontSize: 15.7),
                ),
                const SizedBox(height: 100),
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const Dashboard()),
                      );
                    },
                    child: const Text("Get Started", style: TextStyle(fontSize: 20)),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),

      
      ),
    );
  }
}
