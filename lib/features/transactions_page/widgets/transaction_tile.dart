import 'package:cash_app/apis/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionTile extends StatelessWidget {
  const TransactionTile(
    this.transaction, {
    super.key,
  });

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    final isDebit = transaction.type == Type.DEBIT;
    final amountTruncated = transaction.amount.truncate();
    final decimal = (transaction.amount - amountTruncated) * 100;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '${isDebit ? '-' : '+'} ₱ $amountTruncated',
                      style: TextStyle(
                        color: isDebit ? Colors.black : Colors.green,
                        fontSize: 35,
                        letterSpacing: -3,
                      ),
                    ),
                    TextSpan(
                      text: ' .${decimal.toStringAsFixed(0)}',
                      style: TextStyle(
                        color: isDebit ? Colors.black : Colors.green,
                        fontSize: 20,
                        letterSpacing: -1,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Reference: ${transaction.referenceNumber}',
                style: Theme.of(context).textTheme.labelSmall,
              ),
              const Spacer(),
              Text(
                DateFormat('MMM dd, yyyy - kk:mm').format(transaction.postedDate),
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
