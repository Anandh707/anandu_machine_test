import 'package:objectbox/objectbox.dart';

@Entity()
class HistoryEntity {
  @Id()
  int id = 0;
  String? imageUrl;
  int? price;
}
