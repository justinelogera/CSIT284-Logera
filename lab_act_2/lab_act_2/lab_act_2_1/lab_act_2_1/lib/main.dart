import 'package:flutter/material.dart';

import 'package:lab_act_2_1/dice_roller.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 214, 207, 16),

        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Colors.black, Colors.yellow]),
          ),

          child: Center(child: DiceRoller()),
        ),
      ),
    ),
  );
}
