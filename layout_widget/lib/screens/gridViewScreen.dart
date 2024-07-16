import 'package:flutter/material.dart';
import 'package:layout_widget/models/student.dart';

class Gridviewscreen extends StatefulWidget {
  final List<Student> list;
  const Gridviewscreen({super.key, required this.list});

  @override
  State<Gridviewscreen> createState() => _GridviewscreenState();
}

class _GridviewscreenState extends State<Gridviewscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("그리드 뷰"),
      ),
      body: Container(
        child: Center(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,      // 열 개수 
              crossAxisSpacing: 10.0, // 열 간격
              mainAxisSpacing: 10.0   // 행 간격
            ),
            itemBuilder: (context, position) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                color: Colors.grey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      widget.list[position].imagePath ?? "image/logo.png",
                      width: 80,
                      height: 80,
                      fit: BoxFit.contain
                    ),
                    const SizedBox(height: 10,),
                    Text(
                      widget.list[position].name ?? "이름 없음",
                      style: const TextStyle(fontSize: 20),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        print("삭제 클릭!");
                      }, 
                      child: const Text("삭제하기")
                    )
                  ],
                ),
              );
            },
            itemCount: widget.list.length,
          )

        ),
      )
    );
  }
}