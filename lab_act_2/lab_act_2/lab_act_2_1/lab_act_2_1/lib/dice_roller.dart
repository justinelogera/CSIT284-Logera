import 'dart:math';
 
import 'package:flutter/material.dart';
 
class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});
 
  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}
 
class _DiceRollerState extends State<DiceRoller> {
  final randomizer = Random();
  var currentdiceImage = 'assets/dice-images/dice-2.png';
 
  void rollDice() {
    setState(() {
      var num = randomizer.nextInt(6) + 1;
      currentdiceImage = 'assets/dice-images/dice-$num.png';
    });
  }
 
  @override
  Widget build(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          width: 200,
          currentdiceImage,
        ),
        TextButton(
          onPressed: rollDice,
          child: const Text(
            "Roll Dice",
            style: TextStyle(
              fontSize: 28,
              color: Color.fromARGB(255, 229, 8, 8),
            ),
          ),
        ),
      ],
    );
  }
}