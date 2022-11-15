// ignore: depend_on_referenced_packages
import 'package:hive_flutter/adapters.dart';

void deleteCards(index) async {
  var box = Hive.box("cards");
  await box.deleteAt(index);
}
