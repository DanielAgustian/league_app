import 'package:flutter/cupertino.dart';


class FlexBox extends StatelessWidget {
  final int? lg;
  final int? md;
  final int? sm;
  final int init;
  final double spacingHorizontal;

  final Widget child;
  const FlexBox({
    super.key,
    this.lg,
    this.md,
    this.sm,
    required this.init,
    required this.spacingHorizontal,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: widthGenerator(size),
      child: child,
    );
  }

  double widthGenerator(Size size) {
    int width = 0;
    if (size.width > 1000) {
      width = lg ?? md ?? sm ?? init;
    } else if (size.width > 700) {
      width = md ?? sm ?? init;
    } else if (size.width > 500) {
      width = sm ?? init;
    } else {
      width = init;
    }
    print(width);
    return (width / 12) * size.width - spacingHorizontal;
  }
}
