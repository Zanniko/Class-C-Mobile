// tidak dipakai ketika cubit hanya dipakai di bloc

abstract class CounterEvent {}

// +1
class IncrementEvent extends CounterEvent {}

// -1
class DecrementEvent extends CounterEvent {}