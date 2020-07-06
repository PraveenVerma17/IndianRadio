class Movie{
  
  final int id;
  final String url;
  final String imgUrl;
  final String name;

  Movie({this.id, this.name, this.url, this.imgUrl});

  factory Movie.fromJson(dynamic json){
    return Movie(id: json['id'], name: json['name'], url: json['url'], imgUrl: json['imgUrl']);
  }

}