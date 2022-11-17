import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(28),
      children: Dummy_Categories.map(
        (catData) => CategoryItem(
          catData.id,
          catData.title,
          catData.color,
        ),
      ).toList(),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: 25,
        crossAxisSpacing: 25,
      ),
    );
  }
}
