import 'package:flutter/material.dart';

class VerticalSpace extends StatelessWidget {
  const VerticalSpace(this.value, {Key? key}) : super(key: key);

  final double value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: value,
    );
  }
}

class HorizontalSpace extends StatelessWidget {
  const HorizontalSpace(this.value, {Key? key}) : super(key: key);

  final double value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: value,
    );
  }
}
