// ignore_for_file: depend_on_referenced_packages, avoid_print

import 'package:encrypt/encrypt.dart' as encrypt;

class DataProtection {
  static final key = encrypt.Key.fromLength(32);
  static final iv = encrypt.IV.fromLength(16);
  static final encrypter = encrypt.Encrypter(encrypt.AES(key));

  static encryptAES(text) {
    final encrypted = encrypter.encrypt(text, iv: iv);


    return encrypted;
  }

  static decryptAES(text) {
    final decrypted = encrypter.decrypt(text, iv: iv);
    return decrypted;
  }
}