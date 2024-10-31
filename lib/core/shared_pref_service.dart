import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_pref_service.g.dart';

@Riverpod(keepAlive: true)
Future<SharedPreferences> sharedPref(SharedPrefRef ref) {
  return SharedPreferences.getInstance();
}

@riverpod
SharedPrefService sharedPrefService(SharedPrefServiceRef ref) {
  return SharedPrefService(ref);
}

class SharedPrefService {
  SharedPrefService(this.ref);

  final Ref ref;

  SharedPreferences get sharedPref => ref.watch(sharedPrefProvider).requireValue;

  savePref(String key, String value) {
    unawaited(sharedPref.setString(key, value));
  }

  getStringPref(String key) => sharedPref.getString(key);
}
