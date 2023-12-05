// ignore_for_file: file_names, library_private_types_in_public_api, unused_local_variable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:peraplan/features/balance_section.dart';
import 'package:peraplan/utils/styles.dart';
import 'package:peraplan/components/piop_drawer.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:peraplan/data/database.dart';
import 'package:intl/intl.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({super.key});

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  String filter = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: Text.rich(TextSpan(
          children: [
            TextSpan(text: 'Pera', style: appBar1),
            TextSpan(
              text: 'Plan',
              style: appBar2,
            ),
          ],
        )),
        iconTheme: IconThemeData(color: hlblue),
      ),
      drawer: const PIOPDrawer(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: small, top: small, right: small),
            child: Column(
              children: [
                const BalanceSection(),
                SizedBox(height: small),
                TransactionsButtons(onFilterChanged: (String newFilter) {
                  setState(() {
                    filter = newFilter;
                  });
                }),
                SizedBox(height: xsmall),
                AllTransactionsSection(selectedFilter: filter),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TransactionsButtons extends StatefulWidget {
  final Function(String) onFilterChanged;

  const TransactionsButtons({required this.onFilterChanged, Key? key})
      : super(key: key);

  @override
  _TransactionsButtonsState createState() => _TransactionsButtonsState();
}

class _TransactionsButtonsState extends State<TransactionsButtons> {
  String selectedFilter = 'All';
  late Box<Transaction> _transactionBox;

  @override
  void initState() {
    super.initState();
    _transactionBox = Hive.box<Transaction>('transactions');
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(
          width: width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('History', style: transacBold),
                  const SizedBox(width: 5),
                  Image.asset(
                    'assets/images/transaction.png',
                    height: 30,
                  ),
                  SizedBox(width: medium),
                ],
              ),
              InkWell(
                onTap: () {
                  _showDeleteAllDialog();
                },
                child: Icon(
                  Icons.delete,
                  color: red,
                  size: 35,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: xsmall),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildFilterButton(context, 'All', tCat, hlblue),
              _buildFilterButton(context, 'Pera In', tIn, green),
              _buildFilterButton(context, 'Pera Out', tOut, red),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFilterButton(BuildContext context, String filter,
      TextStyle textStyle, Color borderColor) {
    final isSelected = selectedFilter == filter;
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        setState(() {
          selectedFilter = filter;
          widget.onFilterChanged(filter);
        });
      },
      child: Container(
        constraints: BoxConstraints(maxWidth: width * .3, minWidth: width * .2),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border:
                isSelected ? Border.all(width: 2.5, color: borderColor) : null,
            borderRadius: BorderRadius.circular(10),
            color: white,
            boxShadow: [
              BoxShadow(
                  color: dgray,
                  blurRadius: 5,
                  spreadRadius: 1,
                  offset: const Offset(2, 2)),
            ]),
        child: Text(
          filter,
          style: textStyle.copyWith(color: isSelected ? borderColor : null),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  void _showDeleteAllDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Row(
            children: [
              Flexible(child: Text('Delete All Transactions?', style: pOut)),
              const SizedBox(width: 5),
              Icon(Icons.delete, color: red, size: 35),
            ],
          ),
          content: Text('Are you sure you want to delete All Transactions?',
              style: transactxt),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(5),
                    width: 120,
                    height: 40,
                    decoration: BoxDecoration(
                        border: Border.all(color: hlblue, width: 1),
                        borderRadius: BorderRadius.circular(35),
                        color: white,
                        boxShadow: [
                          BoxShadow(
                              color: dgray,
                              blurRadius: 5,
                              spreadRadius: 1,
                              offset: const Offset(2, 2)),
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Cancel', style: headers),
                      ],
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    _deleteAllTransactions();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content:
                              Text('Deleted All Transactions Successfully!')),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(5),
                    width: 120,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        color: red,
                        boxShadow: [
                          BoxShadow(
                              color: dgray,
                              blurRadius: 5,
                              spreadRadius: 1,
                              offset: const Offset(2, 2)),
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Delete', style: dialogConfirm),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  void _deleteAllTransactions() {
    _transactionBox.clear(); // Clear all transactions

    setState(() {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const TransactionsScreen()),
    );
  }
}

class AllTransactionsSection extends StatefulWidget {
  final String selectedFilter;

  const AllTransactionsSection({required this.selectedFilter, Key? key})
      : super(key: key);

  @override
  _AllTransactionsSectionState createState() => _AllTransactionsSectionState();
}

class _AllTransactionsSectionState extends State<AllTransactionsSection> {
  late Box<Transaction> _transactionBox;

  @override
  void initState() {
    super.initState();
    _transactionBox = Hive.box<Transaction>('transactions');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(medium),
              color: lgray,
            ),
            child: Column(
              children: [
                _buildTransactionData(),
              ],
            ))
      ],
    );
  }

  Widget _buildTransactionData() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width * .9,
      height: height * .45,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: white,
        boxShadow: [
          BoxShadow(
            color: dgray,
            blurRadius: 5,
            spreadRadius: 1,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: ValueListenableBuilder(
        valueListenable: _transactionBox.listenable(),
        builder: (context, Box<Transaction> box, _) {
          if (box.isEmpty) {
            return Center(
              child: Text(
                'No Transactions Available',
                style: txt,
                textAlign: TextAlign.center,
              ),
            );
          }

          // Check for Pera In and Pera Out transactions
          bool hasPeraIn =
              box.values.any((transaction) => transaction is PeraIn);
          bool hasPeraOut =
              box.values.any((transaction) => transaction is PeraOut);

          if (widget.selectedFilter == 'Pera In' && !hasPeraIn) {
            return Center(
              child: Text(
                'No Pera In Transactions Available',
                style: txt,
                textAlign: TextAlign.center,
              ),
            );
          } else if (widget.selectedFilter == 'Pera Out' && !hasPeraOut) {
            return Center(
              child: Text(
                'No Pera Out Transactions Available',
                style: txt,
                textAlign: TextAlign.center,
              ),
            );
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                for (int index = box.length - 1; index >= 0; index--)
                  if (_shouldShowTransaction(box.getAt(index)))
                    Column(
                      children: [
                        _buildTransactionItem(box, index),
                        const SizedBox(height: 16.0),
                      ],
                    ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildTransactionItem(Box<Transaction> box, int index) {
    final transaction = box.getAt(index);
    String transactionType = '';
    Color amountColor = Colors.black;
    String amount = '';

    if (transaction is PeraIn) {
      transactionType = 'Pera In';
      amountColor = green;
      amount = "+₱${transaction.amount.toStringAsFixed(2)}";
    } else if (transaction is PeraOut) {
      transactionType = 'Pera Out';
      amountColor = red;
      amount = "-₱${transaction.amount.toStringAsFixed(2)}";
    }
    Map<String, IconData> categoryIcons = {
      'Salary': Icons.payment,
      'Allowance': Icons.account_balance_wallet_rounded,
      'Investments': Icons.account_balance,
      'Others': Icons.category,
      'Food': Icons.restaurant,
      'Travel': Icons.directions_bus,
      'School': Icons.account_balance,
      'Shopping': Icons.shopping_cart_checkout,
      'Bills': Icons.bolt,
      'Fitness': Icons.fitness_center_rounded,
      'Subscriptions': Icons.credit_card,
      'Vacation': Icons.card_travel,
    };

    IconData iconData = categoryIcons[transaction?.category] ?? Icons.category;

    TextStyle unique = GoogleFonts.lexend(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: amountColor,
    );

    return Dismissible(
      key: Key(transaction.hashCode.toString()),
      confirmDismiss: (direction) async {
        _showDeleteDialog(transaction, index);
        return null;
      },
      background: Container(
        color: red,
        child: Icon(Icons.delete, color: white),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              // Category Icon
              Icon(iconData, color: amountColor),
              SizedBox(width: xsmall),
              // Category Name
              Text(
                '${transaction?.category}',
                style: transactxt,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Amount
              Text(amount, style: unique),
              // Date and Time
              Text(
                '${DateFormat('MMMM dd').format(transaction?.date ?? DateTime.now())}, ${DateFormat.jm().format(DateTime(2022, 1, 1, transaction?.time.hour ?? 0, transaction?.time.minute ?? 0))}',
                style: dateTime,
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showDeleteDialog(Transaction? transaction, int index) {
    String transactionType = '';
    Color txtColor = Colors.black;

    if (transaction is PeraIn) {
      transactionType = 'Pera In';
      txtColor = green;
    }

    if (transaction is PeraOut) {
      transactionType = 'Pera Out';
      txtColor = red;
    }

    TextStyle unique = GoogleFonts.lexend(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: txtColor,
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Row(
            children: [
              Flexible(child: Text('Delete $transactionType?', style: pOut)),
              const SizedBox(width: 5),
              Icon(Icons.delete, color: red, size: 35),
            ],
          ),
          content: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                    text: 'Are you sure you want to delete this ',
                    style: transactxt),
                TextSpan(
                  text: transactionType,
                  style: unique,
                ),
                TextSpan(text: ' transaction?', style: transactxt),
              ],
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(5),
                    width: 120,
                    height: 40,
                    decoration: BoxDecoration(
                        border: Border.all(color: hlblue, width: 1),
                        borderRadius: BorderRadius.circular(35),
                        color: white,
                        boxShadow: [
                          BoxShadow(
                              color: dgray,
                              blurRadius: 5,
                              spreadRadius: 1,
                              offset: const Offset(2, 2)),
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Cancel', style: headers),
                      ],
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    _deleteTransaction(index);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content:
                              Text('$transactionType Deleted Successfully!')),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(5),
                    width: 120,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        color: red,
                        boxShadow: [
                          BoxShadow(
                              color: dgray,
                              blurRadius: 5,
                              spreadRadius: 1,
                              offset: const Offset(2, 2)),
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Delete', style: hintAmt),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  void _deleteTransaction(int index) {
    _transactionBox.deleteAt(index);

    setState(() {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const TransactionsScreen()),
    );
  }

  bool _shouldShowTransaction(Transaction? transaction) {
    if (widget.selectedFilter == 'All') {
      return true;
    } else if (widget.selectedFilter == 'Pera In' && transaction is PeraIn) {
      return true;
    } else if (widget.selectedFilter == 'Pera Out' && transaction is PeraOut) {
      return true;
    }
    return false;
  }
}
