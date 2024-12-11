void main(){
  //variable
  var variable1 = 30;
  variable1 = 36;
  var variable2 = "bob";
  variable2 = "sam";
  var variable3 = 2.4;

  String? name;

  final String sound;
  const double pi = 3.14;
  
  sound = "loud";

  print(variable1);
  print(variable2);
  print(variable3);
  print(name);
  print(sound);
  print(pi);


  //operator
  var a = 1;
  var b = 2;
  assert(a == b);
  var c = a+b;
  print(c);
  int? d;
  print(d);
  d ??= 3;
  print(d);


  //special type
  var fruits = ["apple", "orange", "apple"];
  print(fruits);
  var numbers = {1, 2 , 3, 3, 2};
  print(numbers);
  print(numbers.elementAt(0));

  //looping
  for(int i = 0; i < fruits.length; i++){
    print(fruits.elementAt(i));
  }

  numbers.forEach(print);

  int a1 = 1, b1 = 3;
  while(a1 < b1){
    print("a");
    a++;
  }

  //object
  Object dartString = "dart";
  print(dartString);

  //enum
  var color1 = Color.red;
  print(color1);

  //iterable
  Iterable<int> numbers2 = [3, 10, 12];
  print(numbers2);

  dynamic name2 = "bob";
  print(name2);
  name2 = 1;
  print(name2);

  //conditional
  int score = 59;
  if(score < 60){
    print("F");
  }else if(score > 70 && score < 75){
    print("B");
  }else{
    print("A");
  }

  String fruit = "blueberry";
  switch(fruit){
    case 'apple':
      print("apple");
      break;
    case 'banana':
      print("banana");
      break;
    default:
      print("not in list");
      break;
  }
  
  // sayabc();
  print(additive(15, 10));

}

enum Color{
  red,
  green,
  yellow
}

enum fruit{
  orange,
  watermelon,
  banana
}


void sayabc(){
  print("abc");
}

int additive(int a, int b){
  int c = a+b;
  return c;
}