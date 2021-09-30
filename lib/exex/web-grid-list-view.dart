import 'dart:async';
import 'package:ionicons/ionicons.dart';
import 'package:flutter/material.dart';
import 'package:web/exex/sliver.dart';
import '../responsive.dart';

class MainDash extends StatefulWidget {
  const MainDash({Key? key}) : super(key: key);
  static String routeName = '/MAIN_DASH';

  @override
  _MainDashState createState() => _MainDashState();
}

class _MainDashState extends State<MainDash> {
  bool floatingBTN = false;
  bool appBarCenterTitle = true;
  final List<String> items = List<String>.generate(0, (i) => 'Item $i');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Container(child: Responsive.isLarge(context) ? isWindow(context) : isMobile(context)),
      floatingActionButton: floatingBTN
          ? null
          : FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }

  //mobile
  Widget isMobile(BuildContext context) {
    floatingBTN = false;
    appBarCenterTitle = false;
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          // 앱바의 높이 설정
          expandedHeight: 150.0,
          // SliverAppBar 공간에 어떤 위젯을 만들지 설정
          flexibleSpace: FlexibleSpaceBar(
            title: Text('Sliver Example'),
          ),
          backgroundColor: Colors.deepOrangeAccent,
          pinned: true,
        ),
        SliverList(
          //   delegate: SliverChildListDelegate([
          // customCard('1'),
          // customCard('2'),
          // customCard('3'),
          // customCard('4'),
          // customCard('5'),          ])
          delegate: SliverChildBuilderDelegate((context, index) {
            return Container(
              child: customCard('list count : $index'),
            );
          }, childCount: 100),
        ),
      ],
    );
  }

  // //window
  Widget isWindow(BuildContext context) {
    floatingBTN = true;
    appBarCenterTitle = true;
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          // 앱바의 높이 설정
          expandedHeight: 150.0,
          // SliverAppBar 공간에 어떤 위젯을 만들지 설정
          flexibleSpace: FlexibleSpaceBar(
            title: Text('Example Site',style: TextStyle(color: Colors.white),),
          ),
          backgroundColor: Colors.black,
          pinned: true,
        ),
        SliverGrid(
          delegate: SliverChildBuilderDelegate((context, index) {
            return Container(
              child: customStack('$index'),
            );
          }, childCount: 100),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
          ),
        ),
      ],
    );
  }

  Widget customStack(String text) {
    return Center(
      child: Stack(
        children: [
          Container(
            width: 200,
            height: 200,
            color: Colors.red,
            child: Text('zzz : $text'),
          )
        ],
      ),
    );
  }

  Widget customCard(String text) {
    return Card(
      child: Container(
        height: 50,
        child: Center(
          child:
          Text(
            text,
            style: TextStyle(fontSize: 40),
          ),

        ),
      ),
    );
  }
}


