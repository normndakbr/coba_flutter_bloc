import 'dart:async';

import 'package:flutter/material.dart';

enum ColorEvent { toDeepOrange, toBlueAccent }

class ColorBloc {
  Color _color = Colors.deepOrange;

  StreamController<ColorEvent> _eventController =
      StreamController<ColorEvent>();
  StreamSink<ColorEvent> get eventSink => _eventController.sink;

  StreamController<Color> _stateController = StreamController<Color>();
  StreamSink<Color> get _stateSink => _stateController.sink;
  Stream<Color> get stateStream => _stateController.stream;

  void _mapEventToState(ColorEvent colorEvent) {
    if (colorEvent == ColorEvent.toDeepOrange) {
      _color = Colors.blueAccent;
    } else {
      _color = Colors.deepOrange;
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
