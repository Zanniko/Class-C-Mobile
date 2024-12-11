class BankAccount{
  // private variable "_"
  double _balance;

  // getter setter
  double get balance => _balance;

  set balance(double newBalance) {
    _balance = newBalance;
  }
  
  BankAccount(this._balance);

  void displayBalance(){
    print("balance : $_balance");
  }

}


void main() {
  // ctrl+alt+n
  //encapsulation

  BankAccount newAccount = BankAccount(100.0);
  newAccount.displayBalance();
  newAccount.balance = 123;
  newAccount.displayBalance();

}