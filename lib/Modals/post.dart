class Post{
  final int userId;
  final int id;
  final String title;
  final String body;
  
  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(dynamic json){
    return Post(id: json['id'], body: json['body'], title: json['title'], userId: json['userId']);
  } 


}