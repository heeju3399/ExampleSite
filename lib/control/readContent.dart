import 'package:web/server/nodeServer.dart';

class ReadContentControl {
//   static Future<Map> getContent() async {
//     Map resultMap = Map();
//
//     await NodeServer.getContents().then((value) => {
//       result = value
//     });
//     print('============================?? $result =');
//     if (result) {
//       resultMap = {'title': 'pass', 'message': ''};
//     } else {
//       resultMap = {'title': '에러', 'message': '알수없는 에러'};
//     }
//
//     print('return map : $resultMap');
//     return resultMap;
//   }



  static Future<List> getContentData() async {
    List<Item> allContentItem = <Item>[
      Item(
        'Chapter A',
        <Comment>[
          Comment('Section A0'),
          Comment('Section A1'),
          Comment('Section A2'),
        ],
      ),
      Item(
        'Chapter B',
        <Comment>[
          Comment('Section B0'),
          Comment('Section B1'),
        ],
      ),
    ];

    return Future.delayed(Duration(seconds: 1), () {
      return allContentItem;
    });
  }
}

class Item {
  const Item(this.title, [this.children = const <Comment>[]] );
  final String title;
  final List<Comment> children;
}

class Comment {
  const Comment(this.title);
  final String title;
}
//
// List<Item> allContentItem = <Item>[
//   Item(
//     'Chapter A',
//     true,
//     <Comment>[
//       Comment('Section A0'),
//       Comment('Section A1'),
//       Comment('Section A2'),
//     ],
//   ),
//   Item(
//     'Chapter B',
//     true,
//     <Comment>[
//       Comment('Section B0'),
//       Comment('Section B1'),
//     ],
//   ),
// ];
//
// class Item {
//   const Item(this.title, [this.children = const <Item>[]]);
//
//   final String title;
//   final int commentCount;
//   final int likeCount;
//   final int badCount;
//   final int viewCount;
//   final String createDateTime;
//   final List<Comment> children;
// }
//
// class Comment {
//   const Comment(this.title, [this.children = const <Item>[]]);
//   final String createDateTime;
// }
//
// List<Item> allContentItem = <Item>[
//   Item(
//     'Chapter A',
//     <Item>[
//       Item('Section A0'),
//       Item('Section A1'),
//       Item('Section A2'),
//     ],
//   ),
//   Item(
//     'Chapter B',
//     <Item>[
//       Item('Section B0'),
//       Item('Section B1'),
//     ],
//   ),
//   Item(
//     'Chapter B',
//
//   ),
//
// ];