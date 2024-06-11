import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_clean_architecture/domain/entities/home/menu_entity.dart';

class MenuItemWidget extends StatelessWidget {
  final MenuEntity menu;
  const MenuItemWidget({super.key, required this.menu});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: Colors.white,
      child: Column(
        children: [
          Image.network(
            height: 100,
            width: double.infinity,
            menu.image ?? "",
            fit: BoxFit.fitWidth
          ),
          const SizedBox(
            height: 5,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.grey[200],
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      menu.name ?? "",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Color(0xff5C7AA5),
                      )
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      "\$${menu.price?.toStringAsFixed(2) ?? "0.00"}",
                      style: const TextStyle(
                        color: Color(0xff5C7AA5),
                      )
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

