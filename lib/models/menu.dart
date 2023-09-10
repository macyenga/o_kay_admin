import 'package:flutter/foundation.dart';
import 'package:o_kay_admin/models/food.dart';

class Menu {
  final Category category;
  final List<Food> foods;
  Menu({
    required this.category,
    required this.foods,
  });
}
