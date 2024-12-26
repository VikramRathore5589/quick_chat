import 'package:flutter/widgets.dart';
import 'package:quick_chat/firestote/model/user_model.dart';
import 'package:quick_chat/firestote/service/user_service.dart';

class UserChatProvider extends ChangeNotifier {
  final UserChatService userChatService;

  UserChatProvider(this.userChatService);

  Stream<List<UserModel>> getUserStreams() {
    return userChatService.getUserStream();
  }
}
