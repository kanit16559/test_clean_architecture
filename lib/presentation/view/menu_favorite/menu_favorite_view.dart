import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_clean_architecture/presentation/view/menu_favorite/menu_favorite_provider.dart';
import 'package:test_clean_architecture/presentation/view/menu_favorite/state/menu_favorite_state.dart';

import '../../../domain/entities/menu_favorite/menufavorite_entity.dart';
import '../../widgets/menu_favorite/menufavoriteitem_widget.dart';

class MenuFavoriteView extends ConsumerStatefulWidget {
  const MenuFavoriteView({super.key});

  @override
  ConsumerState createState() => _MenuFavoriteViewState();
}

class _MenuFavoriteViewState extends ConsumerState<MenuFavoriteView> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(menuFavoritePageStateProvider.notifier).getMenuFavorite();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Menu Favorite",
          style: TextStyle(
            // fontWeight: FontWeight.bold,
            fontSize: 26,
            color: Color(0xff1A3064),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 12,
            bottom: 12
        ),
        child: Consumer(
            builder: (BuildContext context, WidgetRef refMenuDetail, Widget? widget) {
              final menuFavoriteState = refMenuDetail.watch(menuFavoritePageStateProvider);
              switch (menuFavoriteState.status) {
                case MenuFavoriteStatus.loading:
                case MenuFavoriteStatus.initial:
                  return const Center(child: CircularProgressIndicator());
                case MenuFavoriteStatus.empty:
                  return const Center(
                      child: Text("Not Found")
                  );
                case MenuFavoriteStatus.failure:
                  return const Center(child: Text("Error!!"));
                case MenuFavoriteStatus.success:
                  return _buildBody(menuFavoriteState.value!);
                default:
                  return const Center(
                    child: Text("Not found"),
                  );
              }
            }
        ),
      ),
    );
  }

  Widget _buildBody(List<MenuFavoriteEntity> state){
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // number of items in each row
        mainAxisSpacing: 8.0, // spacing between rows
        crossAxisSpacing: 8.0, // spacing between columns
      ),
      // padding: const EdgeInsets.all(0), // padding around the grid
      itemCount: state.length, // total number of it
      itemBuilder: (BuildContext context, int index) {

        return MenuFavoriteItemWidget(
          menuFavorite: state[index],
          getMenuFavorite: ref.read(menuFavoritePageStateProvider.notifier).getMenuFavorite,
        );
      },

    );
  }
}
