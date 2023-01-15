import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../screen/papel_controller.dart';

class PaperPrint extends HookConsumerWidget {
  const PaperPrint({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final paper = ref.watch(paperProvider);
    return LayoutBuilder(builder: (context, constraints) {
      return Stack(
        children: [
          Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(
                color: Colors.black,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              reverse: true,
              child: AnimatedSize(
                duration: const Duration(milliseconds: 100),
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    ...paper
                        .map(
                          (e) => Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            height: 20,
                            width: double.maxFinite,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Row(
                              children: [
                                const Center(
                                  child: Text('.'),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      e.number ?? '',
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                  child: Center(
                                    child: Text(e.symbol ?? ''),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.maxFinite,
              height: constraints.maxHeight / 2,
              decoration: BoxDecoration(
                color: Colors.black12,
                border: Border.all(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
