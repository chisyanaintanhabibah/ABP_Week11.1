import 'package:flutter/material.dart';
import 'tutorial_11_2.dart';

class Tutorial11Page extends StatelessWidget {
  const Tutorial11Page({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tutorial 11-1'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'Home'),
              Tab(icon: Icon(Icons.email), text: 'Email'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text('Selamat datang di Rumah')),
            Tutorial11_2Page(),
          ],
        ),
      ),
    );
  }
}
