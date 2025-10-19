// lib/features/dashboard/presentation/providers/main_screen_providers.dart

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'main_screen_providers.g.dart';

@riverpod
class MainScreenIndex extends _$MainScreenIndex {
  @override
  int build() {
    return 0;
  }

  void setIndex(int newIndex) {
    state = newIndex;
  }
}

// This provider will manage the visibility of the "More for you" overlay.
@riverpod
class MoreForYouVisibility extends _$MoreForYouVisibility {
  @override
  bool build() {
    return false;
  }

  void show() {
    state = true;
  }

  void hide() {
    state = false;
  }

  void toggle() {
    state = !state;
  }
}
