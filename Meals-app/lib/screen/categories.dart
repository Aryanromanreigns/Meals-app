import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screen/meals.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen(
      {super.key,
      required this.ontogglefavorute,
      required this.avialablemeals});
  final void Function(Meal meal) ontogglefavorute;
  final List<Meal> avialablemeals;

  void _selectcategory(BuildContext context, Category category) {
    final filteredmeals = avialablemeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filteredmeals,
          ontogglefavorute: ontogglefavorute,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Theme.of(context).colorScheme.background,
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: availableCategories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 4 / 3,
            crossAxisSpacing: 18,
            mainAxisSpacing: 18,
          ),
          itemBuilder: (ctx, index) {
            final category = availableCategories[index];
            return CategoryGridItem(
              category: category,
              onselectedcategory: () {
                _selectcategory(context, category);
              },
            );
          },
        ),
      ),
    );
  }
}
