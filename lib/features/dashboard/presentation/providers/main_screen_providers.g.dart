// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_screen_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MainScreenIndex)
const mainScreenIndexProvider = MainScreenIndexProvider._();

final class MainScreenIndexProvider
    extends $NotifierProvider<MainScreenIndex, int> {
  const MainScreenIndexProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mainScreenIndexProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mainScreenIndexHash();

  @$internal
  @override
  MainScreenIndex create() => MainScreenIndex();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$mainScreenIndexHash() => r'66d42b5eea1e34e9c5a2adc44940090bc288c1e0';

abstract class _$MainScreenIndex extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(MoreForYouVisibility)
const moreForYouVisibilityProvider = MoreForYouVisibilityProvider._();

final class MoreForYouVisibilityProvider
    extends $NotifierProvider<MoreForYouVisibility, bool> {
  const MoreForYouVisibilityProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'moreForYouVisibilityProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$moreForYouVisibilityHash();

  @$internal
  @override
  MoreForYouVisibility create() => MoreForYouVisibility();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$moreForYouVisibilityHash() =>
    r'2e05c469ecea66617f1591b60ab3a460b2d1bc79';

abstract class _$MoreForYouVisibility extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
