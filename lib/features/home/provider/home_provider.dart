import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interview1/services/api_service.dart';

final apiserviceProvider = Provider<Apiservice>((ref) {
  return Apiservice();
});
final getpostProvider = FutureProvider((ref) async {
  return ref.watch(apiserviceProvider).getpost();
});
