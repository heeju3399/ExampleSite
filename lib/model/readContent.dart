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
