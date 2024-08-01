import 'package:freezed_annotation/freezed_annotation.dart';

class DateTimeConverter implements JsonConverter<DateTime, String> {
  const DateTimeConverter();

  @override
  DateTime fromJson(String dateString) => DateTime.parse(dateString).toLocal();

  @override
  String toJson(DateTime date) => date.toUtc().toString();
}
