import 'dart:async';

/// This function can be use as a waiting method
/// Usage -> waiting to execute the code until some variable changes it's value
/// Ex: await waitWhile(() => index == 0, Duration(milliseconds: 100));
Future waitWhile(bool Function() test, [Duration pollInterval = Duration.zero]) {
  var completer = Completer();
  check() {
    if (!test()) {
      completer.complete();
    } else {
      Timer(pollInterval, check);
    }
  }

  check();
  return completer.future;
}
