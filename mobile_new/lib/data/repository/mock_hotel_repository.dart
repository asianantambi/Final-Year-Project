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
        description: "A luxurious experience",
        imageUrl: 'assets/img/room1.jpg',
        reviews: _reviews
            // 'https://q-cf.bstatic.com/images/hotel/max1024x768/209/209735787.jpg',
      ),
      HotelModel(
        name: 'Family room',
        floor: '1st floor',
        price: 500000,
        description: "A family's home away from home",
        imageUrl: 'assets/img/familyroom1.jpg',
         reviews: _reviews
            // 'https://q-cf.bstatic.com/images/hotel/max1024x768/163/163564419.jpg',
      ),
      HotelModel(
        name: 'Twin room',
        floor: '3rd floor',
        price: 350000,
        description: "A wide bed space",
        imageUrl: 'assets/img/twin1.jpg',
        reviews: _reviews
      ),
      HotelModel(
        name: 'Double room',
        floor: '5th floor',
        price: 200000,
        description: "A Double room for your pleasure",
        imageUrl: 'assets/img/room3.jpg',
        reviews: _reviews
            // 'https://thumbs.dreamstime.com/b/pasillo-del-hotel-39479289.jpg',
      ),
    ];
  }

  final List<Review> _reviews = [
     Review(
        message: 'Great Experience',
        user: 'Joan',
        userImage: 'assets/img/admin.jpg',
        rate: 100
        
      ),
      Review(
        message: 'This is the best',
        user: 'Pretty',
        userImage: 'assets/img/admin.jpg',
        rate: 99
        
      ),
      Review(
        message: 'I will coma back',
        user: 'Phiona',
        userImage: 'assets/img/admin.jpg',
        rate: 40
        
      ),
      Review(
        message: 'I am contented',
        user: 'Winnie',
        userImage: 'assets/img/admin.jpg',
        rate: 100
        
      ),
  ];

   Future<List<Review>> fetchReviews() async {
    // ignore: prefer_const_constructors
    await Future.delayed(Duration(seconds: 1));
    return [
      Review(
        message: 'Great Experience',
        user: 'Joan',
        userImage: 'assets/img/admin.jpg',
        rate: 100
        
      ),
      Review(
        message: 'This is the best',
        user: 'Pretty',
        userImage: 'assets/img/admin.jpg',
        rate: 99
        
      ),
      Review(
        message: 'I will coma back',
        user: 'Phiona',
        userImage: 'assets/img/admin.jpg',
        rate: 40
        
      ),
      Review(
        message: 'I am contented',
        user: 'Winnie',
        userImage: 'assets/img/admin.jpg',
        rate: 100
        
      ),
    ];
  }
}
