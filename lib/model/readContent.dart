class ReadContentResponse {
  final String createTime;
  final String content;
  final String userId;
  final String visible;
  final String comment;

  final int stateCode;

  ReadContentResponse({ required this.createTime, required this.content, required this.userId, required this.stateCode, required this.visible, required this.comment});

  factory ReadContentResponse.fromJson(Map<dynamic,dynamic> json) {
    return ReadContentResponse(
      content: json['message'],
      userId: json['userid'],
      stateCode: json['stateCode'],
      comment: json['comment'],
      createTime: json['createtime'],
      visible: json['visible'],
    );
  }
}

//??또 사용해야할까?
class ReadContent {
  final String createTime;
  final String content;
  final String userId;
  final String visible;
  final String comment;
  final int stateCode;

  ReadContent({ required this.createTime, required this.content, required this.userId, required this.stateCode, required this.visible, required this.comment});

  factory ReadContent.fromJson(Map<dynamic,dynamic> json) {
    return ReadContent(
      content: json['message'],
      userId: json['userid'],
      stateCode: json['stateCode'],
      comment: json['comment'],
      createTime: json['createtime'],
      visible: json['visible'],
    );
  }
}



class Item {
  const Item(this.title, [this.children = const <Item>[]]);
  final String title;
  final List<Item> children;
}


List<Item> allContentItem = <Item>[
  Item(
    'Chapter A',
    <Item>[
      Item('Section A0'),
      Item('Section A1'),
      Item('Section A2'),
    ],
  ),
  Item(
    'Chapter B',
    <Item>[
      Item('Section B0'),
      Item('Section B1'),
    ],
  ),
];


// class Item {
//   const Item(this.title, [this.children = const <Item>[]]);
//   final String title;
//   final List<Item> children;
// }
//
// // Data to display.
// List<Item> allContentItem = <Item>[
//   Item(
//     'Chapter A',
//     <Item>[
//       Item(
//         'Section A0',
//         <Item>[
//           Item('Item A0.1'),
//           Item('Item A0.2'),
//         ],
//       ),
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
//     <Item>[
//       Item('Section B0'),
//       Item('Section B1'),
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
//     <Item>[
//       Item('Section B0'),
//       Item('Section B1'),
//     ],
//   ),
//   Item(
//     'Chapter B',
//     <Item>[
//       Item('Section B0'),
//       Item('Section B1'),
//     ],
//   ),
// ];
//

