import '../../domain/entities/posts.dart';

class PostsModel extends Posts {
  const PostsModel({
    int? id,
    required String title,
    required String body,
  }) : super(id: id, title: title, body: body);

  factory PostsModel.fromJson(Map<String, dynamic> json) {
    return PostsModel(title: json['title'], body: json['body'], id: json['id']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'body': body};
  }
}
