import 'package:flutter/material.dart';
import 'favor_content.dart';

class HYFavorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的收藏',style: TextStyle(color: Colors.white),),
        backgroundColor: Theme.of(context).primaryColorLight,
        centerTitle: true,
      ),
      body: HYFavorContent(),
    );
  }
}