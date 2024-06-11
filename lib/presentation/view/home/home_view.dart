import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_clean_architecture/domain/entities/home/menu_entity.dart';
import 'package:test_clean_architecture/presentation/view/home/home_provider.dart';
import 'state/home_state.dart';
import '../../widgets/home/menuitem_widget.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(homePageStateProvider.notifier).getAllMenu();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.read(homePageStateProvider.notifier);
    // final controller2 = ref.read(homePageStateProvider.notifier);
    return Scaffold(
      backgroundColor: const Color(0xffCFD6E0),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.dashboard, color: Colors.blue),
                  const SizedBox(width: 8),
                  const Text("Cashier"),
                  IconButton(
                    icon: const Icon(Icons.shopping_bag, color: Colors.blue),
                    onPressed: () {},
                  ),
                ],
              ),
              TextFormField(
                controller: controller.textSearchController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: "Search...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  contentPadding: const EdgeInsets.all(14.0),
                  filled: true,
                  fillColor: Colors.white,
                ),
                onChanged: (value){

                },
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CategoryIcon(icon: Icons.fastfood),
                  CategoryIcon(icon: Icons.local_pizza),
                  CategoryIcon(icon: Icons.local_dining),
                  CategoryIcon(icon: Icons.local_cafe),
                  CategoryIcon(icon: Icons.more_horiz),
                ],
              ),
              const SizedBox(height: 16.0),
              const Padding(
                padding: EdgeInsets.only(
                  left: 4
                ),
                child: Text(
                  "Menu",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color(0xff5F686F),
                  ),
                ),
              ),
              const SizedBox(height: 6.0),
              Consumer(
                builder: (BuildContext context, WidgetRef refHome, Widget? widget){
                  final menuState = ref.watch(homePageStateProvider).menuState;
                  switch(menuState.status){
                    case HomeStatus.loading:
                    case HomeStatus.initial:
                      return const Expanded(child: Center(child: CircularProgressIndicator()));
                    case HomeStatus.failure:
                      return const Expanded(child: Center(child: Text("Error!!")));
                    case HomeStatus.success:
                      List<MenuEntity> menuList = menuState.value ?? [];
                      return Expanded(
                        child: GridView.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // number of items in each row
                            mainAxisSpacing: 8.0, // spacing between rows
                            crossAxisSpacing: 8.0, // spacing between columns
                          ),
                          // padding: const EdgeInsets.all(0), // padding around the grid
                          itemCount: menuList.length, // total number of it
                          itemBuilder: (BuildContext context, int index) {
                            return MenuItemWidget(menu: menuList[index],);
                          },

                        ),
                      );
                    default:
                      return const Center(
                        child: Text("Not found"),
                      );
                  }
                }
              )

              // Expanded(
              //   child: GridView.count(
              //     crossAxisCount: 2,
              //     crossAxisSpacing: 10.0,
              //     mainAxisSpacing: 10.0,
              //     children: [
              //       MenuItem(image: "assets/pizza.jpg", name: "Pepperoni Pizza", price: "\$10.99"),
              //       MenuItem(image: "assets/burger.jpg", name: "Classic Burger", price: "\$8.99"),
              //       MenuItem(image: "assets/sushi.jpg", name: "California Roll", price: "\$7.99"),
              //       MenuItem(image: "assets/tacos.jpg", name: "Chicken Tacos", price: "\$6.99"),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryIcon extends StatelessWidget {
  final IconData icon;

  CategoryIcon({required this.icon});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 30.0,
      child: Icon(icon, size: 30.0),
    );
  }
}
