// import 'package:flutter/material.dart';
// import './create_transaction.dart';
// import './transactionList.dart';
// import '../models/transaction.dart';

// class UserTransaction extends StatefulWidget {
//   @override
//   _UserTransactionState createState() => _UserTransactionState();
// }

// class _UserTransactionState extends State<UserTransaction> {
//   final List<Transaction> _usertransactions = [
//     Transaction(
//       'A1',
//       'New shoe',
//       69.99,
//       DateTime.now(),
//     ),
//     Transaction(
//       'A2',
//       'New book',
//       6.95,
//       DateTime.now(),
//     )
//   ];

//   void _addTransaction(String title, double amount) {
//     final newTx = Transaction(
//       DateTime.now().toString(),
//       title,
//       amount,
//       DateTime.now(),
//     );

//     setState(() {
//       _usertransactions.add(newTx);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         CreateTransaction(_addTransaction),
//         TransactionList(_usertransactions),
//       ],
//     );
//   }
// }
