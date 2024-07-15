void main() {
  var add = (int a, int b) => a + b;
  print("add() 호출 결과 : ${add(10, 20)}");

  // var sub = (int x, int y) => { return x - y; };
  // print("sub() 호출 결과 : ${sub(10, 20)}");
  // 다트(Dart) 언어에서는 화살표 함수(arrow function)를 사용할 때
  // 중괄호 {}와 return을 같이 사용할 수 없습니다.
  var sub = (int x, int y) => x - y;
  print("sub() 호출 결과 : ${sub(10, 20)}");

  List<int> list = [1, 2, 3, 4, 5];
  List<int> newList = list.map((item) => item * 2).toList();
  print("newList : $newList");
}
