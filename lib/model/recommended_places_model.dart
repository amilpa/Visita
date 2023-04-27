// ignore_for_file: public_member_api_docs, sort_constructors_first
class RecommendedPlaceModel {
  final String image;
  final double rating;
  final String name;
  final String location;
  RecommendedPlaceModel({
    required this.image,
    required this.rating,
    required this.name,
    required this.location,
  });
}

List<RecommendedPlaceModel> recommendedPlaces = [
  RecommendedPlaceModel(
      image: "assets/Recomendations_Images/idukkidam.jpg",
      rating: 4.4,
      name: "Idukki Dam",
      location: "Idukki"),
  RecommendedPlaceModel(
    image: "assets/Recomendations_Images/kumily.jpg",
    rating: 4.4,
    name: "Kumily",
    location: "Idukki",
  ),
  RecommendedPlaceModel(
      image: "assets/Recomendations_Images/wildlife.jpg",
      rating: 4.4,
      name: "Wildlife Sanctuary",
      location: "Idukki"),
  RecommendedPlaceModel(
      image: "assets/Recomendations_Images/illikkal.jpg",
      rating: 4.4,
      name: "Illikkal Kallu",
      location: "Kottayam"),
  RecommendedPlaceModel(
      image: "assets/Recomendations_Images/fortkochi.jpg",
      rating: 4.4,
      name: "Fort Kochi",
      location: "Kochi"),
];
