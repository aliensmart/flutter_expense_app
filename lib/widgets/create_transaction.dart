import 'dart:wasm';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';

class CreateTransaction extends StatefulWidget {
  final Function inputData;
  CreateTransaction(this.inputData);

  @override
  _CreateTransactionState createState() => _CreateTransactionState();
}

class _CreateTransactionState extends State<CreateTransaction> {
  final _titleController = TextEditingController();

  final _amountController = TextEditingController();
  DateTime _pickedDate;

  void _submitData() {
    if (_titleController.text.isEmpty) {
      return;
    }

    final titleInput = _titleController.text;
    final amountInput = double.parse(_amountController.text);

    if (titleInput.isEmpty || amountInput <= 0 || _pickedDate == null) {
      return;
    }

    widget.inputData(titleInput, amountInput, _pickedDate);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    //showDatePicker returns a future(promise in javascript)
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime.now())
        .then((value) {
      if (value == null) {
        return;
      }

      setState(() {
        _pickedDate = value;
      });
      print(_pickedDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
          elevation: 5,
          child: Container(
            padding: EdgeInsets.only(
                top: 10,
                bottom: MediaQuery.of(context).viewInsets.bottom + 10,
                right: 10,
                left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextField(
                  decoration: InputDecoration(labelText: 'Title'),
                  controller: _titleController,
                  onSubmitted: (_) => _submitData(),
                  // onChanged: (val) => titleInput = val,
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Amount'),
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  onSubmitted: (_) => _submitData(),
                  // onChanged: (val) => amountInput = val,
                ),
                Container(
                  height: 60,
                  child: Row(
                    children: [
                      Text(_pickedDate == null
                          ? "No date added"
                          : "Picked Date: ${DateFormat.yMd().format(_pickedDate)}"),
                      FlatButton(
                        textColor: Theme.of(context).primaryColor,
                        child: Text(
                          'Add Date',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onPressed: _presentDatePicker,
                      )
                    ],
                  ),
                ),
                RaisedButton(
                  onPressed: _submitData,
                  child: Text(
                    'Add Tansaction',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  textColor: Theme.of(context).textTheme.button.color,
                  color: Theme.of(context).primaryColor,
                )
              ],
            ),
          )),
    );
  }
}
