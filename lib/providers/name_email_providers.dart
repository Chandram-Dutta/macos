import 'package:flutter_riverpod/flutter_riverpod.dart';

final nameProvider = StateProvider<String>((ref) {
  return "Username";
});
final emailProvider = StateProvider<String>((ref) {
  return "testuser@icloud.com";
});
