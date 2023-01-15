import 'package:audioplayers/audioplayers.dart';

import '../../../domain/entities/sounds.dart';
import '../../data_bases/sounds_db.dart';
import 'audio_api.dart';

class AudioInAppSound implements AudioApi {
  final _player = AudioPlayer();

  @override
  Future<void> playSound(Sound sound) async {
    await _player.play(
      AssetSource(sound.asset),
      mode: PlayerMode.lowLatency,
      position: sound == AppSounds.print ? const Duration(seconds: 1) : null,
    );
  }
}
