import 'package:conduit/screens/myfeed_screen.dart';
import 'package:conduit/screens/myhome_screen.dart';
import 'package:conduit/widgets/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  initState() {
    super.initState();

    getCurrentUser();

    _tabController = TabController(vsync: this, initialIndex: 0, length: 2);
  }

  getCurrentUser() async {}

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
                text: "My Feed",
              ),
              Tab(
                text: "Global Feed",
              ),
            ],
          ),
        ),
        drawer: drawer(),
        body: TabBarView(
            controller: _tabController, children: [MyFeed(), GlobalFeed()]));
  }
}
