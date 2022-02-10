import 'dart:async';

class SignInBloc {
  final _stateStreamController = StreamController<int>();

  StreamSink<int> get counterSink => _stateStreamController.sink;
  Stream<int> get counterStream => _stateStreamController.stream;
}
