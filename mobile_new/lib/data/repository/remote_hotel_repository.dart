import 'dart:io';

import 'package:mobile_new/data/network/failure_error_handler.dart';
import 'package:mobile_new/data/network/hotel_api.dart';
import 'package:mobile_new/data/repository/hotel_repository.dart';
import 'package:mobile_new/model/hotel_model.dart';

class RemoteHotelRepository extends HotelRepository {
  @override
  Future<List<HotelModel>> fetchHotels() async {
    try {
      final api = HotelApi();
      return await api.getHotels();
    } on SocketException {
      throw Failure('No internet connection', 400);
    } on HttpException {
      throw Failure('Not found request', 404);
    } on FormatException {
      throw Failure('Invalid JSON format', 666);
    } catch (e) {
      throw Failure('Unknown error', 888);
    }
  }
}
