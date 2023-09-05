class OnboardingModel {
  final String title;
  final String image;
  final String description;

  OnboardingModel({
    required this.title,
    required this.image,
    required this.description,
  });
}

List<OnboardingModel> onBoardingModelList = [
  OnboardingModel(
    title: 'Manage your tasks',
    image: 'assets/images/onboarding_1.svg',
    description:
        'You can easily manage all of your daily tasks in DoMe for free',
  ),
  OnboardingModel(
      title: 'Create daily routine',
      image: 'assets/images/onboarding_2.svg',
      description:
          'In Uptodo  you can create your personalized routine to stay productive'),
  OnboardingModel(
      title: 'Orgonaize your tasks',
      image: 'assets/images/onboarding_3.svg',
      description:
          'You can organize your daily tasks by adding your tasks into separate categories'),
];
