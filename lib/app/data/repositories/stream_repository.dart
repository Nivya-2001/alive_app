import '../models/stream_model.dart';

class StreamRepository {
  // Swap this with a real Dio/http call to your REST API later.
  Future<List<StreamModel>> fetchStreams() async {
    await Future.delayed(const Duration(milliseconds: 400));
    return List.generate(
      8,
      (i) => StreamModel(
        id: 'stream_$i',
        username: 'Sofia Chen',
        imageUrl: 'https://picsum.photos/seed/$i/400/600',
        viewerCount: '8.2K',
        countryFlag: '🇵🇭',
      ),
    );
  }
}