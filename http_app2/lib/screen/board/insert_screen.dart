import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class InsertScreen extends StatefulWidget {
  const InsertScreen({super.key});

  @override
  State<InsertScreen> createState() => _InsertScreenState();
}

class _InsertScreenState extends State<InsertScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _writerController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  Future<void> insertBoard(BuildContext context) async {
    var url = "http://10.0.2.2:8080/board";

    try {
      var response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          'title': _titleController.text,
          'writer': _writerController.text,
          'content': _contentController.text,
        }),
      );
      if (response.statusCode == 200) {
        print("등록 성공");
      } else {
        print("등록 실패: ${response.statusCode}");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("게시글 등록"),
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
                await insertBoard(context);
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, "/board/list");
              },
              child: Text("등록"),
            )
          ],
        ),
      ),
    );
  }
}
