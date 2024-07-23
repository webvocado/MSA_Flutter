import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:http_app/models/board.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({super.key});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _writerController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final Board board = ModalRoute.of(context)!.settings.arguments as Board;
    _titleController.text = board.title!;
    _writerController.text = board.writer!;
    _contentController.text = board.content!;
  }

  Future<void> updateBoard(BuildContext context, int no) async {
    var url = "http://10.0.2.2:8080/board";

    try {
      var response = await http.put(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          'title': _titleController.text,
          'writer': _writerController.text,
          'content': _contentController.text,
          'no': no,
        }),
      );
      if (response.statusCode == 200) {
        print("수정 성공");
        Navigator.pop(context);
      } else {
        print("수정 실패: ${response.statusCode}");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Board board = ModalRoute.of(context)!.settings.arguments as Board;

    return Scaffold(
      appBar: AppBar(
        title: Text("게시글 수정"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: "제목",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _writerController,
              decoration: InputDecoration(
                labelText: "작성자",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _contentController,
              decoration: InputDecoration(
                labelText: "내용",
                border: OutlineInputBorder(),
              ),
              maxLines: 10,
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () async {
                await updateBoard(context, board.no!);
              },
              child: Text("수정"),
            )
          ],
        ),
      ),
    );
  }
}