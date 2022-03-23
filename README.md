# dart_event_bus

A Dart support keyname and type Event Bus for decoupling applications.

[![pub package](https://img.shields.io/pub/v/dart_event_bus.svg)](https://pub.dev/packages/dart_event_bus)

## Post And Dispose

```dart

@override
void initState() {
  super.initState();
  EventBus.I.post(ValueNotifier<double>(1.0));
  EventBus.I.post(ValueNotifier<int>(1));
  // type and key
  EventBus.I.post(ValueNotifier<double>(1.0), "key1");
  EventBus.I.post(ValueNotifier<int>(1), "key1");
}

@override
void dispose() {
  EventBus.I.dispose<ValueNotifier<double>>();
  EventBus.I.dispose<ValueNotifier<int>>();
  EventBus.I.dispose<ValueNotifier<double>>("key1");
  EventBus.I.dispose<ValueNotifier<int>>("key1");
  super.dispose();
}
```

## Listener

```dart

final widget = Column(
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
  ],
);
```

## Update

```dart

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
```