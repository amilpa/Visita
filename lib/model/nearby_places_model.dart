// ignore_for_file: public_member_api_docs, sort_constructors_first
class NearbyPlaceModel {
  final String image;
  final String name;
  final String location;
  final String rating;
  NearbyPlaceModel({
    required this.image,
    required this.name,
    required this.location,
    required this.rating,
  });
}

List<NearbyPlaceModel> nearbyPlaces = [
  NearbyPlaceModel(
    image: "assets/nearbyplaces/kottaram.jpg",
    name: "Ammachi Kottaram",
    location: "Peermade,Kuttikkanam",
    rating: "4.5",
  ),
  NearbyPlaceModel(
    image: "assets/nearbyplaces/waterfalls.jpg",
    name: " Valanjanganam Water Falls",
    location: "Murinjapuzha",
    rating: "4.2",
  ),
  NearbyPlaceModel(
    image: "assets/nearbyplaces/pachalimedu.jpg",
    name: "Panchalimedu ",
    location: "Peermade,Mundakkayam",
    rating: "4.6",
  ),
];
