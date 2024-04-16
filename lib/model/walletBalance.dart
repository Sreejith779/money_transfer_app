class BalanceAmount {
  static int mainBalance = 1000; // Initialize mainBalance to initialAmount
  static int initialAmount = 1000;

  static void payBalance(int enteredAmount) {
    mainBalance -= enteredAmount; // Deduct enteredAmount from mainBalance
  }
}
