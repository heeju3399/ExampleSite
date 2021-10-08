// import 'package:flutter/material.dart';
//
// class ExpansionTileExample extends StatelessWidget {
//   const ExpansionTileExample({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemBuilder: (BuildContext context, int index) => EntryItem(data[index]),
//       itemCount: data.length,
//     );
//   }
// }
//
// // One entry in the multilevel list displayed by this app.
// class Entry {
//   const Entry(this.title, [this.children = const <Entry>[]]);
//
//   final String title;
//   final List<Entry> children;
// }
//
// // Data to display.
// const List<Entry> data = <Entry>[
//   Entry(
//     'Chapter A',
//     <Entry>[
//       Entry(
//         'Section A0',
//         <Entry>[
//           Entry('Item A0.1'),
//           Entry('Item A0.2'),
//         ],
//       ),
//       Entry('Section A1'),
//       Entry('Section A2'),
//     ],
//   ),
//   Entry(
//     'Chapter B',
//     <Entry>[
//       Entry('Section B0'),
//       Entry('Section B1'),
//     ],
//   ),
//   Entry(
//     'Chapter B',
//     <Entry>[
//       Entry('Section B0'),
//       Entry('Section B1'),
//     ],
//   ),
//   Entry(
//     'Chapter B',
//     <Entry>[
//       Entry('Section B0'),
//       Entry('Section B1'),
//     ],
//   ),
//   Entry(
//     'Chapter B',
//     <Entry>[
//       Entry('Section B0'),
//       Entry('Section B1'),
//     ],
//   ),
//   Entry(
//     'Chapter B',
//     <Entry>[
//       Entry('Section B0'),
//       Entry('Section B1'),
//     ],
//   ),
//   Entry(
//     'Chapter B',
//     <Entry>[
//       Entry('Section B0'),
//       Entry('Section B1'),
//     ],
//   ),
//   Entry(
//     'Chapter B',
//     <Entry>[
//       Entry('Section B0'),
//       Entry('Section B1'),
//     ],
//   ),
//   Entry(
//     'Chapter B',
//     <Entry>[
//       Entry('Section B0'),
//       Entry('Section B1'),
//     ],
//   ),
//   Entry(
//     'Chapter B',
//     <Entry>[
//       Entry('Section B0'),
//       Entry('Section B1'),
//     ],
//   ),
// ];
//
// // Displays one Entry. If the entry has children then it's displayed
// // with an ExpansionTile.
// class EntryItem extends StatelessWidget {
//   const EntryItem(this.entry);
//
//   final Entry entry;
//
//   Widget _buildTiles(Entry root) {
//     print('build tiles call ${root.children.toString()}');
//     if (root.children.isEmpty)
//       return Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: ListTile(
//           title: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               root.title,
//               style: TextStyle(color: Colors.white),
//               textScaleFactor: 2,
//             ),
//           ),
//           onTap: () {
//             print('?????????? $root');
//           },
//
//         ),
//       );
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: ExpansionTile(
//         subtitle: Text('what?'),
//         key: PageStorageKey<Entry>(root),
//         //collapsedBackgroundColor: Colors.white,
//         //collapsedIconColor:
//         //iconColor: Colors.yellow,
//         title: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Text(
//             root.title,
//             style: TextStyle(color: Colors.white),
//             textScaleFactor: 2,
//           ),
//         ),
//         children: root.children.map(_buildTiles).toList(),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return _buildTiles(entry);
//   }
// }
