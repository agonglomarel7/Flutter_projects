import 'package:flutter/material.dart';
import 'package:mycoffe/widgets/coffeeAppBar.dart';
import 'package:mycoffe/widgets/coffeeSearchBar.dart';

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
        title: 'Coffee App',
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.orange,
          scaffoldBackgroundColor: Colors.black,
          colorScheme: const ColorScheme.dark(
            primary: Colors.orange,
            secondary: Colors.orangeAccent,
          ),
          fontFamily: 'Roboto',
        ),
      home: const CoffeeHomePage()
    );
  }
}


class CoffeeHomePage extends StatelessWidget {
  const CoffeeHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CoffeeAppBar(),
      body: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: const [
    CoffeeSearchBar(),
    // On continue ensuite ici…
    ],
    )
    );
  }
}