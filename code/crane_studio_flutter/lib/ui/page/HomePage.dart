import 'package:crane_studio_flutter/ui/color/MyColors.dart';
import 'package:crane_studio_flutter/ui/page/IndexPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  PageController _pageController = PageController();
  List<String> titles = ["首页", "项目", "我的"];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: titles.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leadingWidth: 300000,
        brightness: Brightness.dark,
        leading: Container(
          padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
          child: Wrap(
            children: [
              TabBar(
                tabs: <Tab>[
                  Tab(
                    text: titles[0],
                  ),
                  Tab(
                    text: titles[1],
                  ),
                  Tab(
                    text: titles[2],
                  ),
                ],
                indicatorColor: Colors.transparent,
                indicatorWeight: 5.0,
                controller: _tabController,
                labelColor: MyColors.txt_black,
                unselectedLabelColor: MyColors.txt_grey,
                labelStyle: TextStyle(
                    color: MyColors.txt_black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
                unselectedLabelStyle: TextStyle(
                    color: MyColors.txt_grey,
                    fontWeight: FontWeight.normal,
                    fontSize: 18),
                onTap: (index) {
                  _pageController.jumpToPage(index);
                },
              )
            ],
          ),
        ),
      ),
      body: _buildContent(),
    );
  }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // 底部
//       bottomNavigationBar: Material(
//         color: Colors.white,
//         child: TabBar(
//           tabs: <Tab>[
//             Tab(
//               text: titles[0],
//             ),
//             Tab(
//               text: titles[1],
//             ),
//             Tab(
//               text: titles[2],
//             ),
//           ],
//           indicatorColor: Colors.blue,
//           indicatorWeight: 5.0,
//           controller: _tabController,
//           labelColor: Colors.red,
//           unselectedLabelColor: Colors.grey,
//           onTap: (index) {
//             _pageController.jumpToPage(index);
//           },
//         ),
//       ),
//       body: PageView(
//         controller: _pageController,
//         children: <Widget>[
//           Text(titles[0]),
//           Text(titles[1]),
//           Text(titles[2])
// //          TopPageViewDemo(),
//         ],
//         onPageChanged: (index) {
//           _tabController?.animateTo(index);
//         },
//       ),
//     );
//   }

  Widget _buildContent() {
    double headerH = 70;
    return Stack(
      children: [
        PageView(
          controller: _pageController,
          children: <Widget>[
            IndexPage(),
            // Text(titles[1]),
            Text(titles[1]),
            Text(titles[2])
//          TopPageViewDemo(),
          ],
          onPageChanged: (index) {
            _tabController?.animateTo(index);
          },
        ),
        // TabBar(
        //   tabs: <Tab>[
        //     Tab(
        //       text: titles[0],
        //     ),
        //     Tab(
        //       text: titles[1],
        //     ),
        //     Tab(
        //       text: titles[2],
        //     ),
        //   ],
        //
        //   // indicatorColor: Colors.blue,
        //   indicatorWeight: 5.0,
        //   controller: _tabController,
        //   labelColor: Colors.red,
        //   unselectedLabelColor: Colors.grey,
        //   onTap: (index) {
        //     _pageController.jumpToPage(index);
        //   },
        // )
      ],
    );
  }
}
