import 'package:cloud_firestore/cloud_firestore.dart';

class AppSecrets{
  static String? _publicKey;
  static String? _hash;

  Future<String> get publicKey async{
    if(_publicKey !=null){
      return _publicKey!;
    }
    _publicKey= await _getPublicKey();
    return _publicKey!;
  }

  Future<String> get hash async{
    if(_hash !=null){
      return _hash!;
    }
    _hash= await _getHash();
    return _hash!;
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

  Future<String> _getHash() async{
    final CollectionReference<Map<String, dynamic>> apiKeyCollection =
    FirebaseFirestore.instance.collection("hash");
    final document=await apiKeyCollection.get();
    for (var element in document.docs){
      return element.data()['hash'];
    }
    return "error";
  }
}