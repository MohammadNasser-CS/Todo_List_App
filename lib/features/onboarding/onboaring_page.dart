import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:todo_list/core/services/app_navigatort.dart';
import 'package:todo_list/core/widgets/custom_button.dart';
import 'package:todo_list/features/auth/start_screen/start_screen.dart';
import 'package:todo_list/features/onboarding/models/onboarding_model.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final List<OnboardingModel> _onboardingList = onBoardingModelList;
  final PageController _pageController = PageController();
  int _onboardingIndex = 0;
  bool isLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const SizedBox(height: 12),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      if (!isLastPage) {
                        _onboardingIndex = _onboardingList.length - 1;
                        _pageController.animateToPage(_onboardingIndex,
                            duration: const Duration(microseconds: 400),
                            curve: Curves.fastOutSlowIn);
                      }
                    },
                    child: const Text(
                      'SKIP',
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12.0),
              Expanded(
                flex: 5,
                child: PageView.builder(
                  onPageChanged: (currentIndex) {
                    setState(() {
                      _onboardingIndex = currentIndex;
                      if (currentIndex == (_onboardingList.length - 1)) {
                        isLastPage = true;
                      } else {
                        isLastPage = false;
                      }
                    });
                  },
                  controller: _pageController,
                  itemCount: _onboardingList.length,
                  itemBuilder: (context, index) =>
                      SvgPicture.asset(_onboardingList[index].image),
                ),
              ),
              const SizedBox(height: 50.0),
              SmoothPageIndicator(
                controller: _pageController, // PageController
                count: _onboardingList.length,
                effect: const SlideEffect(
                  dotHeight: 4.0,
                  dotWidth: 32,
                  spacing: 10.0,
                ), // your preferred effect
              ),
              Expanded(
                flex: 4,
                child: Column(
                  children: [
                    const SizedBox(height: 50.0),
                    Text(
                      _onboardingList[_onboardingIndex].title,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                    const SizedBox(height: 50.0),
                    Text(
                      _onboardingList[_onboardingIndex].description,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFFFFFFF),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50.0),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      if (_onboardingIndex > 0) {
                        _onboardingIndex--;
                        _pageController.animateToPage(_onboardingIndex,
                            duration: const Duration(microseconds: 400),
                            curve: Curves.fastOutSlowIn);
                      }
                    },
                    child: const Text(
                      'BACK',
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const Spacer(),
                  CustomButton(
                      onPressed: () {
                        if (!isLastPage) {
                          _onboardingIndex++;
                          _pageController.animateToPage(_onboardingIndex,
                              duration: const Duration(microseconds: 400),
                              curve: Curves.fastOutSlowIn);
                        } else {
                          AppNavigator.navigateInto(
                              context, const StartScreen());
                        }
                      },
                      title: isLastPage ? 'Get Started' : 'Next'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
