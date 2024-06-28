import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../core/router/app_router_enum.dart';
import '../../../domain/entities/menu_favorite/menufavorite_entity.dart';

class MenuFavoriteItemWidget extends StatelessWidget {
  final MenuFavoriteEntity menuFavorite;
  final Function() getMenuFavorite;
  const MenuFavoriteItemWidget({super.key, required this.menuFavorite, required this.getMenuFavorite});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: Colors.white,
      child: InkWell(
        onTap: (){
          Navigator.pushNamed(
            context,
            AppRouteEnum.menuDetailView.name,
            arguments: menuFavorite.id,
          ).then((value) async{
            await getMenuFavorite();
          });
        },
        child: Column(
          children: [
            Image.network(
                height: 100,
                width: double.infinity,
                menuFavorite.image ?? "",
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
                          menuFavorite.name ?? "",
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
                          "\$${menuFavorite.price?.toStringAsFixed(2) ?? "0.00"}",
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
      ),
    );
  }
}

