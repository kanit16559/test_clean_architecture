import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OrdersView extends StatefulWidget {
  const OrdersView({super.key});

  @override
  State<OrdersView> createState() => _OrdersViewState();
}

class _OrdersViewState extends State<OrdersView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){

              },
              child: Text("Orders Page")
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              enableInteractiveSelection: true,
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              enableInteractiveSelection: false,
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Input text',
                border: OutlineInputBorder(),
              ),
              contextMenuBuilder: (context, editableTextState) => const SizedBox.shrink(),
              inputFormatters: [NoPasteFormatter()],
              // contextMenuBuilder: (context, editableTextState) {
              //   // Return an empty container to disable the context menu
              //   return Container();
              // },
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Input text',
                border: OutlineInputBorder(),
              ),
              contextMenuBuilder: (context, editableTextState) => Container(),
            )
          ],
        ),
      ),
    );
  }
}

class NoPasteFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    return newValue;
  }

  @override
  TextSpan formatSpan(TextSpan oldText, TextSpan newText) {
    return newText;
  }
}
