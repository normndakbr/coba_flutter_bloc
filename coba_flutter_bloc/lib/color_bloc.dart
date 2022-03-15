import 'dart:async';

import 'package:flutter/material.dart';

enum ColorEvent { toDeepOrange, toBlueAccent }

class ColorBloc {
  Color _color = Colors.deepOrange;

  final StreamController<ColorEvent> _eventController =
      StreamController<ColorEvent>();
  StreamSink<ColorEvent> get eventSink => _eventController.sink;

  final StreamController<Color> _stateController = StreamController<Color>();
  StreamSink<Color> get _stateSink => _stateController.sink;
  Stream<Color> get stateStream => _stateController.stream;

  void _mapEventToState(ColorEvent colorEvent) {
    if (colorEvent == ColorEvent.toDeepOrange) {
      _color = Colors.deepOrange;
    } else {
      _color = Colors.blueAccent;
    }

    _stateSink.add(_color);
  }

  ColorBloc() {
    _eventController.stream.listen(_mapEventToState);
  }

  void dispose() {
    _eventController.close();
    _stateController.close();
  }
}
