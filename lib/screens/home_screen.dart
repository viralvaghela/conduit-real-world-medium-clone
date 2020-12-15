import 'package:conduit/services/User.dart';
import 'package:conduit/utils/global_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isLoading = true;

  @override
  initState() {
    super.initState();
   // User.getCurrentUser();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isLoading == true
            ? Text("")
            : Text("${GlobalData.loggedinUser.user.username}"),
      ),
      body: isLoading == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Text("${GlobalData.loggedinUser.user.email}"),
    );
  }
}
