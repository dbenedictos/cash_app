import 'package:flutter/material.dart';

//
class ElevatedContainer extends StatelessWidget {
  const ElevatedContainer({
    this.child,
    this.padding,
    this.margin,
    super.key,
  });

  final Widget? child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;

  int hehe1() {
    return 1 + 2;
  }

  int hehe2() {
    return 1 + 2;
  }

  int hehe3() {
    return 1 + 2;
  }

  int hehe4() {
    return 1 + 2;
  }

  int hehe5() {
    return 1 + 2;
  }

  int hehe6() {
    return 1 + 2;
  }

  int hehe7() {
    return 1 + 2;
  }

  int hehe8() {
    return 1 + 2;
  }

  int hehe9() {
    return 1 + 2;
  }

  int hehe10() {
    return 1 + 2;
  }

  int hehe11() {
    return 1 + 2;
  }

  int hehe12() {
    return 1 + 2;
  }

  int hehe13() {
    return 1 + 2;
  }

  int hehe14() {
    return 1 + 2;
  }

  int hehe15() {
    return 1 + 2;
  }

  int hehe16() {
    return 1 + 2;
  }

  int hehe17() {
    return 1 + 2;
  }

  int hehe18() {
    return 1 + 2;
  }

  int hehe19() {
    return 1 + 2;
  }

  int hehe20() {
    return 1 + 2;
  }

  int hehe21() {
    return 1 + 2;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.all(32),
      margin: margin,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26.withOpacity(.1),
            offset: const Offset(5, 5),
            spreadRadius: 5,
            blurRadius: 19,
          )
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}
