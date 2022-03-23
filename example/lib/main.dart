import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:dart_event_bus/dart_event_bus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

final widget = Column(
  children: [
    ElevatedButton(
      onPressed: () {
        var nDouble = EventBus.I.get<ValueNotifier<double>>();
        nDouble?.value = Random().nextDouble();
        print("double: $nDouble");
      },
      child: const Text("random double"),
    ),
    ElevatedButton(
      onPressed: () {
        var nInt = EventBus.I.get<ValueNotifier<int>>();
        nInt?.value = Random().nextInt(0xffffff);
        print("int: $nInt");
      },
      child: const Text("random int"),
    ),
    ElevatedButton(
      onPressed: () {
        var nDouble = EventBus.I.get<ValueNotifier<double>>("key1");
        nDouble?.value = Random().nextDouble();
        print("double key1: $nDouble");
      },
      child: const Text("random double key1"),
    ),
    ElevatedButton(
      onPressed: () {
        var nInt = EventBus.I.get<ValueNotifier<int>>("key1");
        nInt?.value = Random().nextInt(0xffffff);
        print("int key1: $nInt");
      },
      child: const Text("random int key1"),
    ),
  ],
);

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    EventBus.I.post(ValueNotifier<double>(1.0));
    EventBus.I.post(ValueNotifier<int>(1));
    EventBus.I.post(ValueNotifier<double>(1.0), "key1");
    EventBus.I.post(ValueNotifier<int>(1), "key1");
    super.initState();
  }

  @override
  void dispose() {
    EventBus.I.dispose<ValueNotifier<double>>();
    EventBus.I.dispose<ValueNotifier<int>>();
    EventBus.I.dispose<ValueNotifier<double>>("key1");
    EventBus.I.dispose<ValueNotifier<int>>("key1");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('EventBus example app'),
        ),
        body: Builder(builder: (context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ValueListenableBuilder<double>(
                valueListenable: EventBus.I.get<ValueNotifier<double>>()!,
                builder: (BuildContext context, double value, Widget? child) {
                  return Text("double: $value");
                },
              ),
              ValueListenableBuilder<int>(
                valueListenable: EventBus.I.get<ValueNotifier<int>>()!,
                builder: (BuildContext context, int value, Widget? child) {
                  return Text("int: $value");
                },
              ),
              ValueListenableBuilder<double>(
                valueListenable: EventBus.I.get<ValueNotifier<double>>("key1")!,
                builder: (BuildContext context, double value, Widget? child) {
                  return Text("double key1: $value");
                },
              ),
              ValueListenableBuilder<int>(
                valueListenable: EventBus.I.get<ValueNotifier<int>>("key1")!,
                builder: (BuildContext context, int value, Widget? child) {
                  return Text("int key1: $value");
                },
              ),
              ElevatedButton(
                onPressed: () {
                  push(context, const Page1());
                },
                child: const Text("next page"),
              ),
            ],
          );
        }),
      ),
    );
  }

  void push(BuildContext context, Widget child) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          body: child,
        ),
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ValueListenableBuilder<double>(
          valueListenable: EventBus.I.get<ValueNotifier<double>>()!,
          builder: (BuildContext context, double value, Widget? child) {
            return Text("double: $value");
          },
        ),
        ValueListenableBuilder<int>(
          valueListenable: EventBus.I.get<ValueNotifier<int>>()!,
          builder: (BuildContext context, int value, Widget? child) {
            return Text("int: $value");
          },
        ),
        ValueListenableBuilder<double>(
          valueListenable: EventBus.I.get<ValueNotifier<double>>("key1")!,
          builder: (BuildContext context, double value, Widget? child) {
            return Text("double key1: $value");
          },
        ),
        ValueListenableBuilder<int>(
          valueListenable: EventBus.I.get<ValueNotifier<int>>("key1")!,
          builder: (BuildContext context, int value, Widget? child) {
            return Text("int key1: $value");
          },
        ),
        ElevatedButton(
          onPressed: () {
            var nDouble = EventBus.I.get<ValueNotifier<double>>();
            nDouble?.value = Random().nextDouble();
            print("double: $nDouble");
          },
          child: const Text("random double"),
        ),
        ElevatedButton(
          onPressed: () {
            var nInt = EventBus.I.get<ValueNotifier<int>>();
            nInt?.value = Random().nextInt(0xffffff);
            print("int: $nInt");
          },
          child: const Text("random int"),
        ),
        ElevatedButton(
          onPressed: () {
            var nDouble = EventBus.I.get<ValueNotifier<double>>("key1");
            nDouble?.value = Random().nextDouble();
            print("double key1: $nDouble");
          },
          child: const Text("random double key1"),
        ),
        ElevatedButton(
          onPressed: () {
            var nInt = EventBus.I.get<ValueNotifier<int>>("key1");
            nInt?.value = Random().nextInt(0xffffff);
            print("int key1: $nInt");
          },
          child: const Text("random int key1"),
        ),
      ],
    );
  }
}
