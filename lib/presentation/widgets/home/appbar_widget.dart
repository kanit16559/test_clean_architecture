import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/router/app_router_enum.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(2),
              color: const Color(0xff375F8F),
              child: const FaIcon(
                Icons.dashboard_customize_outlined,
                color: Colors.white,
                size: 30,
              ),
            ),
            const SizedBox(width: 16),
            const Text(
              "Cashier",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
                color: Color(0xff1A3064),
              ),
            ),
          ],
        ),
        Row(
          children: [
            InkWell(
              onTap: (){

              },
              child: Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all( Radius.circular(50.0)),
                  border: Border.all(
                    color: const Color(0xff5F77A0),
                    width: 1.0,
                  ),
                ),
                child: const Center(
                  child: FaIcon(
                    Icons.shopping_bag,
                    size: 30,
                    color: const Color(0xff5F77A0),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 6,
            ),
            InkWell(
              onTap: (){
                Navigator.pushNamed(
                  context,
                  AppRouteEnum.menuFavoriteView.name,
                );
              },
              child: Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all( Radius.circular(50.0)),
                  border: Border.all(
                    color: const Color(0xff5F77A0),
                    width: 1.0,
                  ),
                ),
                child: const Center(
                  child: FaIcon(
                    Icons.favorite,
                    size: 30,
                    color: const Color(0xff5F77A0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
