class Posts {
  final int userId;
  final int id;
  final String title;
  final String body;


  Posts({
    required this.body,
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Posts.fromJson(Map<String, dynamic> json) {
    return Posts(
      body: json['body'],
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}
