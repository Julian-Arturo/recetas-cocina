import 'dart:async';

class Debouncer<T> {
  static final Debouncer _instance = Debouncer._internal();

  factory Debouncer({required Duration duration}) {
    return _instance as Debouncer<T>;
  }

  Debouncer._internal();

  final Duration duration = const Duration(milliseconds: 500);

  void Function(T value)? onValue;

  T? _value;
  Timer? _timer;

  T get value => _value!;

  set value(T val) {
    _value = val;
    _timer?.cancel();
    _timer = Timer(duration, () => onValue!(_value as T));
  }
}
