
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/menu_detail/menudetail_entity.dart';
import '../../view/menu_detail/menu_detail_provider.dart';

class BottomMenuWidget extends ConsumerWidget {
  final MenuDetailEntity menuDetail;
  const BottomMenuWidget({super.key, required this.menuDetail});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 56,
      margin: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.remove_circle_outline),
                onPressed: () {
                  // Handle decrement
                },
              ),
              Text(
                '1',
                style: TextStyle(fontSize: 18),
              ),
              IconButton(
                icon: Icon(Icons.add_circle_outline),
                onPressed: () {
                  // Handle increment
                },
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(menuDetailPageStateProvider.notifier).saveMenuInCart(menuDetail, 1);
            },
            child: Text('Add to Cart - \$${menuDetail.price?.toStringAsFixed(2)}'),
          ),
        ],
      ),
    );
  }
}
