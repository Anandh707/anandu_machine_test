import 'package:interview1/features/cart/model/cart_entity.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../objectbox.g.dart';

class ObjectBox {
  late final Store store;
  static late final Box<CartEntity> cartBox;

  ObjectBox._create(this.store) {
    cartBox = store.box<CartEntity>();
  }

  static Future<ObjectBox> create() async {
    final docsDir = await getApplicationDocumentsDirectory();

    final store =
        await openStore(directory: p.join(docsDir.path, "obx-example"));
    return ObjectBox._create(store);
  }
}
