import 'package:mobile_new/data/repository/hotel_repository.dart';
import 'package:mobile_new/model/hotel_model.dart';

class MockHotelRepository extends HotelRepository {
  @override
  Future<List<HotelModel>> fetchHotels() async {
    // ignore: prefer_const_constructors
    await Future.delayed(Duration(seconds: 1));
    return [
      HotelModel(
        name: 'single room',
        floor: '2nd floor',
        price: 150000,
        imageUrl: 'assets/img/room1.jpg',
            // 'https://q-cf.bstatic.com/images/hotel/max1024x768/209/209735787.jpg',
      ),
      HotelModel(
        name: 'Family room',
        floor: '1st floor',
        price: 500000,
        imageUrl: 'assets/img/familyroom1.jpg',
            // 'https://q-cf.bstatic.com/images/hotel/max1024x768/163/163564419.jpg',
      ),
      HotelModel(
        name: 'Twin room',
        floor: '3rd floor',
        price: 350000,
        imageUrl: 'assets/img/twin1.jpg',
      ),
      HotelModel(
        name: 'Single room',
        floor: '5th floor',
        price: 200000,
        imageUrl: 'assets/img/room3.jpg',
            // 'https://thumbs.dreamstime.com/b/pasillo-del-hotel-39479289.jpg',
      ),
    ];
  }
}
