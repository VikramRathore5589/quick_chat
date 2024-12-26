import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quick_chat/firestote/model/user_model.dart';

class UserChatService {
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;
  final String collection = 'users';

  Stream<List<UserModel>> getUserStream() {
    return fireStore.collection(collection).snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        Map<String, dynamic> json = doc.data();
        return UserModel.fromJson(json);
      }).toList();
    });
  }
}
