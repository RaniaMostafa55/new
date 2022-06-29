import 'package:Course/register.dart';
import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';

class Onboard extends StatefulWidget {
  const Onboard({Key? key}) : super(key: key);

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  late Material materialButton;
  late int index;
  final onboardingPagesList = [
    PageModel(
      widget: SingleChildScrollView(
        controller: ScrollController(),
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("7", style: TextStyle(color: Colors.yellow[700], fontSize: 30, fontWeight: FontWeight.bold)),
                  Text("Krave", style: TextStyle(color: Colors.teal, fontSize: 30, fontWeight: FontWeight.bold))
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 45.0,
                  vertical: 45.0,
                ),
                child: Image.asset(
                  'assets/delv1.png',
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 45.0),
                child: Text(
                  'Get food delivery to your\ndoorstep asap',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
                child: Text(
                  'We have young and professional delivery\nteam that will bring your food as soon as\npossible to your doorstep',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    PageModel(
      widget: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          children: [
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("7", style: TextStyle(color: Colors.yellow[700], fontSize: 30, fontWeight: FontWeight.bold)),
                Text("Krave", style: TextStyle(color: Colors.teal, fontSize: 30, fontWeight: FontWeight.bold))
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 45.0,
                vertical: 45.0,
              ),
              child: Image.asset(
                'assets/delv2.png',
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 45.0),
              child: Text(
                'Buy Any Food from your\nfavorite restaurant',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
              child: Text(
                'We are constantly adding your favorite\nrestaurant throughout the territory and around\nyour area carefully selected',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    ),
    PageModel(
      widget: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          children: [
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("7", style: TextStyle(color: Colors.yellow[700], fontSize: 30, fontWeight: FontWeight.bold)),
                Text("Krave", style: TextStyle(color: Colors.teal, fontSize: 30, fontWeight: FontWeight.bold))
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 45.0,
                vertical: 45.0,
              ),
              child: Image.asset(
                'assets/delv1.png',
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 45.0),
              child: Text(
                'Get food delivery to your\ndoorstep asap',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
              child: Text(
                'We have young and professional delivery\nteam that will bring your food as soon as\npossible to your doorstep',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
    materialButton = _skipButton();
    index = 0;
  }

  Material _skipButton({void Function(int)? setIndex}) {
    return Material(
      borderRadius: BorderRadius.circular(15),
      color: Colors.teal,
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () {
          if (setIndex != null) {
            index = 2;
            setIndex(2);
          }
        },
        child: const Padding(
          padding: defaultSkipButtonPadding,
          child: Text('Skip', style: TextStyle(fontSize: 22)),
        ),
      ),
    );
  }

  Container _getStartedButton() {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: Material(
        color: Colors.teal,
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Get Started',
              style: TextStyle(fontSize: 22),
            ),
          ),
        ),
      ),
    );
  }

  TextButton get _signupButton {
    return TextButton(
      onPressed: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (contest) => Register(),
          ),
        );
      },
      child: Text(
        'Sign up',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Delivery',
      theme: ThemeData(),
      home: Scaffold(
        body: Container(
          color: Colors.white,
          child: Onboarding(
            pages: onboardingPagesList,
            onPageChange: (int pageIndex) {
              index = pageIndex;
            },
            startPageIndex: 0,
            footerBuilder: (context, dragDistance, pagesLength, setIndex) {
              return ColoredBox(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(45.0),
                  child: Column(
                    children: [
                      Center(
                        child: CustomIndicator(
                            netDragPercent: dragDistance,
                            pagesLength: pagesLength,
                            indicator: Indicator(
                              indicatorDesign: IndicatorDesign.line(
                                lineDesign: LineDesign(
                                  lineType: DesignType.line_nonuniform,
                                ),
                              ),
                            )),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      index == pagesLength - 1 ? _getStartedButton() : _skipButton(setIndex: setIndex),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account?"),
                          _signupButton
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
