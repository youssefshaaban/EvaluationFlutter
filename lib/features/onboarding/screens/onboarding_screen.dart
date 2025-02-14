import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:evaluation/common/constants/routes.dart';
import 'package:evaluation/common/constants/strings.dart';
import 'package:evaluation/common/extensions/context_extension.dart';
import 'package:evaluation/common/injection/injection_container.dart';
import 'package:evaluation/features/base/presentation/widgets/app_primary_button.dart';
import 'package:evaluation/features/user_auth/presentation/screens/login_screen.dart';
import 'package:evaluation/gen/assets.gen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  static const routeName = './onBoarding';
  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _onboardingData = [
    {
      "image": Assets.images.onBoarding1.path,
      "title": LocaleKeys.onBoardingTitleOne.tr(),
      "description": LocaleKeys.onBoardingDescriptionOne.tr()
    },
    {
      "image": Assets.images.onBoarding2.path,
      "title": LocaleKeys.onBoardingTitleTwo.tr(),
      "description": LocaleKeys.onBoardingDescriptionTwo.tr()
    },
    {
      "image": Assets.images.onBoarding3.path,
      "title": LocaleKeys.onBoardingTitleThree.tr(),
      "description": LocaleKeys.onBoardingDescriptionThree.tr()
    },
  ];

  void _nextPage() {
    if (_currentPage < _onboardingData.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      final provider = ref.read(baseLocalDataSourceProvider);
      provider.setOnBoarding();
      Navigator.of(Routes.navigatorKey.currentContext!)
          .pushReplacementNamed(LoginScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.onPrimary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: _currentPage > 0
            ? Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: GestureDetector(
                  onTap: () {
                    _pageController.previousPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOutQuad,
                    );
                  },
                  child: SizedBox(
                    width: 32,
                    height: 32,
                    child: Image.asset(
                      Assets.images.back.path,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              )
            : null,
        actions: [
          InkWell(
            onTap: () {
              final provider = ref.read(baseLocalDataSourceProvider);
              provider.setOnBoarding();
              Navigator.of(Routes.navigatorKey.currentContext!)
                  .pushReplacementNamed(LoginScreen.routeName);
            },
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: Text(
                LocaleKeys.skip.tr(),
                style: TextStyle(color: Colors.grey),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Image.asset(
            Assets.images.appLogo.path,
            height: 36,
          ),
          SizedBox(
            height: 32,
          ),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: _onboardingData.length,
              itemBuilder: (context, index) {
                final item = _onboardingData[index];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      item["image"]!,
                      height: 250,
                    ),
                    SizedBox(height: 20),
                    Text(
                      item["title"]!,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Text(
                        item["description"]!,
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          SizedBox(height: 16),
          SmoothPageIndicator(
            controller: _pageController,
            count: _onboardingData.length,
            effect: ExpandingDotsEffect(
                dotHeight: 12,
                dotWidth: 12,
                activeDotColor: Colors.blue,
                dotColor: Colors.grey[300]!,
                radius: 0),
          ),
          SizedBox(height: 24),
          Padding(
              padding: EdgeInsets.symmetric(
                  vertical: 64.0,
                  horizontal:
                      _currentPage == _onboardingData.length - 1 ? 16 : 100),
              child: AppPrimaryButton(
                title: _currentPage == _onboardingData.length - 1
                    ? LocaleKeys.start.tr()
                    : LocaleKeys.next.tr(),
                onPressed: _nextPage,
              )),
        ],
      ),
    );
  }
}
