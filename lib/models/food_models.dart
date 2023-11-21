class Food {
  final String foodName;
  final String calories;
  final String protein;
  final String fat;
  final String carbohydrates;

  Food({
    required this.foodName,
    required this.calories,
    required this.protein,
    required this.fat,
    required this.carbohydrates,
  });

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      foodName: json['الغذاء'].toString(),
      calories: json['سعر حراري'].toString(),
      protein: json['بروتين'].toString(),
      fat: json['دهون'].toString(),
      carbohydrates: json['كربوهيدرات'].toString(),
    );
  }
}

class FoodCategory {
  final String categoryName;
  final List<Food> foods;

  FoodCategory({
    required this.categoryName,
    required this.foods,
  });

  factory FoodCategory.fromJson(String categoryName, List<dynamic> jsonList) {
    List<Food> foods = jsonList.map((item) => Food.fromJson(item)).toList();
    return FoodCategory(categoryName: categoryName, foods: foods);
  }
}
