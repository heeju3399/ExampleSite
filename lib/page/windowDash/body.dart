import 'package:flutter/material.dart';



class Body extends StatelessWidget {
  const Body({required this.textFiledMap, Key? key}) : super(key: key);

  final Map textFiledMap;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      width: 1050,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.red,
                height: 100,
                width: 1000,
                child: Text(
                  'filed : ${textFiledMap.values.join('getTextFiledMap')}',
                  textScaleFactor: 4,
                ),
              )
            ],
          ),
          Container(
            color: Colors.deepPurpleAccent,
            height: 1000,
          ),
          Container(
            color: Colors.yellow,
            height: 1000,
          ),
          Container(
            color: Colors.orange,
            height: 1000,
          ),
        ],
      ),
    );
  }
}
