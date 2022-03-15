import 'package:coba_flutter_bloc/color_bloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Color BLoC Demo Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ColorBloc bloc = ColorBloc();

  @override
  void dispose() {
    bloc.dispose;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: StreamBuilder<Color>(
        stream: bloc.stateStream,
        initialData: Colors.deepOrange,
        builder: (context, snapshot) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: 100,
            width: 100,
            color: snapshot.data,
          );
        },
      )),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              bloc.eventSink.add(ColorEvent.toDeepOrange);
            },
            backgroundColor: Colors.deepOrange,
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              bloc.eventSink.add(ColorEvent.toBlueAccent);
            },
            backgroundColor: Colors.blueAccent,
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
