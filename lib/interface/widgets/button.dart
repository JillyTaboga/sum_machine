import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/data_bases/sounds_db.dart';
import '../../data/injection.dart';

class Button extends HookConsumerWidget {
  const Button({
    Key? key,
    required this.onTap,
    this.child,
    this.height,
  }) : super(key: key);

  final void Function() onTap;
  final Widget? child;
  final double? height;

  @override
  Widget build(BuildContext context, ref) {
    final isHovered = useState<bool>(false);
    final isPressed = useState<bool>(false);
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: MouseRegion(
        onEnter: (event) => isHovered.value = true,
        onExit: (event) {
          isHovered.value = false;
          isPressed.value = false;
        },
        child: GestureDetector(
          onTapDown: (details) => isPressed.value = true,
          onTapUp: (details) => isPressed.value = false,
          onTap: () {
            ref.read(audiApi).playSound(AppSounds.key);
            onTap();
          },
          child: AnimatedContainer(
            duration: const Duration(
              milliseconds: 80,
            ),
            height: height ?? double.maxFinite,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(5),
              color:
                  isHovered.value ? Colors.grey.shade700 : Colors.grey.shade400,
            ),
            padding: EdgeInsets.only(
              top: isPressed.value ? 1 : 3,
              left: isPressed.value ? 1 : 8,
              right: isPressed.value ? 1 : 8,
              bottom: isPressed.value ? 1 : 8,
            ),
            alignment: Alignment.topCenter,
            child: AnimatedContainer(
              duration: const Duration(
                milliseconds: 80,
              ),
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(5),
                color: isHovered.value
                    ? Colors.grey.shade400
                    : Colors.grey.shade200,
              ),
              child: FittedBox(child: child),
            ),
          ),
        ),
      ),
    );
  }
}
