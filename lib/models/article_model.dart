class ArticlesModel {
  ArticlesModel({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });
  late final Source source;
  late final String author;
  late final String title;
  late final String description;
  late final String url;
  late final String urlToImage;
  late final String publishedAt;
  late final String content;

  ArticlesModel.fromJson(Map<String, dynamic> json) {
    source = Source.fromJson(json['source']);
    author = json['author'].toString();
    title = json['title'].toString();
    description = json['description'].toString();
    url = json['url'].toString();
    urlToImage = json['urlToImage'].toString();
    publishedAt = json['publishedAt'].toString();
    content = json['content'].toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['source'] = source.toJson();
    data['author'] = author;
    data['title'] = title;
    data['description'] = description;
    data['url'] = url;
    data['urlToImage'] = urlToImage;
    data['publishedAt'] = publishedAt;
    data['content'] = content;
    return data;
  }
}

class Source {
  Source({
    required this.id,
    required this.name,
  });
  late final String id;
  late final String name;

  Source.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    name = json['name'].toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
