import 'dart:convert';

import 'package:conduit/models/globally_articles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
                            : Container(),
                        title: Text(index.author.username),
                        subtitle: index.author.bio != null
                            ? Text(index.author.bio)
                            : Text(" "),
                      ),
                      Card(child:index.body!=null ? Text(index.body):Container(),)
                    ],
                  ),
                );
              }).toList()),
            ),
    );
  }
}
