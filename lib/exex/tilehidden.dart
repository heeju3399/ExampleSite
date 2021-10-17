// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class AjuScreen extends StatefulWidget {
//   const AjuScreen({Key? key}) : super(key: key);
//
//   @override
//   _EXTileHiddenState createState() => _EXTileHiddenState();
// }
//
// class _EXTileHiddenState extends State<AjuScreen> {
//
//   bool isShowListTile = false;
//
//   Widget listTileAju(){
//     Visibility(
//       visible: isShowListTile,
//       child: new ListTile(
//         title: new Text("Aju List"),
//         onTap: () {
//           Navigator.pop(context);
//           Navigator.push(context,
//               new MaterialPageRoute(builder: (context) => new AjuScreen()));
//         },
//       ),
//     );
//   }
//
//   @override
//   void initState() async {
//     super.initState();
//
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     roleAju = (pref.getStringList('role_aju') ?? 'Something Went Wrong');
//     if (roleAju != null) {
//       if (mounted) {
//         setState(() {
//           isShowListTile = true;
//         });
//       }
//     } else {
//       if (mounted) {
//         setState(() {
//           isShowListTile = false;
//         });
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
// }
//
