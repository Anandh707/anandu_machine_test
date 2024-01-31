import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interview1/features/history/model/history_entity.dart';
import 'package:interview1/features/home/model/random_dog_model.dart';
import 'package:interview1/services/objectbox_service.dart';

final historyBoxProvider = Provider<List<HistoryEntity>>((ref) {
  return ObjectBox.historyBox.getAll();
});

class HistoryNotifier extends Notifier<List<HistoryEntity>> {
  @override
  List<HistoryEntity> build() {
    return ref.watch(historyBoxProvider);
  }

  void addItem(RandomDog item) {
    ObjectBox.historyBox.put(
      HistoryEntity()
        ..imageUrl = item.message
        ..price = item.price,
    );
    state = ref.refresh(historyBoxProvider);
  }

  void removeItem(int id) {
    ObjectBox.historyBox.remove(id);
    state = ref.refresh(historyBoxProvider);
  }
}

final historyProvider = NotifierProvider<HistoryNotifier, List<HistoryEntity>>(
  () => HistoryNotifier(),
);
