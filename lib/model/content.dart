// class MainContentDataModel {
//   //const Item(this.createTime,  this.userId,  this.visible,  this.children,  this.content, this.badCount,  this.likeCount,  this.viewCount, [this.children = const <Comment>[]] );
//   const MainContentDataModel(
//       {required this.contentId,
//       required this.createTime,
//       required this.userId,
//       required this.visible,
//       required this.children,
//       required this.content,
//       required this.badCount,
//       required this.likeCount,
//       required this.viewCount});
//
//   final int contentId;
//   final String content;
//   final int likeCount;
//   final int badCount;
//   final int viewCount;
//   final String userId;
//   final String createTime;
//   final String visible;
//   final List<MainCommentDataModel> children;
//
//   factory MainContentDataModel.fromJson(Map<dynamic, dynamic> json) {
//     return MainContentDataModel(
//       contentId: json['contentid'],
//       content: json['content'],
//       userId: json['userid'],
//       createTime: json['createtime'],
//       visible: json['visible'],
//       badCount: json['bad'],
//       children: json['comment'],
//       likeCount: json['like'],
//       viewCount: json['view'],
//     );
//   }
// }

class MainContentDataModel {
  //const Item(this.createTime,  this.userId,  this.visible,  this.children,  this.content, this.badCount,  this.likeCount,  this.viewCount, [this.children = const <Comment>[]] );
  const MainContentDataModel(
      {required this.contentId,
        required this.createTime,
        required this.userId,
        required this.visible,
        required this.children,
        required this.content,
        required this.badCount,
        required this.likeCount,
        required this.viewCount});

  final int contentId;
  final String content;
  final int likeCount;
  final int badCount;
  final int viewCount;
  final String userId;
  final String createTime;
  final String visible;
  final List<dynamic> children;

  factory MainContentDataModel.fromJson(Map<dynamic, dynamic> json) {
    return MainContentDataModel(
      contentId: json['contentid'],
      content: json['content'],
      userId: json['userid'],
      createTime: json['createtime'],
      visible: json['visible'],
      badCount: json['bad'],
      children: json['comment'],
      likeCount: json['like'],
      viewCount: json['view'],
    );
  }
}

class MainCommentDataModel {
  const MainCommentDataModel({required this.comment, required this.visible, required this.userId, required this.createTime});

  final String comment;
  final String visible;
  final String userId;
  final String createTime;

  factory MainCommentDataModel.fromJson(Map<dynamic, dynamic> json) {
    return MainCommentDataModel(
      visible: json['visible'],
      createTime: json['createtime'],
      userId: json['userid'],
      comment: json['content'],
    );
  }
}


class ResponseContent {
  const ResponseContent({required this.mainDashContent});
  final List<dynamic> mainDashContent;


  factory ResponseContent.fromJson(Map<dynamic, dynamic> json) {
    return ResponseContent(mainDashContent: json['maindashcontent']);
  }
}

class ResponseUserContent {
  const ResponseUserContent({required this.mainDashContent});
  final List<dynamic> mainDashContent;


  factory ResponseUserContent.fromJson(Map<dynamic, dynamic> json) {
    return ResponseUserContent(mainDashContent: json['maindashcontent']);
  }
}
