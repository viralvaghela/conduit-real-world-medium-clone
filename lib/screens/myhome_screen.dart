import 'dart:convert';

import 'package:conduit/models/globally_articles.dart';
import 'package:conduit/models/loggedin_user.dart';
import 'package:conduit/utils/global_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class GlobalFeed extends StatefulWidget {
  @override
  _GlobalFeedState createState() => _GlobalFeedState();
}

class _GlobalFeedState extends State<GlobalFeed> {
  bool isLoading = true;

  GlobalArticles globalArticles;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getGlobalArticles();
    getCurrentUser();
  }

  getCurrentUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.getString("userToken");
    var url = 'https://conduit.productionready.io/api/user';
    var response =
        await http.get(url, headers: {"Authorization": "Token $token"});

    setState(() {
      var jsonData = jsonDecode(response.body);
      loggedinUser = LoggedinUser.fromJson(jsonData);
      print(loggedinUser.user.username);
    });
  }

  getGlobalArticles() async {
    var url = 'https://conduit.productionready.io/api/articles';
    var response = await http.get(url);

    setState(() {
      var jsonData = jsonDecode(response.body);
      globalArticles = GlobalArticles.fromJson(jsonData);
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                  children: globalArticles.articles.map((index) {
                return Card(
                  child: Column(
                    children: [
                      ListTile(
                        leading: index.author.image != null
                            ? Image.network(index.author.image)
                            : Text(" "),
                        title: Text(index.author.username),
                        subtitle: index.author.bio != null
                            ? Text(index.author.bio)
                            : Text(" "),
                        trailing:
                            index.author.username != loggedinUser.user.username
                                ? IconButton(
                                    icon: Icon(Icons.person_add),
                                    onPressed: () =>
                                        followUser(index.author.username),
                                  )
                                : Text(" "),
                      ),
                      index.body != null
                          ? Text(index.body, textAlign: TextAlign.left)
                          : Container(),
                      Row(
                        children: [
                          IconButton(
                              icon: Icon(Icons.favorite_border),
                              onPressed: () {}),
                        ],
                      )
                    ],
                  ),
                );
              }).toList()),
            ),
    );
  }

  followUser(username) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.getString("userToken");
    var url = "https://conduit.productionready.io/api/profiles/:" +
        username +
        "/follow";
    print(token);
    var response =
        await http.post(url, headers: {"Authorization": "Token $token"});

    setState(() {
      var jsonData = jsonDecode(response.body);
      print(jsonData);
    });
  }
}
