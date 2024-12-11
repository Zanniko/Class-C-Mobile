//overloading adalah ketika kita ingin membuat suatu method memiliki fungsi yang berbeda sesuai dengan parameter yang diberikan
class calculator{
  //method overloading
  int add(int a, int b, [int? c]){
    if(c != null){
      return a + b + c;
    } else{
      return a + b;
    }
  }

  //method biasa
  int add2(int a, int b){
    return a+b;
  }
  int add3(int a, int b, int c){
    return a+b+c;
  }
}

void main(){
  calculator myCalc = calculator();
  print(myCalc.add(10, 12, 30));
}