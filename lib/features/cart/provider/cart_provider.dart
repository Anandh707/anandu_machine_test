import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interview1/features/cart/model/cart_entity.dart';
import 'package:interview1/features/home/model/random_dog_model.dart';
import 'package:interview1/services/objectbox_service.dart';

class CartNotifier extends Notifier<List<CartEntity>> {
  @override
  List<CartEntity> build() {
    return ref.watch(cartBoxProvider);
  }

  void addToCart(RandomDog item) {
    ObjectBox.cartBox.put(
      CartEntity()
        ..imageUrl = item.message
        ..price = item.price,
    );

    state = ref.refresh(cartBoxProvider);
  }

  void deleteItem(int id) {
    ObjectBox.cartBox.remove(id);
    state = ref.refresh(cartBoxProvider);
  }
}

final cartProvider = NotifierProvider<CartNotifier, List<CartEntity>>(
  () => CartNotifier(),
);

final cartBoxProvider = Provider<List<CartEntity>>((ref) {
  return ObjectBox.cartBox.getAll();
});
