class GlobalArticles {
  List<Articles> articles;
  int articlesCount;

  GlobalArticles({this.articles, this.articlesCount});

  GlobalArticles.fromJson(Map<String, dynamic> json) {
    if (json['articles'] != null) {
      articles = new List<Articles>();
      json['articles'].forEach((v) {
        articles.add(new Articles.fromJson(v));
      });
    }
    articlesCount = json['articlesCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.articles != null) {
      data['articles'] = this.articles.map((v) => v.toJson()).toList();
    }
    data['articlesCount'] = this.articlesCount;
    return data;
  }
}

class Articles {
  String title;
  String slug;
  String body;
  String createdAt;
  String updatedAt;
  List<String> tagList;
  String description;
  Author author;
  bool favorited;
  int favoritesCount;

  Articles(
      {this.title,
        this.slug,
        this.body,
        this.createdAt,
        this.updatedAt,
        this.tagList,
        this.description,
        this.author,
        this.favorited,
        this.favoritesCount});

  Articles.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    slug = json['slug'];
    body = json['body'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    tagList = json['tagList'].cast<String>();
    description = json['description'];
    author =
    json['author'] != null ? new Author.fromJson(json['author']) : null;
    favorited = json['favorited'];
    favoritesCount = json['favoritesCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['body'] = this.body;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['tagList'] = this.tagList;
    data['description'] = this.description;
    if (this.author != null) {
      data['author'] = this.author.toJson();
    }
    data['favorited'] = this.favorited;
    data['favoritesCount'] = this.favoritesCount;
    return data;
  }
}

class Author {
  String username;
  String bio;
  String image;
  bool following;

  Author({this.username, this.bio, this.image, this.following});

  Author.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    bio = json['bio'];
    image = json['image'];
    following = json['following'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['bio'] = this.bio;
    data['image'] = this.image;
    data['following'] = this.following;
    return data;
  }
}
