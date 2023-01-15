import '../../../domain/entities/sounds.dart';

abstract class AudioApi {
  Future<void> playSound(Sound sound);
}
