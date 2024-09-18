class onboardingInfo{
  String image;
  String title;
  String description;
  onboardingInfo({required this.title,required this.image,required this.description});
}
List<onboardingInfo>contents=[
  onboardingInfo(
      title: "  Your favorite place to work",
      image:"assets/Shared workspace-amico (1) 1.png",
      description:"In Shaghaf Co-working space, we provide a place that makes you more productive, enjoyable and comfortable      A place made up of different parts"
  ),
  onboardingInfo(
      title: "Delightful open air",
      image: "assets/Game day-amico 1.png",
      description:"You can choose a game to play from the many games we have, sit at a comfortable base, or take pictures in the different places that have been specially made to take beautiful pictures."
  ),
  onboardingInfo(
      title: "Choose your favorite room",
      image: "assets/Prototyping process-amico (1) 1.png",
      description: "You can find the right room for your current mood, as we have many rooms that meet all needs, You can move between funny room, training room and meeting room"),
];