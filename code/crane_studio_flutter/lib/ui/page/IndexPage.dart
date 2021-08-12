import 'package:cached_network_image/cached_network_image.dart';
import 'package:crane_studio_flutter/bean/app_list_entity.dart';
import 'package:crane_studio_flutter/ui/base/BaseState.dart';
import 'package:crane_studio_flutter/ui/base/V.dart';
import 'package:crane_studio_flutter/utils/ArrayUtils.dart';
import 'package:crane_studio_flutter/utils/ConfigUtils.dart';
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
        padding: EdgeInsets.fromLTRB(80, 40, 80, 40),
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
    double h = 200;
    if (item != null) {
      return Container(
        width: w,
        height: h,
        child: Column(
          children: [
            V.buildNetImageView(item.icon, 50),
            SizedBox(height: 10),
            V.buildText(
              '${item.getName()}',
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                V.buildImage(R.app_store, w: 100, h: 20),
                V.buildImage(R.googleplay, w: 100, h: 20),
              ],
            )
          ],
        ),
      );
    }
    return SizedBox(width: w, height: h);
  }

  void _loadData() {
    ConfigUtils.loadAppList(context).then((list) {
      setState(() {
        appList = list;
      });
    });
  }
}
