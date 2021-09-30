import 'package:flutter/material.dart';
import 'dart:math' as math;

class SliverPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SliverPage();
}

class _SliverPage extends State<SliverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
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
          // SliverPersistentHeader(
          //   delegate: _HeaderDelegate(
          //     minHeight: 50,
          //     maxHeight: 150,
          //     child: Container(
          //       color: Colors.blue,
          //       child: Center(
          //         child: Column(
          //           children: [
          //             Text(
          //               '숫자?',
          //               style: TextStyle(fontSize: 30),
          //             ),
          //           ],
          //           mainAxisAlignment: MainAxisAlignment.center,
          //         ),
          //       ),
          //     ),
          //   ),
          //   pinned: true,
          // ),
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
          // SliverPersistentHeader(
          //   delegate: _HeaderDelegate(
          //     minHeight: 50,
          //     maxHeight: 150,
          //     child: Container(
          //       color: Colors.red,
          //       child: Center(
          //         child: Column(
          //           children: [
          //             Text(
          //               '숫자?',
          //               style: TextStyle(fontSize: 30),
          //             ),
          //           ],
          //           mainAxisAlignment: MainAxisAlignment.center,
          //         ),
          //       ),
          //     ),
          //   ),
          //   pinned: true,
          // ),
          // SliverGrid(
          //   // delegate: SliverChildListDelegate([
          //   //   customCard('1'),
          //   //   customCard('2'),
          //   //   customCard('3'),
          //   //   customCard('4'),
          //   //   customCard('5'),
          //   // ]),
          //   // gridDelegate:
          //   //     SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 20)
          //   //
          //   delegate: SliverChildBuilderDelegate((context, index) {
          //     return Container(
          //       child: customCard('$index'),
          //     );
          //   }, childCount: 100),
          //   gridDelegate:
          //   SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 8),
          // ),
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

class _HeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _HeaderDelegate({required this.minHeight,required this.maxHeight,required this.child});

  @override
  bool shouldRebuild(_HeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }

  @override
  double get maxExtent {
    return math.max(maxHeight, minHeight);
  }

  @override
  double get minExtent {
    return minHeight;
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
      child: child,
    );
  }
}
