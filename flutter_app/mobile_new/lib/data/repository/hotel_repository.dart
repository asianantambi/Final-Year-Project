import 'dart:async';

import 'package:mobile_new/model/hotel_model.dart';

abstract class HotelRepository {
  Future<List<HotelModel>> fetchHotels();
}
