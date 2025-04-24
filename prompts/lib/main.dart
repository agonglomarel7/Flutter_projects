import 'package:flutter/material.dart';
import 'package:prompts/widgets/categoryCard.dart';
import 'package:prompts/widgets/promptCard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const PromptNotesScreen(),
    );
  }
}


class PromptNotesScreen extends StatelessWidget {
  const PromptNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF7F7F7),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // AppBar customisée
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.menu, size: 28),
                  Text(
                    "Prompt Notes",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 28), // pour équilibrer visuellement
                ],
              ),
              SizedBox(height: 30),

              // Search bar
              SearchBarField(),

              SizedBox(height: 30),

              const Text(
                "Categories",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    CategoryCard(
                      title: "Future<dymic>",
                      subtitle: "20 Prompt",
                      color: Color(0xFFB39DDB), // violet pastel
                    ),
                    SizedBox(width: 16),
                    CategoryCard(
                      title: "Future<void>",
                      subtitle: "55 Prompt",
                      color: Color(0xFF80DEEA), // cyan pastel
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Prompt Hub",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.blueAccent,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

// Liste des prompts
              Column(
                children: const [
                  PromptCard(
                    title: "SQLite Collection",
                    description: "this prompt is for SQLite",
                    tag: "Rank 1",
                    count: 46,
                    date: "Mon, 07 Apr 2025",
                  ),
                  PromptCard(
                    title: "Firebase CRUD",
                    description: "handles realtime DB",
                    tag: "Hot 🔥",
                    count: 32,
                    date: "Sun, 30 Mar 2025",
                  ),
                ],
              ),

              // Prochaines sections ici...

            ],
          ),
        ),
      ),
    );
  }
}

class SearchBarField extends StatelessWidget {
  const SearchBarField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Explore",
        filled: true,
        fillColor: Colors.white,
        prefixIcon: const Icon(Icons.search, color: Colors.grey),
        contentPadding: const EdgeInsets.symmetric(vertical: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}