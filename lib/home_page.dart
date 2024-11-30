import 'dart:math';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      //random number between 1 and 4
                      "assets/image${Random().nextInt(4) + 1}.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Theme.of(context).colorScheme.primary,
              child: Center(
                child: Transform.rotate(
                  angle: 0.1,
                  child: Text(
                    'Welcome to the Home Page!',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
