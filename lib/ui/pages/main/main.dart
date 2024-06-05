
import 'package:flutter/material.dart';

import 'initialize_items.dart';

class HYMainScreen  extends StatefulWidget{
  static const String routeName = '/main';

  const HYMainScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _HYMainPageState();
  }

}
class _HYMainPageState extends State<HYMainScreen>{
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:IndexedStack(
        index:  _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: items,
        currentIndex:   _currentIndex,
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    ) ;
  }
}