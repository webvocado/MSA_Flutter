class Board {
  int? no;
  String? title;
  String? writer;
  String? content;
  DateTime? regDate;
  DateTime? updDate;

  Board({
    required this.no,
    required this.title,
    required this.writer,
    required this.content,
    this.regDate,
    this.updDate
  });

  factory Board.fromJson(Map<String, dynamic> json) {
    return Board(
      no: json['no'],
      title: json['title'],
      writer: json['writer'],
      content: json['content'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'no': no,
      'title': title,
      'writer': writer,
      'content': content,
    };
  }

}