import 'package:flutter/material.dart';

class Tutorial11_2Page extends StatefulWidget {
  const Tutorial11_2Page({super.key});

  @override
  _Tutorial11_2PageState createState() => _Tutorial11_2PageState();
}

class _Tutorial11_2PageState extends State<Tutorial11_2Page> {
  final List<String> _items = [];

  void _addItem(String item) {
    setState(() {
      _items.add(item);
    });
  }

  void _showAddItemDialog() {
    final TextEditingController _textController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Item'),
          content: TextField(
            controller: _textController,
            decoration: const InputDecoration(labelText: 'Item'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                _addItem(_textController.text);
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tutorial 11-2'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_items[index]),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: _showAddItemDialog,
              child: const Text('Add Item'),
            ),
          ),
        ],
      ),
    );
  }
}
