import 'package:get/get.dart';
import '../../data/models/stream_model.dart';
import '../../data/repositories/stream_repository.dart';

class HomeController extends GetxController {
  final StreamRepository _streamRepository;
  HomeController(this._streamRepository);

  final streams = <StreamModel>[].obs;
  final isLoading = true.obs;
  final selectedTab = 'Stream'.obs;
  final selectedRegion = 'Global'.obs;

  @override
  void onInit() {
    super.onInit();
    loadStreams();
  }

  Future<void> loadStreams() async {
    isLoading.value = true;
    streams.value = await _streamRepository.fetchStreams();
    isLoading.value = false;
  }

  void changeTab(String tab) => selectedTab.value = tab;
  void changeRegion(String region) => selectedRegion.value = region;
}