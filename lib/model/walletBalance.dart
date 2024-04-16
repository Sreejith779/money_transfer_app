class BalanceAmount {
  static int mainBalance =000;

  static int initialAmount = 1000;

  static payBalance(int enteredAmount) {
    mainBalance = initialAmount - (enteredAmount);


     return mainBalance;
  }
}
