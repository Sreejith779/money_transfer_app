 class BalanceAmount {

  static int mainBalance = 0;

   static int initialAmount = 1000;

   static payBalance(int enteredAmount){

     mainBalance = initialAmount - enteredAmount;
return mainBalance;
   }

 }