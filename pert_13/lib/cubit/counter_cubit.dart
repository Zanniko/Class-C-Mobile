import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pert_13/cubit/counter_event.dart';
import 'package:pert_13/cubit/counter_state.dart';
//contoh bloc (jangan buat bloc sama cubit di satu tempat ya, ini hanya contoh)
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(0)) {
    // versi panjang
    on<IncrementEvent>((event, emit) {
      // tambahan
      return emit(CounterState(state.count + 1));
    });
    // versi singkat
    on<DecrementEvent>((event, emit) => emit(CounterState(state.count - 1)));
  }
}

//cubit
class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(0));
  void increment() => emit(CounterState(state.count + 1));
  void decrement() => emit(CounterState(state.count - 1));
}