import 'package:drt/Components/API_Calls.dart';
import 'package:drt/Components/Search_Bar.dart';
import 'package:flutter/material.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  _homePageState createState() => _homePageState();
}

//This page works as the background model which holds all the other widgets.

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: searchBar()
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            getOrderValues();
            getCryptoValues();
          });
        },
        backgroundColor: Colors.blue,
        child: Icon(Icons.refresh),
      ),
    );
  }
}
