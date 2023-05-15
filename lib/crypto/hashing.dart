import 'package:crypt/crypt.dart';

class HashingUtils {
  HashingUtils();

  String hash(String value, int saltRounds) {
    return Crypt.sha256(value, rounds: saltRounds).toString();
  }

  bool verifyAgainstHash(String value, String hashedValue) {
    return Crypt(hashedValue).match(value);
  }
}