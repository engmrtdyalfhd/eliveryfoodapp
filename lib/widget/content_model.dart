class UnbordingContantModel {
  final String image;
  final String title;
  final String description;

  UnbordingContantModel({
    required this.image,
    required this.title,
    required this.description,
  });
}

List<UnbordingContantModel> contains = [
  UnbordingContantModel(
    image: "assets/images/screen1.png",
    title: "Selct frome Uor\n Best Menu",
    description: "Pick the best foods from over 1,000\n More than 35 times",
  ),
  UnbordingContantModel(
    image: "assets/images/screen2.png",
    title: "Fast Delivery\n Right to Your Door",
    description: "Fast food delivery to your home,\n office wherever you are",
  ),
  UnbordingContantModel(
    image: "assets/images/screen3.png",
    title: "Live Tracking\n of Your Order",
    description:
        "Real-time tracking of your food\n on the app once you placed the order",
  ),
];
