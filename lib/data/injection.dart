import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'packages/audio/audio_api.dart';
import 'packages/audio/audioplayers_package.dart';

final audiApi = Provider<AudioApi>((ref) {
  return AudioInAppSound();
});
