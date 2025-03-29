import 'package:pert_13/model/item.dart';

abstract class ItemState {}

class ItemsInitial extends ItemState {}
class ItemsLoading extends ItemState {}
class ItemsLoaded extends ItemState {
  final List<Item> items;
  ItemsLoaded({required this.items});
}
class ItemsError extends ItemState{
  final String message;
  ItemsError({required this.message});
}