abstract class LocalDataInterface {
  Future<String?> getToken(); 
  Future<bool> setToken(String token); 
  Future<bool> clearAllData(); 
}