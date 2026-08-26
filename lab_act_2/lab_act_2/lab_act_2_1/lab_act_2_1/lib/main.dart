import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.pink,
            Colors.black
          ])
        ),
        child: Center(
          child: Text("Hello World!"),
        ),
        ),
        ),
        ),
        );
}