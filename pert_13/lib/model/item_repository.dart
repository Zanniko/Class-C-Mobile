import 'package:pert_13/model/item.dart';

abstract class ItemRepository {
  Future<List<Item>> getItems();
}

class FakeItemRepository extends ItemRepository{
  @override
  Future<List<Item>> getItems() async {
    try {
      await Future.delayed(Duration(seconds: 2));
      return List<Item>.generate(
        5, (index) => Item(id: index, name: 'Item ${index+1}')
        // 0 item 1
        // 1 item 2
      );
    } catch (e) {
      throw Exception("failed to load item $e");
    }
  }
}