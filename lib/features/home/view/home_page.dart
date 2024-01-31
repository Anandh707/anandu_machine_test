import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interview1/features/cart/provider/cart_provider.dart';
import 'package:interview1/features/history/provider/history_provider.dart';
import 'package:interview1/features/home/provider/home_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final api = ref.watch(getpostProvider);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: api.when(
        data: (data) {
          if (data == null) {
            return const Text("error");
          }
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                api.isRefreshing
                    ? const SizedBox(
                        height: 260,
                        child: Center(child: CircularProgressIndicator()),
                      )
                    : Container(
                        height: 260,
                        width: MediaQuery.sizeOf(context).width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: NetworkImage(data.message!),
                              fit: BoxFit.cover,
                            ),
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(0, 3),
                                spreadRadius: 1,
                                blurRadius: 3,
                                color: Colors.grey[600]!,
                              ),
                            ]),
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: null,
                              style: ElevatedButton.styleFrom(
                                disabledBackgroundColor: Colors.grey[900],
                                disabledForegroundColor: Colors.white,
                              ),
                              child: Text("\$ ${data.price}"),
                            ),
                          ],
                        ),
                      ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        ref.invalidate(getpostProvider);
                        ref.read(historyProvider.notifier).addItem(data);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[900],
                        foregroundColor: Colors.white,
                        minimumSize:
                            Size(MediaQuery.sizeOf(context).width / 2 - 24, 56),
                      ),
                      child: const Text("Next Dog"),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        ref.read(cartProvider.notifier).addToCart(data);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple[800],
                        foregroundColor: Colors.white,
                        minimumSize:
                            Size(MediaQuery.sizeOf(context).width / 2 - 24, 56),
                      ),
                      child: const Text("Add to Cart"),
                    ),
                  ],
                )
              ],
            ),
          );
        },
        error: (error, stackTrace) => const CircleAvatar(),
        loading: () => const CircleAvatar(),
      ),
    );
  }
}
