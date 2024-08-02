import 'package:cash_app/apis/classes/date_time_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction.freezed.dart';
part 'transaction.g.dart';

enum Type {
  @JsonValue(0)
  CREDIT,
  @JsonValue(1)
  DEBIT,
}

@freezed
class Transaction with _$Transaction {
  factory Transaction({
    required int id,
    required int user,
    required String referenceNumber,
    required double amount,
    required Type type,
    @DateTimeConverter() required DateTime postedDate,
  }) = _Transaction;

  factory Transaction.fromJson(Map<String, dynamic> json) => _$TransactionFromJson(json);
}
