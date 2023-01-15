import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DigitWidget extends StatelessWidget {
  const DigitWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  final String item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final maxHeight = constraints.maxHeight;
          final maxWidth = constraints.maxHeight / 2;
          if (item == '.') {
            return Align(
              alignment: Alignment.bottomRight,
              child: Container(
                height: maxHeight / 10,
                width: maxWidth / 5,
                decoration: const BoxDecoration(
                  color: Colors.black,
                ),
              ),
            );
          }
          if (item == ',') {
            return Align(
              alignment: Alignment.bottomRight,
              child: Container(
                height: maxHeight / 5,
                width: maxWidth / 5,
                decoration: const BoxDecoration(
                  color: Colors.black,
                ),
              ),
            );
          }
          final itemParsed = int.tryParse(item) ?? 99;
          final digit = Digit.fromNumber(itemParsed);
          return SizedBox(
            width: maxWidth,
            height: maxHeight,
            child: Stack(
              children: [
                if (digit.top)
                  Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      height: maxHeight / 10,
                      width: double.maxFinite,
                      child: const Trace(),
                    ),
                  ),
                if (digit.middle)
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: maxHeight / 10,
                      width: double.maxFinite,
                      child: const Trace(),
                    ),
                  ),
                if (digit.bottom)
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      height: maxHeight / 10,
                      width: double.maxFinite,
                      child: const Trace(),
                    ),
                  ),
                if (digit.righBottom)
                  Align(
                    alignment: Alignment.bottomRight,
                    child: SizedBox(
                      width: maxHeight / 10,
                      height: maxHeight / 2,
                      child: const Trace(),
                    ),
                  ),
                if (digit.righTop)
                  Align(
                    alignment: Alignment.topRight,
                    child: SizedBox(
                      width: maxHeight / 10,
                      height: maxHeight / 2,
                      child: const Trace(),
                    ),
                  ),
                if (digit.leftBottom)
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: SizedBox(
                      width: maxHeight / 10,
                      height: maxHeight / 2,
                      child: const Trace(),
                    ),
                  ),
                if (digit.leftTop)
                  Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                      width: maxHeight / 10,
                      height: maxHeight / 2,
                      child: const Trace(),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class Digit {
  final bool top;
  final bool middle;
  final bool bottom;
  final bool righTop;
  final bool righBottom;
  final bool leftTop;
  final bool leftBottom;
  Digit({
    this.top = false,
    this.middle = false,
    this.bottom = false,
    this.righTop = false,
    this.righBottom = false,
    this.leftTop = false,
    this.leftBottom = false,
  });

  factory Digit.fromNumber(int number) {
    switch (number) {
      case 0:
        return Digit(
          top: true,
          bottom: true,
          righBottom: true,
          righTop: true,
          leftBottom: true,
          leftTop: true,
        );
      case 1:
        return Digit(
          righBottom: true,
          righTop: true,
        );
      case 2:
        return Digit(
          top: true,
          bottom: true,
          righTop: true,
          leftBottom: true,
          middle: true,
        );
      case 3:
        return Digit(
          top: true,
          bottom: true,
          righBottom: true,
          righTop: true,
          middle: true,
        );
      case 4:
        return Digit(
          righBottom: true,
          righTop: true,
          leftTop: true,
          middle: true,
        );
      case 5:
        return Digit(
          top: true,
          bottom: true,
          righBottom: true,
          leftTop: true,
          middle: true,
        );
      case 6:
        return Digit(
          top: true,
          bottom: true,
          righBottom: true,
          leftBottom: true,
          leftTop: true,
          middle: true,
        );
      case 7:
        return Digit(
          top: true,
          righBottom: true,
          righTop: true,
          leftTop: true,
        );
      case 8:
        return Digit(
          top: true,
          bottom: true,
          righBottom: true,
          righTop: true,
          leftBottom: true,
          leftTop: true,
          middle: true,
        );
      case 9:
        return Digit(
          top: true,
          bottom: true,
          righBottom: true,
          righTop: true,
          leftTop: true,
          middle: true,
        );
      default:
        return Digit();
    }
  }
}

class Trace extends HookConsumerWidget {
  const Trace({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.all(2),
      width: double.maxFinite,
      height: double.maxFinite,
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
    );
  }
}
