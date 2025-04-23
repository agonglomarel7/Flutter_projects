import 'package:balanced/widgets/centeredIllustration.dart';
import 'package:balanced/widgets/customInput.dart';
import 'package:balanced/widgets/headerTextBlock.dart';
import 'package:balanced/widgets/primaryButton.dart';
import 'package:balanced/widgets/searchInput.dart';
import 'package:balanced/widgets/tagSelector.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFEF743C), Color(0xFF72788A)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: const SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15),
                  // Widgets à venir ici
                  SearchInput(),
                  SizedBox(height: 15,),
                  HeaderTextBlock(),
                  SizedBox(height: 15,),
                  CenteredIllustration(),
                  SizedBox(height: 15,),
                  TagSelector(),
                  SizedBox(height: 15),
                  CustomInputField(
                    hint: "Enter your email",
                    suffixIcon: Icons.email_outlined,
                  ),
                  SizedBox(height: 15),
                  CustomInputField(
                    hint: "Enter your password",
                    suffixIcon: Icons.lock_outline,
                    obscure: true,
                  ),
                  SizedBox(height: 15),
                  PrimaryButton(
                    label: "Sign Up",
                  ),
                ],

              ),
            ),
          ),
        ),
      ),
    );
  }

  void _signUpPressed() {
    // À remplacer plus tard par la logique d'inscription
    debugPrint("Sign Up button pressed");
  }

}
