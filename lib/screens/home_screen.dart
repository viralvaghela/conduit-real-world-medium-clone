import 'dart:convert';

import 'package:conduit/models/globally_articles.dart';
import 'package:conduit/screens/myfeed_screen.dart';
import 'package:conduit/screens/myhome_screen.dart';
import 'package:conduit/widgets/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  bool isLoading = true;
  GlobalArticles globalArticles;
  TabController _tabController;

  @override
  initState() {
    super.initState();
    getGlobalArticles();
    setState(() {
      isLoading = false;
    });

    _tabController = TabController(vsync: this, initialIndex: 0, length: 2);
  }

  getGlobalArticles() async {
    var url = 'https://conduit.productionready.io/api/articles';
    var response = await http.get(url);
    var jsonRes = jsonDecode(response.body);
    globalArticles = GlobalArticles.fromJson(jsonRes);
    setState(() {
      isLoading = false;
    });
    print("article :" + globalArticles.articles[0].body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          actions: [
            Padding(
              padding: EdgeInsets.all(12),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.search),
              ),
            )
          ],
          bottom: TabBar(
            controller: _tabController,
            tabs: [
              Tab(
                text: "Global Feed",
              ),
              Tab(
                text: "My Feed",
              ),
            ],
          ),
        ),
        drawer: drawer(),
        body: isLoading == true
            ? Center(
                child: CircularProgressIndicator(),
              )
            : TabBarView(
                controller: _tabController,
                children: [MyFeed(), GlobalFeed()]));
  }
}
