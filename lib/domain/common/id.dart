import 'package:nanoid2/nanoid2.dart';

/// Wrapper for NanoIds so that they can treated as a type in the application.
class Id {
  final String value;

  Id() : value = nanoid(length: 8, alphabet: Alphabet.hexadecimalUppercase);

  Id.fromString(this.value);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Id && runtimeType == other.runtimeType && value == other.value;

  @override
  int get hashCode => value.hashCode;
}
