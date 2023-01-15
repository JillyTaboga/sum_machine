import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/data_bases/sounds_db.dart';
import '../../data/injection.dart';
import 'screen_controller.dart';

class PaperLine {
  final String? number;
  final String? symbol;
  PaperLine({
    this.number,
    this.symbol,
  });
}

final paperProvider =
    StateNotifierProvider<PaperNotifier, List<PaperLine>>((ref) {
  return PaperNotifier(ref);
});

class PaperNotifier extends StateNotifier<List<PaperLine>> {
  PaperNotifier(this.ref) : super([]);

  final Ref ref;

  addLine(PaperLine line) {
    ref.read(inDecimalProvider.notifier).state = false;
    ref.read(audiApi).playSound(AppSounds.print);
    state = [...state, line];
  }

  avance() {
    ref.read(inDecimalProvider.notifier).state = false;
    ref.read(audiApi).playSound(AppSounds.print);
    state = [...state, PaperLine()];
  }
}
