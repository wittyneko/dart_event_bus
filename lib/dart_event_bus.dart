library dart_event_bus;

class EventBus {
  final _events = <String?, Map<Type, Object>>{};

  static final EventBus _instance = EventBus();

  /// access to the Singleton instance of GetEventBus
  static EventBus get instance => _instance;

  /// Short form to access the instance of GetEventBus
  static EventBus get I => _instance;

  T? get<T extends Object>([
    String? key,
  ]) {
    return _events[key]?[T] as T?;
  }

  T post<T extends Object>(
    T event, [
    String? key,
  ]) {
    _events.putIfAbsent(key, () => <Type, Object>{})[T] = event;
    return event;
  }

  void dispose<T extends Object>([
    String? key,
  ]) {
    _events[key]?.remove(T);
  }
}
