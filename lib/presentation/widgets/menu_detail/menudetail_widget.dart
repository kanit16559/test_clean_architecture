
import 'package:flutter/material.dart';

import '../../../domain/entities/menu_detail/menudetail_entity.dart';

class MenuDetailWidget extends StatelessWidget {
  final MenuDetailEntity menuDetail;
  const MenuDetailWidget({super.key, required this.menuDetail});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${menuDetail.name}",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold
          ),
        ),
        Text(
          "${menuDetail.detail}",
          style: TextStyle(
              fontSize: 16,
              // fontWeight: FontWeight.bold
          ),
        ),
      ],
    );
  }
}
