// import 'package:crane_studio_flutter/bean/app_list_entity.dart';
// import 'package:crane_studio_flutter/ui/base/BaseState.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class MoreGamePage extends StatefulWidget {
//   MoreGamePage({Key? key}) : super(key: key);
//
//   @override
//   State<StatefulWidget> createState() {
//     return new _MoreGamePageState();
//   }
// }
//
// class _MoreGamePageState extends BaseState<MoreGamePage> {
//   List<AppItem> appList = [];
//
//   @override
//   void initState() {
//     super.initState();
//     loadData();
// //    AUtils.showBanner();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return V.buildPage(context, 'More', _buildContent());
//   }
//
//   Widget _buildContent() {
//     if (appList == null || appList.length <= 0) {
//       return Center(
//         // child: V.buildLoadingView(),
//       );
//     }
//     return Material(
//       type: MaterialType.transparency,
//       child: ListView.builder(
//         itemCount: appList.length,
//
// //        padding: EdgeInsets.all(15),
//         itemBuilder: (BuildContext context, int index) {
//           return _buildItem(index, appList[index]);
//         },
// //        shrinkWrap: true,
//       ),
//     );
//   }
//
//   Widget _buildItem(int index, AppItem appItem) {
//     double paddingBottom = index == appList.length - 1 ? 60 : 0;
//     String iconUrl =
//         CommonUtils.isStringEmpty(appItem.icon) ? '' : appItem.icon;
//     return ListTile(
//       contentPadding: EdgeInsets.fromLTRB(15, 15, 15, paddingBottom),
//       leading: ClipRRect(
//         borderRadius: BorderRadius.all(Radius.circular(10)),
//         child: Image.network(
//           iconUrl,
//           height: 50,
//           width: 50,
//           fit: BoxFit.cover,
//         ),
//       ),
//       title: V.buildText(appItem.getName(),
//           color: BaseColors.getTxtTitleColor(),
//           fontSize: 20,
//           fontWeight: FontWeight.normal),
//       onTap: () {
//         BaseJumpUtils.openUrl(appItem.link);
//       },
//       trailing:
//           Icon(CupertinoIcons.forward, color: BaseColors.getTxtDetailColor()),
//     );
//   }
//
//   void loadData() {
//     ConfigUtils.loadAppList(context).then((list) {
//       setState(() {
//         appList = list;
//       });
//     });
//   }
// }
