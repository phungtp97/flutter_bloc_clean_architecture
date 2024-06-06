import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  Widget square(double size) {
    return SizedBox(
      height: size,
      width: size,
      child: this,
    );
  }

  Widget pad([double? a, double? b, double? c, double? d]) {
    EdgeInsets mPad;

    if (d != null) {
      mPad = EdgeInsets.only(left: a!, right: b!, top: c!, bottom: d);
    } else if (c != null) {
      mPad = EdgeInsets.only(left: a!, right: b!, top: c);
    } else if (b != null) {
      mPad = EdgeInsets.symmetric(vertical: a!, horizontal: b);
    } else if (a != null) {
      mPad = EdgeInsets.all(a);
    } else {
      mPad = EdgeInsets.zero;
    }

    return Padding(
      padding: mPad,
      child: this,
    );
  }

  Widget marg([double? a, double? b, double? c, double? d]) {
    EdgeInsets mPad;

    if (d != null) {
      mPad = EdgeInsets.only(left: a!, right: b!, top: c!, bottom: d);
    } else if (c != null) {
      mPad = EdgeInsets.only(left: a!, right: b!, top: c);
    } else if (b != null) {
      mPad = EdgeInsets.symmetric(vertical: a!, horizontal: b);
    } else if (a != null) {
      mPad = EdgeInsets.all(a);
    } else {
      mPad = EdgeInsets.zero;
    }

    return Padding(
      padding: mPad,
      child: this,
    );
  }

  Widget circleRect(double size, {Color? color}) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(size / 2)),
      child: Container(
        height: size,
        width: size,
        color: color,
        child: this,
      ),
    );
  }

  Widget inkTap({required Function onTap}) {
    return InkWell(
      onTap: () => onTap.call(),
      child: this,
    );
  }

  Widget shadow({required List<BoxShadow> shadows}) {
    return this;
  }

  Widget rectAll(double radius,
      {Color? color, Color? borderColor, double? borderWidth}) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      child: Container(
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(radius)),
            border: Border.all(
                color: borderColor ?? Colors.white, width: borderWidth ?? 0)),
        child: this,
      ),
    );
  }

  Widget expand({int? flex}) {
    return Expanded(
      flex: flex ?? 1,
      child: this,
    );
  }

  Widget center() => Center(child: this,);
}
