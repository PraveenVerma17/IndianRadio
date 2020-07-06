class Station{

  final int id;
  final String name;
  final String url;
  final String image;

  Station({this.id, this.name, this.url, this.image});

  factory Station.fromJson(dynamic json){
    return Station(id: json['id'], name: json['name'], url: json['url'], image: json['image']);
  }

}