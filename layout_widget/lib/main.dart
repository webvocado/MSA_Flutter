import 'package:flutter/material.dart';
import 'package:layout_widget/models/student.dart';
import 'package:layout_widget/screens/detailScreen.dart';
import 'package:layout_widget/screens/gridViewScreen.dart';
import 'package:layout_widget/screens/listViewScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
    // 🧊 state
  List<Student> studentList = [];
  
  @override
  void initState() {
    super.initState();

    studentList.add( Student(
      imagePath: "image/student1.png" ,
      name: '파이리',
      age: 10,
      isGraduated: false
    ));
    studentList.add( Student(
      imagePath: "image/student2.png" ,
      name: '꼬부기',
      age: 15,
      isGraduated: false
    ));
    studentList.add( Student(
      imagePath: "image/student3.png" ,
      name: '이상해씨',
      age: 30,
      isGraduated: true
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "리스트 뷰",
             // "그리드 뷰",
      home: Listviewscreen(list: studentList)
            // Gridviewscreen(list: studentList)
            // Detailscreen()
    );
  }
}