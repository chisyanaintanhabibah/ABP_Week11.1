import 'package:flutter/material.dart';

class Tutorial11Page extends StatelessWidget {
  const Tutorial11Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tutorial 11-1'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go to Home page'),
        ),
      ),
    );
  }
}
