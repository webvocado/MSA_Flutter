import 'package:flutter/material.dart';
import 'package:layout_widget/models/student.dart';

class Detailscreen extends StatelessWidget {

  final Student student;

  const Detailscreen({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("상세화면"),),
      body: Container(
        margin: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            Container(
              height: 280,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(student.imagePath ?? "image/logo.png"),
                  fit: BoxFit.contain
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),              
            ),

            const SizedBox(height: 12.0,),
            Text(
              student.name ?? "이름 없음",
              style: const TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10.0,),
            Text(
              "나는 ${student.age}살 입니다." ?? "나이 불명",
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10.0,),
            Text(
              student.isGraduated != null
                  ? (student.isGraduated! ? "졸업 여부 ⭕" : "졸업 여부 ❌")
                  : "졸업 여부 불명",
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),


          ],
        )
      )
    );
  }
}