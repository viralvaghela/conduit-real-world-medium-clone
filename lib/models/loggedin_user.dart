class LoggedinUser {
  User user;

  LoggedinUser({this.user});

  LoggedinUser.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}

class User {
  int id;
  String email;
  String createdAt;
  String updatedAt;
  String username;
  String bio;
  String image;
  String token;

  User(
      {this.id,
        this.email,
        this.createdAt,
        this.updatedAt,
        this.username,
        this.bio,
        this.image,
        this.token});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    username = json['username'];
    bio = json['bio'];
    image = json['image'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['username'] = this.username;
    data['bio'] = this.bio;
    data['image'] = this.image;
    data['token'] = this.token;
    return data;
  }
}
