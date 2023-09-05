import 'package:todo_list/core/constants/svg_paths.dart';

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
    image: SvgPaths.onboarding_1,
    description:
        'You can easily manage all of your daily tasks in DoMe for free',
  ),
  OnboardingModel(
      title: 'Create daily routine',
      image: SvgPaths.onboarding_2,
      description:
          'In Uptodo  you can create your personalized routine to stay productive'),
  OnboardingModel(
      title: 'Orgonaize your tasks',
      image: SvgPaths.onboarding_3,
      description:
          'You can organize your daily tasks by adding your tasks into separate categories'),
];
