import 'package:flutter/material.dart';
import 'package:web/model/mainContentTileColor.dart';

class AllContentPage extends StatelessWidget {
  const AllContentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => ContentItem(data[index]),
      itemCount: data.length,
    );
  }
}

// One entry in the multilevel list displayed by this app.
class Item {
  const Item(this.title, [this.children = const <Item>[]]);

  final String title;
  final List<Item> children;
}

// Data to display.
const List<Item> data = <Item>[
  Item(
    'Chapter A',
    <Item>[
      Item(
        'Section A0',
        <Item>[
          Item('Item A0.1'),
          Item('Item A0.2'),
        ],
      ),
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
  Item(
    'Chapter B',
    <Item>[
      Item('Section B0'),
      Item('Section B1'),
    ],
  ),
  Item(
    'Chapter B',
    <Item>[
      Item('Section B0'),
      Item('Section B1'),
    ],
  ),
  Item(
    'Chapter B',
    <Item>[
      Item('Section B0'),
      Item('Section B1'),
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

// Displays one Entry. If the entry has children then it's displayed
// with an ExpansionTile.
class ContentItem extends StatelessWidget {
  const ContentItem(this.entry);
  final Item entry;

  Widget _buildItem(Item root) {
    print('title ${root.title}');
    print('build tiles call ${root.children.toString()}');
    print('skip? 00 ${root.children.skip(0)}');
    print('list>?????????? ${root.children.map(_buildItem).toList()}');
    if (root.children.isEmpty)
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          selectedTileColor: MainContentModel.tileColor,
          tileColor: MainContentModel.tileColor,
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  root.title,
                  style: TextStyle(color: MainContentModel.textColor),
                  textScaleFactor: 2,
                ),
              ],
            ),
          ),
          onTap: () {
            print('?????????? $root');
          },
        ),
      );
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ExpansionTile(
        subtitle:
            //Text('생성일 (2002-05-08)',style: TextStyle(color: MainContentModel.textColor),),
            Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            subTitle(0),
            subTitle(1),
            subTitle(2),
            subTitle(3),
            subTitle(4),
          ],
        ),
        collapsedBackgroundColor: MainContentModel.backgroundColor,
        backgroundColor: MainContentModel.backgroundColor,
        trailing: Icon(
          Icons.comment,
          color: MainContentModel.iconColor,
        ),
        onExpansionChanged: (v) {
          print('뭐지이건? : $v');
        },
        //열었을때 작업뭐할지 정하는 메소드

        key: PageStorageKey<Item>(root),
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'sdffsdfsfs? ${root.title}',
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: MainContentModel.textColor),
                textScaleFactor: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  likeAndBadIcon(0),
                  likeAndBadIcon(1),
                ],
              ),
            ],
          ),
        ),
        children: root.children.map(_buildItem).toList(),
      ),
    );
  }

  Widget subTitle(int flag) {
    return Container(
        width: 120,
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          if (flag == 0) Row(children: [Icon(Icons.comment, color: MainContentModel.iconColor), Text('  ( 5 ) ', style: TextStyle(color: MainContentModel.textColor))]),
          if (flag == 1) Row(children: [Icon(Icons.favorite, color: MainContentModel.iconColor), Text('  ( 5 )', style: TextStyle(color: MainContentModel.textColor))]),
          if (flag == 2) Row(children: [Icon(Icons.mood_bad, color: MainContentModel.iconColor), Text('  ( 5 )', style: TextStyle(color: MainContentModel.textColor))]),
          if (flag == 3) Row(children: [Icon(Icons.remove_red_eye, color: MainContentModel.iconColor), Text('  ( 5 )', style: TextStyle(color: MainContentModel.textColor))]),
          if (flag == 4) MainContentModel.myText('2020-08-08'),
        ]));
  }

  Widget likeAndBadIcon(int flag) {
    return InkWell(
        onTap: () {
          print('$flag 패쓰');
        },
        child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [if (flag == 0) Icon(Icons.favorite, color: MainContentModel.iconColor), if (flag == 1) Padding(
              padding: const EdgeInsets.only(left: 20, right: 10),
              child: Icon(Icons.mood_bad, color: MainContentModel.iconColor),
            )]));
  }

  @override
  Widget build(BuildContext context) {
    return _buildItem(entry);
  }
}
