import 'package:pet/core/network/api_client.dart';
import 'package:pet/data/models/animal_model.dart';



class AnimalRemoteDs {
  final ApiClient apiClient;

  AnimalRemoteDs(this.apiClient);

  Future<AnimalModel> addAnimalTodb(AnimalModel animal) async {
    final result = await apiClient.post(
      '/animal',
      animal.toJson(),
    );

    return AnimalModel.fromJson(
      result['animal'],
    );
  }
}