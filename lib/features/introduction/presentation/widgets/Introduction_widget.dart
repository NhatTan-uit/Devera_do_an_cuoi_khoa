import 'package:devera_do_an_cuoi_khoa/features/authorization/presentation/pages/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:devera_do_an_cuoi_khoa/core/widgets/button_type_one.dart';

class IntroductionToAppWidget extends StatefulWidget {
  const IntroductionToAppWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<IntroductionToAppWidget> createState() => _IntroductionToAppWidgetState();
}

class _IntroductionToAppWidgetState extends State<IntroductionToAppWidget> {
  bool isEnd = false;
  String firstText = "Find your   Comfort";
  String secondText = "Food here";
  String subtitleText = "Here You Can find a chef or dish for every taste and color. Enjoy!";
  String buttonText = "Next";
  String assetsImgText = "assets/images/introduction_screen_1.png";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 450.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(assetsImgText),
              fit: BoxFit.fill,
            ),
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Text(
          firstText,
          style: Theme.of(context).textTheme.headline6,
        ),
        Text(
          secondText,
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(
          height: 20.0,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 60.0),
          child: Text(
            subtitleText,
            style: Theme.of(context).textTheme.subtitle2,
            textAlign: TextAlign.center,
          ),
        ),
        Spacer(),
        ButtonTypeOne(
          inputText: buttonText,
          buttonMarginValue: EdgeInsets.fromLTRB(110, 20, 110, 0),
          onPress: () {
            if (!isEnd) {
              setState(() {
                firstText = "Food Ninja is Where Your";
                secondText = "Comfort Food Lives";
                buttonText = "Finish";
                subtitleText = "Enjoy a Fast and smooth food delivery at your door step";
                assetsImgText = "assets/images/introduction_screen_2.png";
                isEnd = false;
              });
            }
            else {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => RegisterScreen()));
            }
          },
        ),
        const SizedBox(
          height: 20.0,
        )
      ],
    );
  }
}

