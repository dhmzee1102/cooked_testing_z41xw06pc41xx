import 'package:cloud_firestore/cloud_firestore.dart';

class Ingredient {
  final String name;
  final String quantity;
  final String icon;

  Ingredient({
    required this.name,
    required this.quantity,
    required this.icon,
  });

  factory Ingredient.fromMap(Map<String, dynamic> map) {
    return Ingredient(
      name: map['name'] ?? '',
      quantity: map['quantity'] ?? '',
      icon: map['icon'] ?? '❓',
    );
  }
}

class Recipe {
  final String id;
  final String name;
  final int calories;
  final int duration;
  final double rating;
  final int reviews;
  final String imageUrl; // Changed from 'image'
  bool isFavorite;
  final List<Ingredient> ingredients;

  Recipe({
    required this.id,
    required this.name,
    required this.calories,
    required this.duration,
    required this.rating,
    required this.reviews,
    required this.imageUrl,
    this.isFavorite = false,
    required this.ingredients,
  });

  factory Recipe.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    var ingredientsFromDb = data['ingredients'] as List<dynamic>? ?? [];
    List<Ingredient> ingredientList = ingredientsFromDb.map((i) => Ingredient.fromMap(i)).toList();

    return Recipe(
      id: doc.id,
      name: data['name'] ?? 'No Name',
      calories: (data['calories'] ?? 0).toInt(),
      duration: (data['duration'] ?? 0).toInt(),
      rating: (data['rating'] ?? 0.0).toDouble(),
      reviews: (data['reviews'] ?? 0).toInt(),
      imageUrl: data['imageUrl'] ?? '',
      isFavorite: data['isFavorite'] ?? false,
      ingredients: ingredientList,
    );
  }
}