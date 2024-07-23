import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class InsertScreen extends StatefulWidget {
  const InsertScreen({super.key});

  @override
  State<InsertScreen> createState() => _InsertScreenState();
}

class _InsertScreenState extends State<InsertScreen> {
  // _ : private 의 효과 (dart 언어)
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _writerController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  ///
  /// 게시글 등록 요청
  ///
  Future<void> insert() async {
    // 유효성 검사
    if( _formKey.currentState!.validate() ) {
      var url = "http://10.0.2.2:8080/board";
      try {
        // post( url, headers, body )
        var response = await http.post(
          Uri.parse(url),
          headers: {
            "Content-Type" : "application/json"
          }, 
          body: jsonEncode({
            'title' : _titleController.text,
            'writer' : _writerController.text,
            'content' : _contentController.text,
          }
          ),
        );
        
        // 게시글 등록 요청 성공
        if( response.statusCode == 200 || response.statusCode == 201 ) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('게시글 등록 성공!'),
              backgroundColor: Colors.blueAccent,
            ),
          );
          Navigator.pushReplacementNamed(context, "/board/list");
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('게시글 등록 실패!'),
              backgroundColor: Colors.redAccent,
            ),
          );
        }
      } catch (e) {
        print(e);
      }
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
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: "제목",
                ),
                validator: (value) {
                  if( value == null || value.isEmpty ) {
                    return "제목을 입력하세요";
                  }
                  return null;
                },
              ),
              
              TextFormField(
                controller: _writerController,
                decoration: const InputDecoration(
                  labelText: "작성자",
                ),
                validator: (value) {
                  if( value == null || value.isEmpty ) {
                    return "작성자를 입력하세요";
                  }
                  return null;
                },
              ),
              
              TextFormField(
                controller: _contentController,
                decoration: const InputDecoration(
                  labelText: "내용",
                ),
                maxLines: 5,
                validator: (value) {
                  if( value == null || value.isEmpty ) {
                    return "내용을 입력하세요";
                  }
                  return null;
                },
              ),

            ],
          ),
        ),
      ),
      // 키패드가 올라올 때 같이 올라온다
      bottomSheet: Container(
        height: 50,
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              insert();
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              backgroundColor: Colors.green.shade900,
              foregroundColor: Colors.white,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              )
            ), 
            child: Text("등록하기"),
          ),
        ),
      ),
    );
  }
}
