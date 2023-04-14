import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../shared/network/local/cashe_helper.dart';
import '../login/login_screen.dart';

class OnBoardingModel {
  final String image;
  final String title;
  final String body;

  OnBoardingModel(
      {required this.image, required this.title, required this.body});
}

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var onBoardController = PageController();

  List<OnBoardingModel> onboard = [
    OnBoardingModel(
      image: 'assets/images/on_boarding/onboard_1.png',
      title: 'Screen 1 Title',
      body: 'Screen 1 Body',
    ),
    OnBoardingModel(
        image: 'assets/images/on_boarding/onboard_2.png',
        title: 'Screen 2 Title',
        body: 'Screen 2 Body'),
    OnBoardingModel(
        image: 'assets/images/on_boarding/onboard_3.png',
        title: 'Screen 3 Title',
        body: 'Screen 3 Body')
  ];

  bool isLast = false;

  void submit() {
    CacheHelper.saveData(key: 'onBoard', value: true).then((value) {
      if (value) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ),
          (route) => false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          TextButton(
              onPressed: submit,
              child: Text(
                'Skip',
                style: TextStyle(fontSize: 17, color: Colors.blue),
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (index) {
                  if (index == onboard.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                physics: BouncingScrollPhysics(),
                controller: onBoardController,
                itemBuilder: (BuildContext context, int index) =>
                    BuildItem(onboard[index]),
                itemCount: onboard.length,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                    effect:
                        WormEffect(activeDotColor: Colors.blue, spacing: 10),
                    controller: onBoardController,
                    count: onboard.length),
                Spacer(),
                Container(
                  width: 60,
                  height: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(50)),
                  child: IconButton(
                      color: Colors.white,
                      onPressed: () {
                        if (isLast) {
                          submit();
                        } else {
                          onBoardController.nextPage(
                              duration: Duration(milliseconds: 700),
                              curve: Curves.decelerate);
                        }
                      },
                      icon: Icon(Icons.arrow_forward_ios)),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget BuildItem(OnBoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Image.asset('${model.image}')),
          Text(
            '${model.title}',
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          // Text(
          //   '${model.body}',
          //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          // ),
        ],
      );
}
