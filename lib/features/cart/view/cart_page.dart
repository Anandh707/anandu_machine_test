import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interview1/features/cart/provider/cart_provider.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);
    return Scaffold(
      body: ListView.separated(
        itemCount: cart.length,
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemBuilder: (context, index) => ListTile(
          leading: Image.network(
            cart[index].imageUrl!,
          ),
          title: Text(
            "Price : \$ ${cart[index].price}",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: IconButton(
            onPressed: () {
              ref.read(cartProvider.notifier).deleteItem(cart[index].id);
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
