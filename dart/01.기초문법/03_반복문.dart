void main() {
  // for
  for (var i = 1; i <= 5; i++) {
    print("숫자 : $i");
  }

  // while
  int count = 0;
  while (count < 5) {
    print("count : $count");
    count++;
  }

  // do-while
  int number = 5;
  do {
    print("number : $number");
    number--;
  } while (number > 0);

  // 리스트 반복
  List<int> numList = [1, 2, 3, 4, 5];

  // for in
  for (var item in numList) {
    print("count : $item");
  }

  // forEach
  numList.forEach((item) {
    print("item : $item");
  });
}
