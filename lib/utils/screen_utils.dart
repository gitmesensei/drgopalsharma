import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
//  import'package:fluttertoast/fluttertoast.dart';

class ScreenUtil {
  static late ScreenUtil _instance;

  static const int defaultWidth = 414;
  static const double defaultHeight = 896;
  static late double _screenWidth;

  static late double _screenHeight;
  static late double _pixelRatio;

  static late double _statusBarHeight;

  static late double _bottomBarHeight;
  static late double _textScaleFactor;

  /// The offset from the bottom.
  static double get bottomBarHeight => _bottomBarHeight;

  /// The size of the media in logical pixels (e.g, the size of the screen).
  static double get pixelRatio => _pixelRatio;

  ///The vertical extent of this size. dp
  static double get screenHeight => _screenHeight / _pixelRatio;

  /// The vertical extent of this size. px
  static double get screenHeightPx => _screenHeight;

  /// The horizontal extent of this size.
  static double get screenWidth => _screenWidth / _pixelRatio;

  /// The vertical extent of this size. px
  static double get screenWidthPx => _screenWidth;

  /// The offset from the top
  static double get statusBarHeight => _statusBarHeight / _pixelRatio;

  /// The offset from the top
  static double get statusBarHeightPx => _statusBarHeight;

  /// The number of font pixels for each logical pixel.
  static double get textScaleFactor => _textScaleFactor;

  /// Size of the phone in UI Design , px
  late num uiWidthPx;

  late num uiHeightPx;

  /// allowFontScaling Specifies whether fonts should scale to respect Text Size accessibility settings. The default is false.
  late bool allowFontScaling;

  factory ScreenUtil() {
    return _instance;
  }

  ScreenUtil._();

  double get scaleHeight =>
      (_screenHeight - _statusBarHeight - _bottomBarHeight) / uiHeightPx;

  double get scaleText => scaleWidth;

  /// The ratio of the actual dp to the design draft px
  double get scaleWidth => screenWidth / uiWidthPx;

  /// Height function
  /// Highly adaptable to the device according to UI Design
  /// It is recommended to use this method to achieve a high degree of adaptation
  /// when it is found that one screen in the UI design
  /// does not match the current style effect, or if there is a difference in shape.
  double setHeight(num height) => height * scaleHeight;

  ///FontSize function
  ///@param [fontSize] UI in px.
  ///Font size adaptation method
  ///@param [fontSize] The size of the font on the UI design, in px.
  ///@param [allowFontScaling]
  double setSp(num fontSize, {bool allowFontScalingSelf = false}) =>
      allowFontScalingSelf
          ? (allowFontScalingSelf
              ? (fontSize * scaleText)
              : ((fontSize * scaleText) / _textScaleFactor))
          : (allowFontScaling
              ? (fontSize * scaleText)
              : ((fontSize * scaleText) / _textScaleFactor));

  /// Width function
  /// Adapted to the device width of the UI Design.
  /// Height can also be adapted according to this to ensure no deformation ,
  /// if you want a square
  double setWidth(num width) => width * scaleWidth;

  static void init(
      {num width = defaultWidth,
      num height = defaultHeight,
      bool allowFontScaling = false}) {
    _instance = ScreenUtil._();
    _instance.uiWidthPx = width;
    _instance.uiHeightPx = height;
    _instance.allowFontScaling = allowFontScaling;
    _pixelRatio = window.devicePixelRatio;
    _screenWidth = window.physicalSize.width;
    _screenHeight = window.physicalSize.height;
    _statusBarHeight = window.padding.top;
    _bottomBarHeight = window.padding.bottom;
    _textScaleFactor = window.textScaleFactor;
  }

  static void showToast(String msg, Color color, BuildContext context,
      {StyledToastPosition? position}) {
    if (msg.isNotEmpty) {
      //Interactive toast, set [isIgnoring] false.
      showToastWidget(
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child: Text(
              msg,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
        context: context,
        duration: const Duration(seconds: 3),
        animation: StyledToastAnimation.fade,
        position: position ??
            const StyledToastPosition(
                align: Alignment.bottomCenter, offset: 60.0),
        reverseAnimation: StyledToastAnimation.fade,
      );
      /* Fluttertoast.showToast(
          msg: msg,
          textColor: AppColor.royalGreen,
          // fontSize: 8,
          // toastLength: Toast.LENGTH_SHORT,
          // gravity: ToastGravity.BOTTOM,
          backgroundColor: color,
          timeInSecForIosWeb: 1,
      );*/
    }
  }
}
