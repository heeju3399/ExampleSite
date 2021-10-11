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
    List<MainContent> allContentItem = <MainContent>[
      MainContent(createTime: '9999', userId: 'admin', visible: 1, children: <MainComment>[
        MainComment(visible: 1,createTime: '9999', comment: '난알아요', userId: 'admin!!'),
      ], content: '오케이', badCount: 0, likeCount: 0, viewCount: 0),
      MainContent(createTime: '9999', userId: 'admin', visible: 1, children: <MainComment>[
        MainComment(visible: 1,createTime: '9999', comment: '난알아요', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '0049', comment: '우와 ', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '0505', comment: '우왕', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '4040', comment: 'ㅅㄴㅂ;;ㅇ,;ㅅ[게', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '9999', comment: '퀴즈탐험', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '9999', comment: '난알아요', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '0049', comment: '우와 ', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '0505', comment: '우왕', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '4040', comment: 'ㅅㄴㅂ;;ㅇ,;ㅅ[게', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '9999', comment: '퀴즈탐험', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '9999', comment: '난알아요', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '0049', comment: '우와 ', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '0505', comment: '우왕', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '4040', comment: 'ㅅㄴㅂ;;ㅇ,;ㅅ[게', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '9999', comment: '퀴즈탐험', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '9999', comment: '난알아요', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '0049', comment: '우와 ', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '0505', comment: '우왕', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '4040', comment: 'ㅅㄴㅂ;;ㅇ,;ㅅ[게', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '9999', comment: '퀴즈탐험', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '9999', comment: '난알아요', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '0049', comment: '우와 ', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '0505', comment: '우왕', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '4040', comment: 'ㅅㄴㅂ;;ㅇ,;ㅅ[게', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '9999', comment: '퀴즈탐험', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '9999', comment: '난알아요', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '0049', comment: '우와 ', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '0505', comment: '우왕', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '4040', comment: 'ㅅㄴㅂ;;ㅇ,;ㅅ[게', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '9999', comment: '퀴즈탐험', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '9999', comment: '난알아요', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '0049', comment: '우와 ', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '0505', comment: '우왕', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '4040', comment: 'ㅅㄴㅂ;;ㅇ,;ㅅ[게', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '9999', comment: '퀴즈탐험', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '9999', comment: '난알아요', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '0049', comment: '우와 ', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '0505', comment: '우왕', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '4040', comment: 'ㅅㄴㅂ;;ㅇ,;ㅅ[게', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '9999', comment: '퀴즈탐험', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '9999', comment: '난알아요', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '0049', comment: '우와 ', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '0505', comment: '우왕', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '4040', comment: 'ㅅㄴㅂ;;ㅇ,;ㅅ[게', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '9999', comment: '퀴즈탐험', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '9999', comment: '난알아요', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '0049', comment: '우와 ', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '0505', comment: '우왕', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '4040', comment: 'ㅅㄴㅂ;;ㅇ,;ㅅ[게', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '9999', comment: '퀴즈탐험', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '9999', comment: '난알아요', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '0049', comment: '우와 ', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '0505', comment: '우왕', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '4040', comment: 'ㅅㄴㅂ;;ㅇ,;ㅅ[게', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '9999', comment: '퀴즈탐험', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '9999', comment: '난알아요', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '0049', comment: '우와 ', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '0505', comment: '우왕', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '4040', comment: 'ㅅㄴㅂ;;ㅇ,;ㅅ[게', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '9999', comment: '퀴즈탐험', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '9999', comment: '난알아요', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '0049', comment: '우와 ', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '0505', comment: '우왕', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '4040', comment: 'ㅅㄴㅂ;;ㅇ,;ㅅ[게', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '9999', comment: '퀴즈탐험', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '9999', comment: '난알아요', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '0049', comment: '우와 ', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '0505', comment: '우왕', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '4040', comment: 'ㅅㄴㅂ;;ㅇ,;ㅅ[게', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '9999', comment: '퀴즈탐험', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '9999', comment: '난알아요', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '0049', comment: '우와 ', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '0505', comment: '우왕', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '4040', comment: 'ㅅㄴㅂ;;ㅇ,;ㅅ[게', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '9999', comment: '퀴즈탐험', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '9999', comment: '난알아요', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '0049', comment: '우와 ', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '0505', comment: '우왕', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '4040', comment: 'ㅅㄴㅂ;;ㅇ,;ㅅ[게', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '9999', comment: '퀴즈탐험', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '9999', comment: '난알아요', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '0049', comment: '우와 ', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '0505', comment: '우왕', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '4040', comment: 'ㅅㄴㅂ;;ㅇ,;ㅅ[게', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '9999', comment: '퀴즈탐험', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '9999', comment: '난알아요', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '0049', comment: '우와 ', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '0505', comment: '우왕', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '4040', comment: 'ㅅㄴㅂ;;ㅇ,;ㅅ[게', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '9999', comment: '퀴즈탐험', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '9999', comment: '난알아요', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '0049', comment: '우와 ', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '0505', comment: '우왕', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '4040', comment: 'ㅅㄴㅂ;;ㅇ,;ㅅ[게', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '9999', comment: '퀴즈탐험', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '9999', comment: '난알아요', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '0049', comment: '우와 ', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '0505', comment: '우왕', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '4040', comment: 'ㅅㄴㅂ;;ㅇ,;ㅅ[게', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '9999', comment: '퀴즈탐험', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '9999', comment: '난알아요', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '0049', comment: '우와 ', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '0505', comment: '우왕', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '4040', comment: 'ㅅㄴㅂ;;ㅇ,;ㅅ[게', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '9999', comment: '퀴즈탐험', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '9999', comment: '난알아요', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '0049', comment: '우와 ', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '0505', comment: '우왕', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '4040', comment: 'ㅅㄴㅂ;;ㅇ,;ㅅ[게', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '9999', comment: '퀴즈탐험', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '9999', comment: '난알아요', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '0049', comment: '우와 ', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '0505', comment: '우왕', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '4040', comment: 'ㅅㄴㅂ;;ㅇ,;ㅅ[게', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '9999', comment: '퀴즈탐험', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '9999', comment: '난알아요', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '0049', comment: '우와 ', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '0505', comment: '우왕', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '4040', comment: 'ㅅㄴㅂ;;ㅇ,;ㅅ[게', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '9999', comment: '퀴즈탐험', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '9999', comment: '난알아요', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '0049', comment: '우와 ', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '0505', comment: '우왕', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '4040', comment: 'ㅅㄴㅂ;;ㅇ,;ㅅ[게', userId: 'admin!!'),
        MainComment(visible: 1,createTime: '9999', comment: '퀴즈탐험', userId: 'admin!!'),

      ], content: '오로롱', badCount: 0, likeCount: 0, viewCount: 0),
      MainContent(createTime: '9999', userId: 'admin', visible: 1, children: <MainComment>[], content: '홍금보닷', badCount: 0, likeCount: 10, viewCount: 0),
      MainContent(createTime: '9999', userId: 'admin', visible: 1, children: <MainComment>[], content: '웃웃', badCount: 0, likeCount: 0, viewCount: 20),
    ];

    return Future.delayed(Duration(seconds: 1), () {
      return allContentItem;
    });
  }
}

class MainContent {
  //const Item(this.createTime,  this.userId,  this.visible,  this.children,  this.content, this.badCount,  this.likeCount,  this.viewCount, [this.children = const <Comment>[]] );
  const MainContent({required this.createTime, required this.userId, required this.visible, required this.children, required this.content, required this.badCount, required this.likeCount, required this.viewCount});
  final String content;
  final int likeCount;
  final int badCount;
  final int viewCount;
  final String userId;
  final String createTime;
  final int visible;
  final List<MainComment> children;
}

class MainComment {
  const MainComment({required this.comment, required this.visible, required this.userId, required this.createTime});
  final String comment;
  final int visible;
  final String userId;
  final String createTime;
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
