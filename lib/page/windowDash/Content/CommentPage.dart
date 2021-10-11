import 'package:flutter/material.dart';
import 'package:web/control/readContent.dart';
import 'package:web/model/mainContentTileColor.dart';

class CommentPage extends StatefulWidget {
  const CommentPage({Key? key, required this.content}) : super(key: key);
  final MainContent content;

  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  bool _showBackToTopButton = false;
  final _controller = ScrollController();

  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    _controller.dispose(); // dispose the controller
    super.dispose();
  }

  void _onPressed() {
    // Get the height you want to scroll to.
    //final screenHeight = MediaQuery.of(context).size.height;
   _controller.jumpTo(0);
    //_controller.animateTo(0, curve: Curves.easeOut, duration: Duration(seconds: 1));
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context);
        return Future(() => true);
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
            controller: _controller,
              physics: ScrollPhysics(),
              child: Center(
                child: Container(
                  alignment: Alignment.topCenter,
                  width: 1000,
                  child: Scrollbar(
                    isAlwaysShown: true,
                    showTrackOnHover: true,

                    child: ListView.builder(
                      //physics: NeverScrollableScrollPhysics(), //모바일 버젼에서는 활성화 시키기
                      itemBuilder: (BuildContext context, int index) {
                        print('listView Build pass int index???? $index');
                        print(widget.content.children.length);
                        MainComment item = widget.content.children[index];
                        return viewComment(item);
                      },
                      itemCount: widget.content.children.length,
                      shrinkWrap: true,
                      //physics: NeverScrollableScrollPhysics(), 모바일 버젼에서는 활성화 시키기
                    ),
                  ),
                ),
              ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _onPressed,
          child: Icon(Icons.arrow_upward),
        ),
      )
    );
  }

  Widget viewComment(MainComment item) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
            hoverColor: Colors.black,
            selectedTileColor: MainContentModel.tileColor,
            tileColor: MainContentModel.tileColor,
            //subtitle: ,
            title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Container(
                    width: 880,
                      child: Text(
                        '${item.comment}sldiafjksldiafjklfdjslakfjdsaklfjdsaklfjdsalkfjdsf90dsaf8ds09fds8fdasfadlskfdlskfjdssldiafjklfdjslakfjdsaklfjdsaklfjdsalkfjdsf90dsaf8ds09fds8fdasfadlskfdlskfjdssldiafjklfdjslakfjdsaklfjdsaklfjdsalkfjdsf90dsaf8ds09fds8fdasfadlskfdlskfjdssldiafjklfdjslakfjdsaklfjdsaklfjdsalkfjdsf90dsaf8ds09fds8fdasfadlskfdlskfjdssldiafjklfdjslakfjdsaklfjdsaklfjdsalkfjdsf90dsaf8ds09fds8fdasfadlskfdlskfjdslfdjslakfjdsaklfjdsaklfjdsalkfjdsf90dsaf8ds09fds8fdasfadlskfdlskfjds',
                        style: TextStyle(color: MainContentModel.textColor, fontSize: MainContentModel.basicFontSize),
                        maxLines: 5,
                        overflow: TextOverflow.clip,
                      )),
                  IconButton(
                      icon: Icon(
                        Icons.delete_forever,
                        color: MainContentModel.iconColor,
                        size: 30,
                      ),
                      onPressed: () {
                        print('pass');
                      })
                ]))));
  }
}
