import 'package:flutter/material.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({super.key});

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Center(
      //   child: Text("History Page"),
      // ),
      body: Center(
        child: Container(
          width: 410,
          color: Colors.grey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text("กดเริ่มยืนยันตัวตนที่ ThaID"),
              // SizedBox(
              //   height: 20,
              // ),
              // Text('กรณีที่คุณทำรายการไม่สำเร็จ สามารถกลับมาเริ่มใหม่ได้ที่ คาร์ดอกซ์แอปพลิเคชัน'),
              // SizedBox(
              //   height: 20,
              // ),
              // Text('กรณีที่คุณทำรายการไม่สำเร็จ สามารถกลับมาเริ่มใหม่ได้ที่ คาร์\ufeffดอก\ufeffซ์แอปพลิเคชัน'),
              // SizedBox(
              //   height: 20,
              // ),
              Text('กรณีที่คุณทำรายการไม่สำเร็จ สามารถกลับมาเริ่มใหม่ได้a คาร์\ufeffแอก\ufeffซ์แอปพลิเคชัน'),
              SizedBox(
                height: 20,
              ),
              // Text(
              //   // "กรณีที่คุณทำรายการไม่สำเร็จ สามารถกลับมาเริ่มใหม่ได้ที่ คาร์ดอกซ์"
              //   keepWord('กรณีที่คุณทำรายการไม่สำเร็จ สามารถกลับมาเริ่มใหม่ได้ที่ คาร์ดอกซ์แอปพลิเคชัน'),
              // ),
              // SizedBox(
              //   height: 20,
              // ),
              // Text('กรณีที่คุณทำรายการไม่สำเร็จ สามารถกลับมาเริ่มใหม่ได้ที่ คาร์ดอกซ์แอปพลิเคชั'),


              // Text(addNewLineBeforeNumber('กรณีที่คุณทำรายการไม่สำเร็จ สามารถกลับมาเริ่มใหม่ได้ที่ คาร์ดเอกซ์')),
              // Wrap(
              //   children: [
              //
              //     // Text(' '),
              //     // Text('สามารถกลับมาเริ่มใหม่ได้ที่'),
              //     // Text(' '),
              //     // Text('คาร์ดเอกซ์'),
              //     // Text('ABC'),
              //   ],
              // )
            ],
          ),
          // child: Wrap(
          //   children: "กรณีที่คุณทำรายการไม่สำเร็จ สามารถกลับมาเริ่มใหม่ได้ที่ คาร์ดเอกซ์".split(" ").map((e) => Text(e)).toList(),
          // ),
        ),
      ),
    );
  }



  String keepWord(text) {
    final RegExp emoji = RegExp(
        r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])');
    String fullText = '';
    List<String> words = text.split(' ');
    for (var i = 0; i < words.length; i++) {
      fullText += emoji.hasMatch(words[i])
          ? words[i]
          : words[i]
          .replaceAllMapped(RegExp(r'(\S)(?=\S)'), (m) => '${m[1]}\u200D');
      if (i < words.length - 1) fullText += ' ';
    }
    return fullText;
  }

}
