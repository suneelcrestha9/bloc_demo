import 'package:demo/data/model/dress_model.dart';
import 'package:demo/data/services/dress_api_services.dart';

class DressRepository {
  final DressApiServices _dressApiServices = DressApiServices();

  // future function to fetch the dress
  Future<List<DressModel>> getDress() {
    return _dressApiServices.fetchDress();
  }

  // function to delete the dress using the id
  Future deleteDress(String id) {
    return _dressApiServices.deleteDress(id);
  }
}
