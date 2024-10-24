import 'views/yahtzee.dart'; 
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
  
   
void main() {
  runApp(const DiceGameApp());
}

class DiceGameApp extends StatelessWidget {
  const DiceGameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice Adventure: Yahtzee',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 28, 90, 98),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: const Color.fromARGB(255, 3, 143, 143)),
        ),
        useMaterial3:
            true, 
      ),
      home: const LandingPage(),
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
  
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 61, 221, 223),
                  Color.fromARGB(255, 30, 134, 139),
                  Color.fromARGB(255, 10, 87, 91),
                ],
              ),
            ),
          ),
          
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Welcome to Yahtzee!",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.5,
                  shadows: [
                    Shadow(
                      blurRadius: 4.0,
                      color: Colors.black.withOpacity(0.7),
                      offset: const Offset(3, 3),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
             
              AnimatedContainer(
                duration: const Duration(seconds: 2),
                curve: Curves.easeInOut,
                child: const Icon(
                  Icons.casino,
                  color: Colors.white,
                  size: 120,
                ),
              ),
              const SizedBox(height: 40),
              FAProgressBar(
                currentValue: 100,
                displayText: '% Ready',
                displayTextStyle: const TextStyle(color: Colors.white),
                backgroundColor: Colors.white.withOpacity(0.3),
                progressColor: const Color.fromARGB(255, 6, 28, 51),
                size: 25,
                animatedDuration: const Duration(seconds: 2),
                direction: Axis.horizontal,
                verticalDirection: VerticalDirection.up,
                borderRadius: BorderRadius.circular(10),
              ),
              const SizedBox(height: 50),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Yahtzee()));
                },
                icon: const Icon(Icons.play_arrow_rounded, size: 24),
                label: const Text('Ready, Set, Roll!'),
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 18),
                  backgroundColor: const Color.fromARGB(255, 13, 90, 141),
                  elevation: 10,
                  shadowColor: Colors.black.withOpacity(0.4),
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(fontSize: 22),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Roll the dice, climb the leaderboard!",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
