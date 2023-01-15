import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import 'papel_controller.dart';
import 'screen_controller.dart';

final _holdProvider = StateProvider<HoldOperator?>((ref) {
  return;
});

final mathProvider = StateNotifierProvider<MathNotifier, List<double>>((ref) {
  return MathNotifier(ref);
});

class MathNotifier extends StateNotifier<List<double>> {
  MathNotifier(this.ref) : super([]);

  final Ref ref;

  List<double> _computeHold(double newNumber) {
    List<double> newState = [...state];
    final operator = ref.read(_holdProvider);
    if (state.isNotEmpty && operator != null) {
      final lastValue = newState.removeLast();
      if (operator == HoldOperator.multiply) {
        final result = lastValue * newNumber;
        newState.add(result);
      }
      if (operator == HoldOperator.divide) {
        final result = lastValue / newNumber;
        newState.add(result);
      }
      ref.read(_holdProvider.notifier).state = null;
      ref.read(screenProvider.notifier).state = newState.last;
    } else {
      newState.add(newNumber);
    }
    return newState;
  }

  multiply(double number) {
    var newState = _computeHold(number);
    ref.read(_holdProvider.notifier).state = HoldOperator.multiply;
    ref.read(paperProvider.notifier).addLine(
          PaperLine(
            symbol: 'x',
            number: NumberFormat.decimalPatternDigits(decimalDigits: 2)
                .format(number),
          ),
        );
    state = newState;
  }

  divide(double number) {
    var newState = _computeHold(number);
    ref.read(_holdProvider.notifier).state = HoldOperator.divide;
    ref.read(paperProvider.notifier).addLine(
          PaperLine(
            symbol: '/',
            number: NumberFormat.decimalPatternDigits(decimalDigits: 2)
                .format(number),
          ),
        );
    state = newState;
  }

  add(double number) {
    var newState = _computeHold(number);
    _toPaper(number.abs(), number < 0 ? '-' : '+');
    state = newState;
  }

  totalize(double number) {
    if (state.isEmpty) {
      _toPaper(number, 'T');
      return;
    }
    final newState = _computeHold(number);
    ref.read(_holdProvider.notifier).state = null;
    final result = newState.fold<double>(
        0, (previousValue, element) => previousValue + element);
    _toPaper(result, 'T');
    ref.read(_holdProvider.notifier).state = null;
    ref.read(screenProvider.notifier).state = result;
    state = [];
  }

  equal(double number) {
    if (ref.read(_holdProvider) == null) {
      totalize(number);
      return;
    }
    var newState = _computeHold(number);
    final lastState = newState.removeLast();
    ref.read(screenProvider.notifier).state = lastState;
    ref.read(_holdProvider.notifier).state = null;
    _toPaper(number, '=');
    _toPaper(lastState, '');
    state = newState;
  }

  _toPaper(double total, String symbol) {
    ref.read(paperProvider.notifier).addLine(
          PaperLine(
            symbol: symbol,
            number: NumberFormat.decimalPatternDigits(decimalDigits: 2)
                .format(total),
          ),
        );
  }
}

enum HoldOperator {
  multiply,
  divide;
}
