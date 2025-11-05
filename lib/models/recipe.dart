class Recipe {
  final String name;
  final int calories;
  final int duration;
  final double rating;
  final int reviews;
  final String image;
  bool isFavorite;
  final List<Ingredient> ingredients;

  Recipe({
    required this.name,
    required this.calories,
    required this.duration,
    required this.rating,
    required this.reviews,
    required this.image,
    this.isFavorite = false,
    required this.ingredients,
  });
}

class Ingredient {
  final String name;
  final String quantity;
  final String icon;

  Ingredient({
    required this.name,
    required this.quantity,
    required this.icon,
  });
}
