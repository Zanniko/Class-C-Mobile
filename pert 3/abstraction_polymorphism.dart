abstract class Animal{
  // public attribute
  String name;
  int age;

  Animal(this.name, this.age);

  void makeSound();
  void displayPetInfo();
}

class Cat extends Animal{
  // private attibute
  String _breed;

  //ctrl+click untuk check asal method/attribute
  // constructur child class
  Cat(super.name, super.age, this._breed);

  //polymorphism overriding
  @override
  void makeSound() {
    print("moew");
  }
  
  @override
  void displayPetInfo() {
    print("cat name: $name, age: $age, breed: $_breed");
  }

  void playing(String item){
    print("$name the cat is playing with $item");
  }
}

class Dog extends Animal{
  //private attribute
  String _favoritefood;

  //consturctor of child class
  Dog(super.name, super.age, this._favoritefood);

  //polymorphism overriding
  @override
  void makeSound() {
    print("bark");
  }

  @override
  void displayPetInfo() {
    print("dog name: $name, age: $age, favoritefood: $_favoritefood");
  }
  
  void fetch(String item){
    print("$name the dog is fetching $item");
  }
}

void main(){
  //object Cat
  Cat myCat = Cat("Felix", 3, "breed 1");

  //method of class Cat
  myCat.displayPetInfo();
  myCat.playing("ball");

  //object dog
  Dog myDog = Dog("Bob", 2, "Cooked Beef");

  //method of class Dog
  myDog.displayPetInfo();
  myDog.fetch("stick");
}