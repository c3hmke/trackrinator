import 'package:nanoid2/nanoid2.dart';

class NanoId
{
  static String generate() => nanoid(length: 8, alphabet: Alphabet.hexadecimalUppercase);
}