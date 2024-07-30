class Memo {
  int? id;
  String title;
  List<int> imageBytes;
  String text;

  Memo({
    this.id,
    required this.title,
    required this.imageBytes,
    required this.text,
  });

  factory Memo.fromMap(Map<String, dynamic> map) {
    return Memo(
      id: map['id'] as int?,
      title: map['title'] as String,
      imageBytes: List<int>.from(map['imageBytes']),
      text: map['text'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'imageBytes': imageBytes,
      'text': text,
    };
  }
}