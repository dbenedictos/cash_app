import 'package:cash_app/apis/classes/date_time_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction.freezed.dart';
part 'transaction.g.dart';

@freezed
class Transaction with _$Transaction {
  factory Transaction({
    int? id,
    int? user,
    String? referenceNumber,
    double? amount,
    @DateTimeConverter() DateTime? postedDate,
  }) = _Transaction;

  factory Transaction.fromJson(Map<String, dynamic> json) => _$TransactionFromJson(json);
}
