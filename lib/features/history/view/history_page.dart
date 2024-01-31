import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interview1/features/history/provider/history_provider.dart';

class HistoryPage extends ConsumerWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final history = ref.watch(historyProvider);
    return Scaffold(
      body: ListView.separated(
        itemCount: history.length,
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemBuilder: (context, index) => ListTile(
          leading: Image.network(
            history[index].imageUrl!,
            fit: BoxFit.cover,
          ),
          title: Text(
            "Price : \$ ${history[index].price}",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: IconButton(
            onPressed: () {
              ref.read(historyProvider.notifier).removeItem(history[index].id);
            },
            icon: const Icon(Icons.delete_forever),
          ),
        ),
        separatorBuilder: (BuildContext context, int index) =>
            const SizedBox(height: 16),
      ),
    );
  }
}
