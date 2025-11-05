import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool showFilters = false;

  // Filter options
  Set<String> selectedCuisines = {};
  Set<String> selectedTypes = {};
  Set<String> selectedDurations = {};
  Set<String> selectedDifficulties = {};
  Set<String> selectedIngredients = {};

  final List<String> cuisines = ['Malay', 'Chinese', 'Indian', 'Western'];
  final List<String> types = ['All', 'Breakfast', 'Dinner', 'Lunch'];
  final List<String> durations = ['< 15 min', '15 - 30 min', '> 30 min'];
  final List<String> difficulties = ['Easy', 'Medium', 'Hard'];
  final List<String> ingredients = [
    'Chicken',
    'Rice',
    'Bread',
    'Egg',
    'Noodle'
  ];

  final List<SearchRecipe> recipes = [
    SearchRecipe(
      name: 'Pahang\nRendang Pahang\n(Opor Daging)',
      image: 'assets/pahang.png',
    ),
    SearchRecipe(
      name: 'Johor\nRendang Hati',
      image: 'assets/johor.jpg',
    ),
    SearchRecipe(
      name: 'Selangor\nRendang Landak',
      image: 'assets/selangor.jpg',
    ),
    SearchRecipe(
      name: 'Perak\nRendang Tok',
      image: 'assets/perak.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB86428),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search: Nasi, Maggi...',
                          hintStyle: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 14,
                          ),
                          prefixIcon:
                              const Icon(Icons.search, color: Colors.grey),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        showFilters = !showFilters;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.tune,
                        color: Color(0xFFB86428),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Filter Panel
            if (showFilters)
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF8B5A2B),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Search Filter',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Cuisine
                    const Text(
                      'Cuisine',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: cuisines.map((cuisine) {
                        return FilterChip(
                          label: Text(cuisine),
                          selected: selectedCuisines.contains(cuisine),
                          onSelected: (selected) {
                            setState(() {
                              if (selected) {
                                selectedCuisines.add(cuisine);
                              } else {
                                selectedCuisines.remove(cuisine);
                              }
                            });
                          },
                          backgroundColor: const Color(0xFF8B5A2B),
                          selectedColor: const Color(0xFFB86428),
                          labelStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                          side: BorderSide(color: Colors.white.withOpacity(0.3)),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 20),

                    // Type
                    const Text(
                      'Type',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: types.map((type) {
                        return FilterChip(
                          label: Text(type),
                          selected: selectedTypes.contains(type),
                          onSelected: (selected) {
                            setState(() {
                              if (selected) {
                                selectedTypes.add(type);
                              } else {
                                selectedTypes.remove(type);
                              }
                            });
                          },
                          backgroundColor: const Color(0xFF8B5A2B),
                          selectedColor: const Color(0xFFB86428),
                          labelStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                          side: BorderSide(color: Colors.white.withOpacity(0.3)),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 20),

                    // Duration & Difficulty
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Duration',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 10),
                              ...durations.map((duration) {
                                return Row(
                                  children: [
                                    Radio<String>(
                                      value: duration,
                                      groupValue: selectedDurations.isNotEmpty
                                          ? selectedDurations.first
                                          : null,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedDurations.clear();
                                          if (value != null) {
                                            selectedDurations.add(value);
                                          }
                                        });
                                      },
                                      fillColor: MaterialStateProperty.all(
                                          Colors.white),
                                    ),
                                    Text(
                                      duration,
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                  ],
                                );
                              }).toList(),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Difficulty',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 10),
                              ...difficulties.map((difficulty) {
                                return Row(
                                  children: [
                                    Radio<String>(
                                      value: difficulty,
                                      groupValue:
                                          selectedDifficulties.isNotEmpty
                                              ? selectedDifficulties.first
                                              : null,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedDifficulties.clear();
                                          if (value != null) {
                                            selectedDifficulties.add(value);
                                          }
                                        });
                                      },
                                      fillColor: MaterialStateProperty.all(
                                          Colors.white),
                                    ),
                                    Text(
                                      difficulty,
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                  ],
                                );
                              }).toList(),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Ingredient
                    const Text(
                      'Ingredient',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: ingredients.map((ingredient) {
                        return Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Radio<String>(
                              value: ingredient,
                              groupValue: selectedIngredients.isNotEmpty
                                  ? selectedIngredients.first
                                  : null,
                              onChanged: (value) {
                                setState(() {
                                  selectedIngredients.clear();
                                  if (value != null) {
                                    selectedIngredients.add(value);
                                  }
                                });
                              },
                              fillColor:
                                  MaterialStateProperty.all(Colors.white),
                            ),
                            Text(
                              ingredient,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 20),

                    // Buttons
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                selectedCuisines.clear();
                                selectedTypes.clear();
                                selectedDurations.clear();
                                selectedDifficulties.clear();
                                selectedIngredients.clear();
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: const Color(0xFFB86428),
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text('Reset'),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                showFilters = false;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF1E3A8A),
                              foregroundColor: Colors.white,
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text('Apply'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

            const SizedBox(height: 20),

            // Recipe Grid
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.85,
                ),
                itemCount: recipes.length,
                itemBuilder: (context, index) {
                  return SearchRecipeCard(recipe: recipes[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchRecipe {
  final String name;
  final String image;

  SearchRecipe({required this.name, required this.image});
}

class SearchRecipeCard extends StatelessWidget {
  final SearchRecipe recipe;

  const SearchRecipeCard({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey[800],
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Recipe image
          Image.asset(
            recipe.image,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.grey[300],
                child: const Icon(Icons.image_not_supported,
                    color: Colors.grey, size: 40),
              );
            },
          ),

          // Overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.7),
                ],
              ),
            ),
          ),

          // Text
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                recipe.name,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  height: 1.2,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
