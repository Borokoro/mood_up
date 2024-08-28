import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';

class AppSecrets{
  static String? _publicKey;

  Future<String> get publicKey async{
    if(_publicKey !=null){
      return _publicKey!;
    }
    _publicKey= await _getPublicKey();
    return _publicKey!;
  }

  Future<String> _getPublicKey() async{
    final CollectionReference<Map<String, dynamic>> apiKeyCollection =
    FirebaseFirestore.instance.collection("apiKey");
    final document=await apiKeyCollection.get();
    for (var element in document.docs){
      return element.data()['apiKey'];
    }
    return "error";
  }

  Future<String> getHash(int time) async{
    late String privateKey;
    final CollectionReference<Map<String, dynamic>> apiKeyCollection =
    FirebaseFirestore.instance.collection("privateKey");
    final document=await apiKeyCollection.get();
    for (var element in document.docs){
      privateKey=element.data()['privateKey'];
    }
    return md5.convert(utf8.encode('$time$privateKey$_publicKey')).toString();
  }
}