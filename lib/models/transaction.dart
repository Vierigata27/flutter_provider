class Transaction {
  final String orderId;
  final String amount;
  final String itemName;

  Transaction({
    required this.orderId,
    required this.amount,
    required this.itemName,
  });

  factory Transaction.fromJson(Map<String, dynamic> json){
    return Transaction(
      orderId: json['orderId'], 
      amount: json['amount'], 
      itemName: json['itemName']);
  }

  Map<String, dynamic> toJson(){
    return {
      'orderId': orderId,
      'amount': amount,
      'itemName': itemName,
    };
  }

}