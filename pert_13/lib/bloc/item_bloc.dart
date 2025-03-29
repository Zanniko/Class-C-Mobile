import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pert_13/bloc/item_event.dart';
import 'package:pert_13/bloc/item_state.dart';
import 'package:pert_13/model/item_repository.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  final ItemRepository repository;

  ItemBloc({required this.repository}) : super(ItemsInitial()) {
    on<LoadItemsEvent>((event, emit) async {
      emit(ItemsLoading());
      try {
        final items = await repository.getItems();
        emit(ItemsLoaded(items: items));
      } catch (e) {
        emit(ItemsError(message: e.toString()));
      }
    });
  }
}