import 'package:get/instance_manager.dart';
import 'package:template/src/contracts/ai_interface.dart';
import 'package:template/src/screens/chat/chat_controller.dart';
import 'package:template/src/services/ai_service.dart';

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AIInterface>(AIService(preferencesService: Get.find()));
    Get.lazyPut<ChatController>(() => ChatController(
          preferencesService: Get.find(),
          aiService: Get.find(),
        ));
  }
}
