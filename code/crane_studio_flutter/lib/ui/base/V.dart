import 'dart:io';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:crane_studio_flutter/ui/color/MyColors.dart';
import 'package:crane_studio_flutter/utils/CommonUtils.dart';
import 'package:crane_studio_flutter/utils/ConfigUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../r.dart';

class V {
  static Widget buildNotifyWidget(Widget child, Function callback) {
    if (child == null) {
      return SizedBox();
    }
    return NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification is ScrollStartNotification) {
            if (callback != null) {
              callback(false);
            }
          } else if (scrollNotification is ScrollUpdateNotification) {
            if (callback != null) {
              callback(true);
            }
          } else if (scrollNotification is ScrollEndNotification) {
            if (callback != null) {
              callback(false);
            }
          }
          return false;
        },
        child: child);
  }

  /// CupertinoPageScaffold
  static Widget buildPage(BuildContext context, String title, Widget child,
      {List<Widget> actionItems = const [],
      bool showBottomLine = true,
      bool showNavigationBar = true,
      bool isBgTranslate = false,
      bool useSafeArea = true,
      Widget? leading}) {
    Widget trailing = SizedBox();
    if (actionItems != null && actionItems.length > 0) {
      trailing = Wrap(
        direction: Axis.horizontal,
        alignment: WrapAlignment.end,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: actionItems,
      );
    }

    // if (leading == null) {
    //   leading = GestureDetector(
    //     onTap: () {
    //       Navigator.pop(context);
    //     },
    //     child: Container(
    //       width: 50,
    //       alignment: Alignment.centerLeft,
    //       child: Icon(
    //         Icons.arrow_back_ios,
    //         color: BaseColors.getTxtTitleColor(),
    //         size: 20,
    //       ),
    //     ),
    //   );
    // }
//    return CupertinoPageScaffold(
//      backgroundColor: BaseColors.getBgSettingColor(),
//      navigationBar: CupertinoNavigationBar(
//        backgroundColor: BaseColors.getNavBarBgColor(),
//        actionsForegroundColor: BaseColors.getNavBarColor(),
//        previousPageTitle: S.of(context).back,
////        middle: Text(S.of(context).add_success_diary),
////        trailing: GestureDetector(
////          child: Text(
////            S.of(context).choose_color,
////            style: TextStyle(color: CusColors.whiteColor),
////          ),
////          onTap: chooseColor,
////        ),
//      ),
//      child: _buildContent(),
//      resizeToAvoidBottomInset: true,
//    );

    return Theme(
        data: ThemeData(
            primaryColor: MyColors.white,
            accentColor: MyColors.white,
            cursorColor: MyColors.txt_black,
            hintColor: MyColors.text_hint,
            backgroundColor:
                isBgTranslate ? MyColors.transparent : MyColors.white,
            dividerColor: MyColors.divider),
        child: CupertinoPageScaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor:
                isBgTranslate ? MyColors.transparent : MyColors.white,
            navigationBar: showNavigationBar
                ? CupertinoNavigationBar(
//            leading: GestureDetector(
//              onTap: () {
//                Navigator.of(context).pop();
//              },
//              child: Container(
//                padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
//                child: Image.asset(
//                  R.icon_back,
//                  width: 8,
//                  height: 8,
//                  fit: BoxFit.contain,
//                ),
//              ),
//            ),
                    padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                    leading: leading,
                    middle: Text(
                      '$title',
                      style: TextStyle(
                          fontSize: 17,
                          color: MyColors.txt_black,
                          fontWeight: FontWeight.bold),
                    ),
                    trailing: trailing,
                    backgroundColor:
                        isBgTranslate ? MyColors.transparent : MyColors.white,
//                    actionsForegroundColor: BaseColors.getNavBarColor(),
                    border: Border(
                        bottom: BorderSide(
                            color: showBottomLine
                                ? MyColors.divider
                                : MyColors.divider,
                            width: 0.5)),
                  )
                : null,
            child: useSafeArea ? SafeArea(child: child) : child));
  }

  /// Text Button
  static Widget buildButtonText(String txt, Function onClicked,
      {double fontSize = 14,
      Color color = MyColors.txt_black,
      int maxLines = 10,
      FontWeight fontWeight = FontWeight.normal,
      TextAlign textAlign = TextAlign.start}) {
    return GestureDetector(
      onTap: () {
        if (onClicked != null) {
          onClicked();
        }
      },
      child: buildText(txt,
          fontSize: fontSize,
          color: color,
          maxLines: maxLines,
          fontWeight: fontWeight,
          textAlign: textAlign),
    );
  }

  /// TextView
  static Widget buildText(String txt,
      {double fontSize = 14,
      Color? color,
      int maxLines = 10,
      FontWeight fontWeight = FontWeight.normal,
      TextAlign textAlign = TextAlign.start}) {
    if (CommonUtils.isStringEmpty(txt)) {
      txt = '';
    }
    if (color == null) {
      color = MyColors.txt_black;
    }
    return Text(
      '$txt',
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
      style: TextStyle(
          color: color,
          fontFamily: 'Roboto',
          fontSize: fontSize,
          decoration: TextDecoration.none,
          fontWeight: fontWeight),
    );
  }

  /// ImageView from asset
  static Widget buildImage(String img,
      {double w = 20,
      double h = -1,
      BoxFit fit = BoxFit.contain,
      Color? color}) {
    if (h < 0) {
      h = w;
    }
    return Image.asset(
      '$img',
      width: w,
      height: h,
      fit: fit,
      color: color,
    );
  }

  /// ImageVIew from url
  static Widget buildNetImageView(String imageUrl, double w,
      {String placeholder = R.app_store,
        double aspectRatio = 1 / 1,
        double radius = 0}) {
    return Container(
      width: w,
      child: AspectRatio(
          aspectRatio: aspectRatio,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(radius),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                placeholder: (BuildContext context, String url) =>
                    Image.asset(placeholder),
                fit: BoxFit.cover,
              ))),
    );
  }

  // /// ImageButton
  // static Widget buildImageButton(String img,
  //     {double w = 20,
  //     double h = -1,
  //     BoxFit fit = BoxFit.contain,
  //     Color color,
  //     Function onClicked}) {
  //   return GestureDetector(
  //     onTap: onClicked,
  //     child: buildImage(img, w: w, color: color, fit: fit, h: h),
  //   );
  // }

  // /// CommonLoading View
  // static Widget buildLoadingView() {
  //   return Container(
  //       width: double.infinity,
  //       height: double.infinity,
  //       child: Center(
  //           child: SpinKitThreeBounce(
  //         color: MyColors.txt_eeeeee,
  //         size: 30,
  //       )));
  // }
  //
  // static Widget buildLoadingHeaderFootor() {
  //   return SpinKitThreeBounce(
  //     color: MyColors.txt_orange,
  //     size: 20,
  //   );
  // }

  /// CommonError View
  static Widget buildErrorView({String errorMsg = ''}) {
    if (CommonUtils.isStringEmpty(errorMsg)) {
      errorMsg = '木有数据哦';
    }
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Container(
        height: double.infinity,
        color: MyColors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
//            buildImage(R.empty_project, w: 100),
            SizedBox(
              height: 15,
            ),
            buildText(
              errorMsg,
              fontSize: 14,
              color: MyColors.txt_grey,
            ),
          ],
        ),
      ),
    );
  }

  /// Button
  static Widget buildButton(String txt, Function onClicked,
      {double fontSize = 14,
      Color bgColor = MyColors.transparent,
      Color color = MyColors.white,
      int maxLines = 10,
      FontWeight fontWeight = FontWeight.normal,
      TextAlign textAlign = TextAlign.center,
      double height = 40}) {
    return FlatButton(
      color: bgColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          side: BorderSide(
              color: MyColors.white, style: BorderStyle.solid, width: 2)),
      clipBehavior: Clip.antiAlias,
      onPressed: () {
        if (onClicked != null) {
          onClicked();
        }
      },
      child: Container(
        alignment: Alignment.center,
        height: height,
        child: Text('$txt',
            maxLines: maxLines,
            textAlign: textAlign,
            style: TextStyle(
                color: color,
                fontSize: fontSize,
                decoration: TextDecoration.none,
                fontWeight: fontWeight)),
      ),
    );
  }

  /// EditText
  static Widget buildEditText(TextEditingController controller, String hint,
      {Function? onChanged,
      String initTxt = '',
      TextInputType textInputType = TextInputType.text,
      int maxLines = 1,
      FocusNode? focusNode}) {
    bool obscureText = textInputType == TextInputType.visiblePassword;
    double height = maxLines > 1 ? 1.5 : 1.3;
    if (controller != null) {
      controller.addListener(() {
        if (controller.text == 'null') {
          controller.text = '';
        }
      });
    }
    return CupertinoTextField(
      autofocus: false,
      controller: controller,
//      strutStyle: StrutStyle(forceStrutHeight: true, height: 1, leading: 1),

//                      onChanged: onChanged,
      maxLines: maxLines,
      obscureText: obscureText,
      style: TextStyle(
        color: MyColors.white,
        fontSize: 14,
        fontStyle: FontStyle.normal,
        height: height,
      ),
      placeholderStyle: TextStyle(
          color: Colors.white70,
          fontSize: 14,
          fontStyle: FontStyle.normal,
          height: height),
      cursorWidth: 1.5,
      focusNode: focusNode,
      keyboardType: textInputType,
      cursorRadius: Radius.circular(2),
      cursorColor: MyColors.white,
//      onChanged: onChanged,
      textAlign: TextAlign.end,
      placeholder: hint,
      decoration: BoxDecoration(color: MyColors.transparent),

//        decoration: InputDecoration(
//            fillColor: Colors.white,
//            border: OutlineInputBorder(borderSide: BorderSide.none),
//            contentPadding: EdgeInsets.fromLTRB(10.0, 10, 0, 10),
//            hintText: hint,
//            hintStyle: TextStyle(color: MyColors.text_hint))
    );
  }

  static Widget buildRowKeyValue(String key, String value,
      {Color keyColor = MyColors.txt_black,
      Color valueColor = MyColors.txt_grey,
      double minKeyWidth = 80,
      Widget rightButton = const SizedBox()}) {
    return Container(
      alignment: Alignment.center,
      constraints: BoxConstraints(minHeight: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            child: V.buildText('$key', color: keyColor),
            constraints: BoxConstraints(minWidth: minKeyWidth),
          ),
          Expanded(
            flex: 1,
            child: V.buildText('$value', color: valueColor),
          ),
          rightButton,
        ],
      ),
    );
  }

  static Widget buildRowKeyValueEdit(
      String key, String hint, TextEditingController controller,
      {Function? onChanged,
      String value = '',
      TextInputType textInputType = TextInputType.text,
      Color keyColor = MyColors.white,
      Color valueColor = MyColors.white,
      double minKeyWidth = 80,
      FocusNode? focusNode}) {
    return Container(
      alignment: Alignment.center,
      constraints: BoxConstraints(minHeight: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: V.buildText('$key', color: keyColor),
            constraints: BoxConstraints(minWidth: minKeyWidth),
          ),
          Expanded(
            flex: 1,
            child: V.buildEditText(controller, hint,
                textInputType: textInputType,
                onChanged: onChanged,
//                focusNode: focusNode,
                initTxt: value),
          )
        ],
      ),
    );
  }

  /// 输入备注 多行输入
  static Widget buildRowKeyValueEditBz(
      String key, String hint, TextEditingController controller,
      {Function? onChanged,
      String value = '',
      TextInputType textInputType = TextInputType.text,
      Color keyColor = MyColors.txt_black,
      Color valueColor = MyColors.txt_grey}) {
    double minKeyWidth = 80;
    return Container(
      alignment: Alignment.center,
      constraints: BoxConstraints(minHeight: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            child: V.buildText('$key', color: keyColor),
            constraints: BoxConstraints(minWidth: minKeyWidth),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  border: Border.all(width: 0.5, color: MyColors.divider)),
              child: V.buildEditText(controller, hint,
                  maxLines: 5,
                  textInputType: textInputType,
                  onChanged: onChanged,
                  initTxt: value),
            ),
          )
        ],
      ),
    );
  }

  static void displayDatePicker(
    BuildContext context,
    DateTime initialDate,
    Function callback, {
    DateTime? startDate,
  }) {
//    _showDatePickerAndroid(context, initialDate, callback,
//        startDate: startDate);
    if (Platform.isIOS) {
      _showCupertinoDatePickerIos(context, initialDate, callback,
          startDate: startDate);
    } else {
      _showDatePickerAndroid(context, initialDate, callback,
          startDate: startDate);
    }
  }

  static void _showDatePickerAndroid(
    BuildContext context,
    DateTime initialDate,
    Function callback, {
    DateTime? startDate,
  }) async {
    if (startDate == null) {
      startDate = DateTime(1990);
    }
    if (initialDate == null) {
      initialDate = DateTime.now();
    }
    var result = await showDatePicker(
        initialDatePickerMode: DatePickerMode.day,
        context: context,
        initialDate: initialDate,
        firstDate: startDate,
        lastDate: DateTime.now());
    if (result != null) {
      if (callback != null) {
        callback(result);
      }
    }
  }

  static void _showCupertinoDatePickerIos(
    BuildContext context,
    DateTime initialDate,
    Function callback, {
    DateTime? startDate,
  }) {
    if (startDate == null) {
      startDate = DateTime(2000);
    }
    if (initialDate == null) {
      initialDate = DateTime.now();
    }
    final picker = CupertinoDatePicker(
      onDateTimeChanged: (date) {
        if (callback != null) {
          callback(date);
        }
      },
      mode: CupertinoDatePickerMode.date,
      initialDateTime: initialDate,
      minimumDate: startDate,
      maximumDate: DateTime.now(),
    );

    showCupertinoModalPopup(
        context: context,
        builder: (cxt) {
          return Container(
            color: MyColors.white,
            height: 200,
            child: picker,
          );
        });
  }

  static Widget buildButtonIcon(IconData icondata, Function onClicked,
      {Color bgColor = MyColors.transparent, double w = 0}) {
    double size = ConfigUtils.getScaleSize();
    if (w <= 0) {
      w = 30;
    }
    return RaisedButton(
      padding: EdgeInsets.all(10),
      onPressed: () {
        if (onClicked != null) {
          onClicked();
        }
      },
      highlightColor: bgColor,
      color: bgColor,
      child: Icon(
        icondata,
        size: w,
        color: Colors.white,
      ),
      shape: CircleBorder(
        side: BorderSide(color: Colors.white, width: 2),
      ),
    );
  }

  static Widget buildLightIcon(IconData icondata, Function onClicked,
      {Color bgColor = MyColors.transparent, double w = 0}) {
    double size = ConfigUtils.getScaleSize();
    if (w <= 0) {
      w = 30 * size;
    }
    return RaisedButton(
      padding: EdgeInsets.all(2 * size),
      onPressed: () {
        if (onClicked != null) {
          onClicked();
        }
      },
      highlightColor: bgColor,
      color: bgColor,
      child: Icon(
        icondata,
        size: w,
        color: Colors.white,
      ),
      shape: CircleBorder(
        side: BorderSide(color: Colors.white, width: 2),
      ),
    );
  }

  static Widget buildDivider() {
    return Divider(
      color: MyColors.divider,
    );
  }

  static Widget buildLogoView() {
    return Container(
        height: 100,
        width: 100,
        padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
        decoration: BoxDecoration(
            border: Border.all(color: MyColors.text_hint, width: 1.0),
            borderRadius: BorderRadius.circular(18)),
        child: Image.asset(
          R.app_store,
          height: 100,
          width: 100,
          fit: BoxFit.cover,
        ));
  }

  static Widget buildLargeAView(
      {double w = 300,
      double h = 250,
      String text = '',
      double txtSize = 30,
      bool showAd = true}) {
    return Container(
      padding: EdgeInsets.all(5),
      width: w,
      height: h,
      color: Colors.transparent,
//      decoration:
//          BoxDecoration(border: Border.all(color: Colors.white, width: 1)),
      child: Stack(
        overflow: Overflow.clip,
        fit: StackFit.loose,
        alignment: Alignment.center,
        children: <Widget>[
//          Image.asset(
//            '',
//            fit: BoxFit.cover,
//            width: w,
//            height: h,
//          ),
          Text(text,
              style: TextStyle(
                  color: MyColors.white,
                  fontSize: txtSize,
//                  fontFamily: Const.COMMON_FONT_NAME,
                  fontWeight: FontWeight.w700)),
          // (showAd != null && showAd)
          //     ? AUtils.getAView(size: 'large', maxHeight: h)
          //     : SizedBox()
        ],
      ),
    );
  }
}
