import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../view/home/home_provider.dart';

class IconMenuTypeWidget extends ConsumerWidget {
  final IconData icon;
  final int menuTypeId;

  const IconMenuTypeWidget({super.key, required this.icon, required this.menuTypeId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controllerRead = ref.read(homePageStateProvider.notifier);
    final menuTypeSelect = ref.watch(homePageStateProvider.select((value) => value.menuTypeSelect));
    bool isSelect = menuTypeSelect == menuTypeId;
    return GestureDetector(
      onTap: (){
        controllerRead.onTapSelectMenuType(menuTypeId);
        controllerRead.getAllMenu();
      },
      child: isSelect ? iconSelect() : iconUnselect(),
        // child: CircleAvatar(
        //   radius: 30.0,
        //   backgroundColor: isSelect ? Colors.white : const Color(0xff5F77A0),
        //   child: FaIcon(
        //     icon,
        //     size: 30,
        //     color: isSelect ? const Color(0xff5F77A0) : Colors.white,
        //   ),
        //   // child: Icon(icon, size: 30.0),
        // ),
    );
  }


  Widget iconSelect(){
    return Container(
      width: 65.0,
      height: 65.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all( Radius.circular(20.0)),
        border: Border.all(
          color: const Color(0xff5F77A0),
          width: 2.0,
        ),
      ),
      child: Center(
        child: FaIcon(
          icon,
          size: 30,
          color: const Color(0xff5F77A0),
        ),
      ),
    );
  }

  Widget iconUnselect(){
    return Container(
      width: 65.0,
      height: 65.0,
      decoration: BoxDecoration(
        color: const Color(0xff5F77A0),
        borderRadius: const BorderRadius.all( Radius.circular(20.0)),
        border: Border.all(
          color: Colors.white,
          width: 2.0,
        ),
      ),
      child: Center(
        child: FaIcon(
          icon,
          size: 30,
          color: Colors.white,
        ),
      ),
    );
  }
}
