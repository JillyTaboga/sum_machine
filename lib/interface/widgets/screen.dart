import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'digit_widget.dart';

class ScreenWidget extends StatelessWidget {
  const ScreenWidget({
    Key? key,
    required this.number,
  }) : super(key: key);

  final double number;

  @override
  Widget build(BuildContext context) {
    final screenText = NumberFormat.decimalPattern().format(number);
    return Container(
      margin: const EdgeInsets.all(8),
      width: double.maxFinite,
      height: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.orangeAccent,
        border: Border.all(
          color: Colors.black,
          width: 5,
        ),
      ),
      padding: const EdgeInsets.all(10),
      child: LayoutBuilder(builder: (context, constraints) {
        final lines = (constraints.maxHeight / 5).floor();
        final columns = (constraints.maxWidth / 5).floor();
        return Stack(
          children: [
            Container(
              width: double.maxFinite,
              height: double.maxFinite,
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                ),
                color: Colors.green.shade900,
              ),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                reverse: true,
                itemCount: screenText.length,
                itemBuilder: (context, index) {
                  final item = screenText.split('').reversed.toList()[index];
                  return DigitWidget(item: item);
                },
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                lines,
                (index) => Container(
                  height: 1,
                  width: double.maxFinite,
                  color: Colors.black26,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                columns,
                (index) => Container(
                  height: double.maxFinite,
                  width: 1,
                  color: Colors.black12,
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
