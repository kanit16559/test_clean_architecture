import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../domain/entities/menu_detail/menudetail_entity.dart';
import '../../view/menu_detail/menu_detail_provider.dart';

class ImageCenterWidget extends ConsumerWidget {
  final MenuDetailEntity menuDetail;
  const ImageCenterWidget({super.key, required this.menuDetail});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      alignment: Alignment.bottomRight,
      textDirection: TextDirection.rtl,
      fit: StackFit.loose,
      // overflow: Overflow.visible,
      clipBehavior: Clip.hardEdge,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            // border: Border.all(
            //   width: 1.0,
            // ),
          ),
          child: Image.network(
              fit: BoxFit.fitWidth,
              width: double.infinity,
              height: 300,
              menuDetail.image ?? ""
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: (){
              ref.read(menuDetailPageStateProvider.notifier).updateFavoriteMenuDetail(menuDetail);
            },
            customBorder: const CircleBorder(),
            child: CircleAvatar(
                backgroundColor: Colors.grey[300],
                radius: 25,
                child: FaIcon(
                    menuDetail.favorite == true ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart,
                    size: 25,
                    color: const Color(0xff5F77A0)
                )
            ),
          ),
        )

      ],
    );
  }
}

// class ImageCenterWidget extends StatelessWidget {
//   final MenuDetailEntity menuDetail;
//   const ImageCenterWidget({super.key, required this.menuDetail});
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       alignment: Alignment.bottomRight,
//       textDirection: TextDirection.rtl,
//       fit: StackFit.loose,
//       // overflow: Overflow.visible,
//       clipBehavior: Clip.hardEdge,
//       children: [
//         Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(8.0),
//             // border: Border.all(
//             //   width: 1.0,
//             // ),
//           ),
//           child: Image.network(
//             fit: BoxFit.fitWidth,
//             width: double.infinity,
//             height: 300,
//             menuDetail.image ?? ""
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: InkWell(
//             onTap: (){
//
//             },
//             customBorder: const CircleBorder(),
//             child: CircleAvatar(
//               backgroundColor: Colors.grey[300],
//               radius: 25,
//               child: FaIcon(
//                 menuDetail.favorite == true ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart,
//                 size: 25,
//                 color: const Color(0xff5F77A0)
//               )
//             ),
//           ),
//         )
//
//       ],
//     );
//   }
// }
