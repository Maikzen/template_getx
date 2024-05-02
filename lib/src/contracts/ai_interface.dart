abstract class AIInterface {
  Stream<String> getChatStream(String prompt);
  Future<Map<String, dynamic>> getChat(String prompt);
}