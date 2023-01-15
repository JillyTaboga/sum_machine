import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../widgets/button.dart';
import '../widgets/paper.dart';
import '../widgets/screen.dart';
import 'math_controller.dart';
import 'papel_controller.dart';
import 'screen_controller.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenNumber = ref.watch(screenProvider);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: ScreenWidget(
                          number: screenNumber,
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: Button(
                                onTap: () {
                                  ref.read(screenProvider.notifier).back();
                                },
                                child: const Icon(Icons.arrow_back),
                              ),
                            ),
                            Expanded(
                              child: Button(
                                onTap: () {
                                  ref.read(paperProvider.notifier).avance();
                                },
                                child: const Icon(Icons.arrow_upward),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Expanded(
                  child: PaperPrint(),
                ),
              ],
            ),
          ),
          const Expanded(
            flex: 5,
            child: CenterButtons(),
          ),
        ],
      ),
    );
  }
}

class CenterButtons extends HookConsumerWidget {
  const CenterButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: const [
          Expanded(
            child: OperatorsButtons(),
          ),
          Expanded(
            flex: 4,
            child: BasicNumbers(),
          ),
          Expanded(
            flex: 3,
            child: TotalOperators(),
          ),
        ],
      ),
    );
  }
}

class OperatorsButtons extends HookConsumerWidget {
  const OperatorsButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Column(
      children: [
        Expanded(
          child: Button(
            onTap: () {
              final number = ref.read(screenProvider);
              ref.read(mathProvider.notifier).multiply(number);
              ref.read(screenProvider.notifier).clear();
            },
            child: const Text('X'),
          ),
        ),
        Expanded(
          child: Button(
            onTap: () {
              final number = ref.read(screenProvider);
              ref.read(mathProvider.notifier).divide(number);
              ref.read(screenProvider.notifier).clear();
            },
            child: const Text('/'),
          ),
        ),
        Expanded(
          child: Button(
            height: double.maxFinite,
            onTap: () {
              final number = ref.read(screenProvider);
              ref.read(mathProvider.notifier).equal(number);
            },
            child: const Text('='),
          ),
        ),
      ],
    );
  }
}

class TotalOperators extends HookConsumerWidget {
  const TotalOperators({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Row(
      children: [
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Column(
            children: [
              Expanded(
                child: Button(
                  height: double.maxFinite,
                  onTap: () {
                    final number = ref.read(screenProvider);
                    ref.read(screenProvider.notifier).clear();
                    ref.read(mathProvider.notifier).add(number);
                  },
                  child: const Text('+'),
                ),
              ),
              Expanded(
                child: Button(
                  height: double.maxFinite,
                  onTap: () {
                    final number = ref.read(screenProvider);
                    ref.read(screenProvider.notifier).clear();
                    ref.read(mathProvider.notifier).add(-number);
                  },
                  child: const Text('-'),
                ),
              ),
              Expanded(
                child: Button(
                  height: double.maxFinite,
                  onTap: () {
                    ref.read(screenProvider.notifier).clear();
                  },
                  child: const Text('C'),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Button(
            height: double.maxFinite,
            onTap: () {
              final number = ref.read(screenProvider);
              ref.read(screenProvider.notifier).clear();
              ref.read(mathProvider.notifier).totalize(number);
            },
            child: const Text('T'),
          ),
        ),
      ],
    );
  }
}

class BasicNumbers extends HookConsumerWidget {
  const BasicNumbers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Column(
      children: [
        Expanded(
          flex: 5,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Button(
                        onTap: () {
                          ref.read(screenProvider.notifier).addNumber(7);
                        },
                        child: const Text('7'),
                      ),
                    ),
                    Expanded(
                      child: Button(
                        onTap: () {
                          ref.read(screenProvider.notifier).addNumber(4);
                        },
                        child: const Text('4'),
                      ),
                    ),
                    Expanded(
                      child: Button(
                        onTap: () {
                          ref.read(screenProvider.notifier).addNumber(1);
                        },
                        child: const Text('1'),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Button(
                        onTap: () {
                          ref.read(screenProvider.notifier).addNumber(8);
                        },
                        child: const Text('8'),
                      ),
                    ),
                    Expanded(
                      child: Button(
                        onTap: () {
                          ref.read(screenProvider.notifier).addNumber(5);
                        },
                        child: const Text('5'),
                      ),
                    ),
                    Expanded(
                      child: Button(
                        onTap: () {
                          ref.read(screenProvider.notifier).addNumber(2);
                        },
                        child: const Text('2'),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Button(
                        onTap: () {
                          ref.read(screenProvider.notifier).addNumber(9);
                        },
                        child: const Text('9'),
                      ),
                    ),
                    Expanded(
                      child: Button(
                        onTap: () {
                          ref.read(screenProvider.notifier).addNumber(6);
                        },
                        child: const Text('6'),
                      ),
                    ),
                    Expanded(
                      child: Button(
                        onTap: () {
                          ref.read(screenProvider.notifier).addNumber(3);
                        },
                        child: const Text('3'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Button(
                  onTap: () {
                    ref.read(inDecimalProvider.notifier).state =
                        !ref.read(inDecimalProvider);
                  },
                  child: const Text('.'),
                ),
              ),
              Expanded(
                child: Button(
                  onTap: () {
                    ref.read(screenProvider.notifier).addNumber(0);
                  },
                  child: const Text('0'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
