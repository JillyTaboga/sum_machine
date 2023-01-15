import 'package:hooks_riverpod/hooks_riverpod.dart';

final inDecimalProvider = StateProvider<bool>((ref) {
  return false;
});

final screenProvider = StateNotifierProvider<ScreenNotifier, double>((ref) {
  return ScreenNotifier(ref);
});

class ScreenNotifier extends StateNotifier<double> {
  ScreenNotifier(this.ref) : super(0.0);

  final Ref ref;

  back() {
    if (state.toString().isEmpty) {
      return;
    }
    if (state.toString().length == 1) {
      state = 0;
      return;
    }
    final currentScreen = state.toString();
    final currentScreenSplitted = currentScreen.split('.');
    String decimals = '';
    String intergers = currentScreenSplitted.first;
    if (currentScreenSplitted.length > 1 &&
        currentScreenSplitted[1].isNotEmpty &&
        currentScreenSplitted[1] != '0') {
      decimals = currentScreenSplitted[1];
      decimals = decimals.substring(0, decimals.length - 1);
      if (decimals.isEmpty) {
        ref.read(inDecimalProvider.notifier).state = false;
      }
    } else {
      intergers = intergers.substring(0, intergers.length - 1);
    }
    final converted = '$intergers.$decimals';
    state = double.tryParse(converted) ?? 0.0;
  }

  addNumber(int number) {
    final currentScreen = state.toString();
    final currentScreenSplitted = currentScreen.split('.');
    String decimals = '';
    String intergers = currentScreenSplitted.first;
    if (currentScreenSplitted.length > 1) {
      decimals = currentScreenSplitted[1];
    }
    final isDecimal = ref.read(inDecimalProvider);
    if (isDecimal) {
      decimals = (decimals == '0' ? '' : decimals) + number.toString();
    } else {
      intergers = intergers + number.toString();
    }
    final converted = '$intergers.$decimals';
    state = double.tryParse(converted) ?? 0.0;
  }

  clear() {
    state = 0;
    ref.read(inDecimalProvider.notifier).state = false;
  }
}
