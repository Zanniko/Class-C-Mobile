class Product{
  //attribute public
  // String name;
  // double price;

  //attribute private
  String _name;
  double _price;

  //constructur
  Product(this._name, this._price);

  //getter
  String get name => _name;

  //getter
  double get getPrice => _price;

  //setter
  set setPrice(double newPrice){
    _price = newPrice;
  }

  void displayInfo(){
    // print("Product: " + name + ", Price: " + price.toString());
    //product: apple, Price: 2000
    print("Product: $_name, Price: $_price");
  }
}

class Order{
  //attribute
  List<Product> _products = [];


  //default constructor dipakai karena tidak ada contructor yang kita buat sendiri
  

  //method
  void addProduct(Product product){
    _products.add(product);
  }

  void removeProduct(Product product){
    _products.remove(product);
  }

  double getTotal(){
    double total = 0;
    for(int i = 0; i < _products.length; i++){
      total += _products.elementAt(i).getPrice;
    }
    return total;
    //elemen 0 apple price : 200
    //elemen 1 mango price : 300
    //product.length = 2
    //return 500 kalau dari contoh di atas
  }

  void displayOrder(){
    print("Order Details:");
    for(var product in _products){
      product.displayInfo();
    }
  }
}

void main(){
  //products
  var apple = Product("Apple", 200.0);
  var banana = Product("Banana", 300.0);
  var mango = Product("Mango", 150.0);

  //order
  var order = Order();
  order.addProduct(apple);
  order.addProduct(banana);
  order.addProduct(mango);
  order.addProduct(apple);
  order.addProduct(apple);
  order.addProduct(banana);
  order.removeProduct(apple);
  order.removeProduct(banana);

  //method
  order.displayOrder();
  print("total: " + order.getTotal().toString());
}