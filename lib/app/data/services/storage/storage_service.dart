import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

enum StoregeKey { token }

class StorageService extends GetxService {
  final box = GetStorage();
  final _token = ''.obs;
  String get token => _token.value;

  @override
  void onInit() {
    _token.value = box.read(StoregeKey.token.toString());
    super.onInit();
  }

  Future<void> saveToken(String token) async {
    return box.write('${StoregeKey.token}', token);
  }
}
