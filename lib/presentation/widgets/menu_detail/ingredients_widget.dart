
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IngredientsWidget extends ConsumerWidget {
  const IngredientsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Ingredients:",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold
          ),
        ),
        Wrap(
          spacing: 8.0,
          runSpacing: 4.0,
          children: [
            Chip(
              label: Text('Sushi rice')
            ),
            Chip(label: Text('Nori seaweed sheets')),
            Chip(label: Text('Crab meat or imitation crab')),
            Chip(label: Text('Avocado slices')),
            Chip(label: Text('Cucumber sticks')),
          ],
        ),
      ],
    );
  }

  Widget _buildChipWidget(String label){
    return Chip(
      backgroundColor: const Color(0xFF5F93B2),
      // color: Color(0xFF5F93B2),
      label: Text(label),
    );
  }

}
