import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_clean_architecture/presentation/view/menu_detail/menu_detail_provider.dart';
import 'package:test_clean_architecture/presentation/view/menu_detail/state/menu_detail_state.dart';
import 'package:test_clean_architecture/presentation/widgets/menu_detail/imagecenter_widget.dart';

import '../../../domain/entities/menu_detail/menudetail_entity.dart';
import '../../widgets/menu_detail/bottommenu_widget.dart';
import '../../widgets/menu_detail/ingredients_widget.dart';
import '../../widgets/menu_detail/menudetail_widget.dart';

class MenuDetailView extends ConsumerStatefulWidget {
  final int menuId;

  const MenuDetailView({super.key, required this.menuId});

  @override
  ConsumerState createState() => _MenuDetailViewState();
}

class _MenuDetailViewState extends ConsumerState<MenuDetailView> {
  
  
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(menuDetailPageStateProvider.notifier).getMenuDetail(widget.menuId);
    });
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Menu Detail",
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
            final menuDetailState = refMenuDetail.watch(menuDetailPageStateProvider);
            switch (menuDetailState.status) {
              case MenuDetailStatus.loading:
              case MenuDetailStatus.initial:
                return const Center(child: CircularProgressIndicator());
              case MenuDetailStatus.empty:
                return const Center(
                    child: Text("Not Found")
                );
              case MenuDetailStatus.failure:
                return const Center(child: Text("Error!!"));
              case MenuDetailStatus.success:
                return _buildBody(menuDetailState.value);
              default:
                return const Center(
                  child: Text("Not found"),
                );
            }
          }
        ),
      ),
      // bottomNavigationBar: Consumer(child: BottomMenuWidget()),
      bottomNavigationBar: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          final menuDetailState = ref.watch(menuDetailPageStateProvider);
          if(menuDetailState.status == MenuDetailStatus.success){
            MenuDetailEntity getValue = menuDetailState.value!;
            return BottomMenuWidget(menuDetail: getValue);
          }
          return Container();
        },
      ),
    );
  }


  Widget _buildBody(MenuDetailEntity? state){
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageCenterWidget(
            menuDetail: state!,
          ),
          MenuDetailWidget(
            menuDetail: state!,
          ),
          const SizedBox(
            height: 6,
          ),
          const IngredientsWidget(),
          const SizedBox(height: 16),
          const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Note',
              prefixIcon: Icon(Icons.note),
            ),
          ),
        ],
      ),
    );
  }
}
