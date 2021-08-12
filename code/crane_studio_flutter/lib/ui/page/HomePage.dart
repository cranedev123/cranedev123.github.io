import 'package:crane_studio_flutter/ui/base/V.dart';
import 'package:crane_studio_flutter/ui/color/MyColors.dart';
import 'package:crane_studio_flutter/ui/page/IndexPage.dart';
import 'package:crane_studio_flutter/utils/JumpUtils.dart';
import 'package:flutter/cupertino.dart';
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
  List<String> titles = ["首页", "项目", "联系我们"];

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
      backgroundColor: MyColors.bg,
      appBar: AppBar(
        backgroundColor: MyColors.bg,
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
                labelColor: MyColors.white,
                unselectedLabelColor: MyColors.txt_grey,
                labelStyle: TextStyle(
                    color: MyColors.white,
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
        Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildTos('Privacy Policy',
                        'https://cranedev123.github.io/release/privacy.html'),
                    SizedBox(width: 5),
                    V.buildText('|', color: MyColors.white),
                    SizedBox(width: 5),
                    _buildTos('Terms of Service',
                        'https://cranedev123.github.io/release/tos.html')
                  ],
                ),
                SizedBox(height: 15),
                V.buildText(
                    'Copyright © 2018-2021 CraneStudio, Inc. All rights reserved.',
                    color: MyColors.txt_grey),
              ],
            ))
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

  Widget _buildTos(String txt, String link) {
    return GestureDetector(
      onTap: () {
        JumpUtils.openUrl(link);
      },
      child: V.buildText(txt, color: MyColors.white),
    );
  }
}
