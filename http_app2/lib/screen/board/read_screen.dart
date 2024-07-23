import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_app/models/board.dart';

class ReadScreen extends StatefulWidget {
  const ReadScreen({super.key});

  @override
  State<ReadScreen> createState() => _ReadScreenState();
}

class _ReadScreenState extends State<ReadScreen> {
  Board? _board;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    int? no = ModalRoute.of(context)!.settings.arguments as int?;
    if (no != null) {
      getBoard(no);
    }
  }

  Future<void> deleteBoard(BuildContext context, int no) async {

    var url = "http://10.0.2.2:8080/board/$no";

    try {
      var response = await http.delete(Uri.parse(url));
      if (response.statusCode == 200) {
        print("삭제 성공");
        // 삭제 성공 시 true를 반환하며 현재 화면을 닫습니다.
        Navigator.pop(context, true);
      } else {
        print("삭제 실패: ${response.statusCode}");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> getBoard(int no) async {
    var url = "http://10.0.2.2:8080/board/$no";

    try {
      var response = await http.get(Uri.parse(url));
      var utf8Decoded = utf8.decode(response.bodyBytes);
      var jsonData = jsonDecode(utf8Decoded);
      setState(() {
        _board = Board.fromJson(jsonData);
      });
    } catch (e) {
      print("Error fetching board: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("게시글 조회"),
        actions: [
          PopupMenuButton<String>(
            itemBuilder: (BuildContext context) {
              return {"수정하기", "삭제하기"}.map((String menu) {
                return PopupMenuItem<String>(
                  child: Text(menu),
                  value: menu,
                );
              }).toList();
            },
            onSelected: (String value) {
              if (value == "수정하기") {
                Navigator.pushNamed(context, "/board/update", arguments: _board);
              } else if (value == "삭제하기") {
                if (_board != null && _board!.no != null) {
                  deleteBoard(context, _board!.no!);
                } else {
                  print("게시글 번호가 유효하지 않습니다.");
                }
              }
            },
            icon: Icon(Icons.more_vert),
          )
        ],
      ),
      body: _board == null
          ? Center(child: CircularProgressIndicator())
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("제목: ${_board!.title}", style: TextStyle(fontSize: 30.0),),
                  SizedBox(height: 8),
                  Text("작성자: ${_board!.writer}", style: TextStyle(fontSize: 20.0),),
                  SizedBox(height: 8),
                  Text("내용: ${_board!.content}"),
                ],
              ),
            ),
    );
  }
}