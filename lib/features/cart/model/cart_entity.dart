import 'package:objectbox/objectbox.dart';

@Entity()
class CartEntity {
  @Id()
  int id = 0;
  String? imageUrl;
  int? price;
}
