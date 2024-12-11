void main(){
  // ctrl+alt+n
  //collections
  var list = [1,2,3,2,3];
  print(list);
  list.add(4);
  print(list);
  list.remove(2);
  print(list);
  list.forEach(print);

  var set = {'apple', 'orange', 'banana', "apple"};
  print(set);
  set.add("watermelon");
  print(set);
  set.add("apple");
  print(set);

  var maps = {
    "bob" : 93,
    "budi" : 90,
    "test" : 89,
  };

  print(maps);
  print(maps.length);
}