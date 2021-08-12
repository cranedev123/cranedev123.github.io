import 'package:crane_studio_flutter/bean/app_list_entity.dart';
import 'package:crane_studio_flutter/ui/base/V.dart';
import 'package:crane_studio_flutter/ui/color/MyColors.dart';
import 'package:crane_studio_flutter/utils/ArrayUtils.dart';
import 'package:crane_studio_flutter/utils/ConfigUtils.dart';
import 'package:crane_studio_flutter/utils/JumpUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../r.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();

  IndexPage();
}

class _IndexPageState extends State<IndexPage> {
  List<AppItem> appList = [];

  int spanCount = 4;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        padding: EdgeInsets.fromLTRB(80, 100, 80, 40),
        itemBuilder: _itemBuilder,
        itemCount: (ArrayUtils.getCount(appList) / spanCount).floor() + 1,
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    double padding = 20;

    List<Widget> _arrWidgets = [];
    for (int i = 0; i < spanCount; i++) {
      if (i > 0) {
        _arrWidgets.add(SizedBox(width: padding));
      }
      _arrWidgets.add(
          _buildProItem(ArrayUtils.getItem(appList, index * spanCount + i)));
    }

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _arrWidgets,
      ),
    );
  }

  Widget _buildProItem(AppItem? item) {
    double w = 200;
    double h = 300;
    if (item != null) {
      Widget _itemView = Container(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
        width: w,
        height: h,
        child: Column(
          children: [
            V.buildNetImageView(item.icon, 150, radius: 30),
            SizedBox(height: 30),
            V.buildText('${item.getName()}', color: MyColors.white),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                V.buildImage(R.app_store, w: 100, h: 25),
                V.buildImage(R.googleplay, w: 100, h: 25),
              ],
            )
          ],
        ),
      );
      return GestureDetector(
        onTap: () {
          JumpUtils.openUrl(item.link);
        },
        child: _itemView,
      );
    }
    return SizedBox(width: w, height: h);
  }

  void _loadData() {
    ConfigUtils.loadAppListFromAssets(context).then((list) {
      setState(() {
        appList = list;
      });
    });
  }
}
