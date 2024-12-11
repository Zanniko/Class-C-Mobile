class Vehicle{
  void start(){
    print("Starting Vehicle");
  }

  void stop(){
    print("Stopping vehicle");
  }
}

class Car extends Vehicle{
  void driving(){
    print("driving car");
  }
}

void main(){
  // Car myCar = Car();
  // myCar.start();
  // myCar.driving();
  // myCar.stop();

  Vehicle plane = Vehicle();
  plane.start();
  plane.stop();
}