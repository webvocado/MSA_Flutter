void main() {
  // Map 선언
  Map<String, int> maps = {"김조은": 100, "김유정": 90, "이정용": 50};

  // 요소 접근 및 수정
  print("김조은의 성적 : ${maps['김조은']}");
  maps['김조은'] = 99;
  print("maps : $maps");

  // 요소 추가
  maps['백승헌'] = 77; // [] : 키
  print("maps : $maps");

  // 요소 제거
  maps.remove("김조은");
  print("maps : $maps");

  // Map <--> JSON ( convert 할 때 쓰일 것이다. )
}
