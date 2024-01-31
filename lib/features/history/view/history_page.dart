import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: 10,
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemBuilder: (context, index) => ListTile(
          leading: Container(
            width: 100,
            height: 100,
            color: Colors.deepOrangeAccent,
          ),
          title: const Text(
            "Price : \$ 499",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete_forever),
          ),
        ),
        separatorBuilder: (BuildContext context, int index) =>
            const SizedBox(height: 16),
      ),
    );
  }
}
