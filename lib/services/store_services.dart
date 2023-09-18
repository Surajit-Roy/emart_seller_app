import 'package:emart_seller/const/const.dart';

class StoreService{
  static getProfile(uid){
    return firestore.collection(vendorCollection).where("id", isEqualTo: uid).get();
  }
}