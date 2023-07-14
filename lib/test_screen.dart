import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_work/theme/colors.dart';
import 'package:test_work/theme/text_styles.dart';
//import 'package:test_work/models/models.dart';

import 'buttons.dart';
import 'models.dart';

//import 'package:theme/colors.dart';
//import 'package:mvp_taplan/theme/text_styles.dart';
//import 'mvp_scaffold_model.dart';

class TestWork extends StatefulWidget {
  const TestWork({super.key});

  @override
  State<TestWork> createState() => TestWorkState();
}

class TestWorkState extends State<TestWork> {
  static const images = [
    'assets/images/present_1.png',
    'assets/images/present_1.png',
    'assets/images/present_1.png',
    'assets/images/present_1.png',
    'assets/images/present_1.png',
    'assets/images/present_1.png',
  ];
  static const List<Color> buttonGroupColorMain = [
    Color.fromRGBO(83, 170, 190, 1),
    Color.fromRGBO(103, 143, 218, 1),
    Color.fromRGBO(123, 108, 232, 1),
    Color.fromRGBO(182, 104, 236, 1),
    Color.fromRGBO(237, 143, 232, 1),
  ];
  static const List<Color> buttonGroupColorCount = [
    Color.fromRGBO(181, 218, 227, 1),
    Color.fromRGBO(194, 210, 240, 1),
    Color.fromRGBO(201, 195, 245, 1),
    Color.fromRGBO(224, 192, 246, 1),
    Color.fromRGBO(248, 208, 246, 1),
  ];
  static const List<String> buttonGroupText = [
    "Семья",
    "Друзья",
    "Близкие",
    "Коллеги",
    "Партнеры",
  ];
  static const List<String> buttonGroupPicture = [
    "assets/svg/family.svg",
    "assets/svg/friends.svg",
    "assets/svg/folks.svg",
    "assets/svg/workmates.svg",
    "assets/svg/partners.svg",
  ];

  List<bool> buttonNavIsPressed = [false, false, false, false, false];
  List<bool> buttonGroupIsPressed = [false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return MvpScaffoldModel(
      appBarLabel: 'Ограничение круга лиц\nдля демонстрации дат',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: getHeight(context, 18),
            ),
          ),
          createEvent(),
          Padding(
            padding: EdgeInsets.only(
              top: getHeight(context, 18),
            ),
          ),
          birthDay(),
          Padding(
            padding: EdgeInsets.only(
              top: getHeight(context, 9),
            ),
          ),
          groupButtons(),
          Padding(
            padding: EdgeInsets.only(
              top: getHeight(context, 24),
            ),
          ),
          pickCelebrate(),
          Padding(
            padding: EdgeInsets.only(
              top: getHeight(context, 24),
            ),
          ),
          listOfChannels(),
          Padding(
            padding: EdgeInsets.only(
              top: getHeight(context, 18),
            ),
          ),
          bottomNavBar(),
        ],
      ),
    );
  }

  Widget createEvent() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getWidth(context, 16),
      ),
      child: Row(
        children: [
          SizedBox(
            height: getHeight(context, 54),
            width: getWidth(context, 54),
            child: const DecoratedBox(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/svg/present_1.png',
                  ),
                  fit: BoxFit.fill,
                ),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Наталья Фадеева',
                  style: TextLocalStyles.roboto500.copyWith(
                    color: Colors.white,
                    fontSize: 16,
                    height: 0,
                  ),
                ),
                Text(
                  'г. Тула, Россия',
                  style: TextLocalStyles.roboto400.copyWith(
                    color: const Color.fromRGBO(188, 192, 200, 1),
                    fontSize: 14,
                    height: 0,
                  ),
                )
              ],
            ),
          ),
          const Expanded(child: SizedBox()),
          SizedBox(
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                gradient: const LinearGradient(
                  colors: [
                    Color.fromRGBO(98, 198, 170, 0.06),
                    Color.fromRGBO(68, 168, 140, 0.06),
                  ],
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: getHeight(context, 8),
                  horizontal: getWidth(context, 8),
                ),
                child: Column(
                  children: [
                    Text(
                      'Создать\nсобытие',
                      style: TextLocalStyles.roboto400.copyWith(
                        color: const Color.fromRGBO(62, 174, 143, 1),
                        fontSize: 10,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: getHeight(context, 3),
                      ),
                    ),
                    SvgPicture.asset('assets/svg/add_event.svg'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget birthDay() {
    return SizedBox(
      child: ColoredBox(
        color: const Color.fromRGBO(0, 0, 0, 0.5),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getWidth(context, 16),
            vertical: getHeight(context, 8),
          ),
          child: Row(
            children: [
              SizedBox(
                height: getHeight(context, 54),
                width: getHeight(context, 54),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: getHeight(context, 54),
                              child: const DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(45, 166, 193, 1),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              height: getHeight(context, 54),
                              child: const ColoredBox(
                                color: Color.fromRGBO(103, 143, 218, 1),
                              ),
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              height: getHeight(context, 54),
                              child: const ColoredBox(
                                color: Color.fromRGBO(123, 108, 232, 1),
                              ),
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              height: getHeight(context, 54),
                              child: const ColoredBox(
                                color: Color.fromRGBO(182, 104, 236, 1),
                              ),
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              height: getHeight(context, 54),
                              child: const DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(236, 104, 207, 1),
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SvgPicture.asset('assets/svg/birthday.svg'),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: getWidth(context, 6),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'День рождения дочери и её мамы',
                    style: TextLocalStyles.roboto600.copyWith(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: getHeight(context, 4),
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: getHeight(context, 34),
                        width: getWidth(context, 121),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(52, 54, 62, 1),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: const Color.fromRGBO(66, 68, 77, 1),
                              width: 1.2,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: getWidth(context, 6),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '25 Сентября',
                                  style: TextLocalStyles.roboto400.copyWith(
                                    color:
                                        const Color.fromRGBO(244, 199, 217, 1),
                                    fontSize: 14,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: getWidth(context, 5),
                                  ),
                                ),
                                SizedBox(
                                  height: getHeight(context, 20),
                                  width: getHeight(context, 20),
                                  child: const DecoratedBox(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color.fromRGBO(87, 99, 107, 1),
                                    ),
                                    child: Icon(
                                      Icons.more_vert,
                                      size: 16,
                                      color: Color.fromRGBO(166, 173, 181, 1),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: getWidth(context, 4),
                        ),
                      ),
                      SizedBox(
                        height: getHeight(context, 34),
                        width: getWidth(context, 121),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(52, 54, 62, 1),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: const Color.fromRGBO(66, 68, 77, 1),
                              width: 1.2,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: getWidth(context, 6),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color.fromRGBO(98, 198, 170, 1),
                                          Color.fromRGBO(68, 168, 140, 1),
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: getWidth(context, 3),
                                      ),
                                      child: Text(
                                        'Торжество',
                                        style:
                                            TextLocalStyles.roboto400.copyWith(
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: getWidth(context, 5),
                                  ),
                                ),
                                SizedBox(
                                  height: getHeight(context, 20),
                                  width: getHeight(context, 20),
                                  child: const DecoratedBox(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color.fromRGBO(87, 99, 107, 1),
                                    ),
                                    child: Icon(
                                      Icons.more_vert,
                                      size: 16,
                                      color: Color.fromRGBO(166, 173, 181, 1),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: getWidth(context, 4),
                        ),
                      ),
                      SizedBox(
                        height: getHeight(context, 34),
                        width: getHeight(context, 34),
                        child: const DecoratedBox(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromRGBO(87, 99, 107, 1),
                          ),
                          child: Icon(
                            Icons.close,
                            color: Color.fromRGBO(157, 167, 176, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget groupButtons() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getWidth(context, 16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              'Показывать события в группах контакта',
              style: TextLocalStyles.roboto500.copyWith(
                color: const Color.fromRGBO(98, 198, 170, 1),
                fontSize: 16,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (int i = 0; i < 5; i++)
                ButtonGroup(
                  colorMain: buttonGroupColorMain[i],
                  picture: buttonGroupPicture[i],
                  colorCount: buttonGroupColorCount[i],
                  text: buttonGroupText[i],
                  isPressed: buttonGroupIsPressed[i],
                  onTap: () {
                    buttonGroupIsPressed[i] = !buttonGroupIsPressed[i];
                    setState(() {});
                  },
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget pickCelebrate() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getWidth(context, 16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Показывать праздник выборочно: ',
            style: TextLocalStyles.roboto500.copyWith(
              color: const Color.fromRGBO(98, 198, 170, 1),
              fontSize: 16,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: getHeight(context, 12),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: getWidth(context, 164),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: const Color.fromRGBO(110, 210, 182, 1),
                  ),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: getHeight(context, 6),
                      ),
                      child: Text(
                        'Праздничное\nторжество',
                        style: TextLocalStyles.roboto500.copyWith(
                          color: Colors.white,
                          fontSize: 14,
                          height: 0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: getWidth(context, 164),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: const Color.fromRGBO(110, 210, 182, 1),
                  ),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: getHeight(context, 6),
                      ),
                      child: Text(
                        'Групповое\nмероприятие',
                        style: TextLocalStyles.roboto500.copyWith(
                          color: Colors.white,
                          fontSize: 14,
                          height: 0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget listOfChannels() {
    return Expanded(
      child: ListView.separated(
        padding: EdgeInsets.symmetric(
          horizontal: getWidth(context, 16),
        ),
        itemBuilder: (context, index) {
          return channel(index == 0);
        },
        separatorBuilder: (_, __) => Padding(
          padding: EdgeInsets.only(
            top: getHeight(context, 10),
          ),
        ),
        itemCount: images.length,
      ),
    );
  }

  Widget channel(bool isFirst) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              height: getHeight(context, 54),
              width: getHeight(context, 54),
              child: const DecoratedBox(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/present_1.png',
                    ),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: getWidth(context, 8),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Наталья Фадеева',
                  style: TextLocalStyles.roboto500.copyWith(
                    color: Colors.white,
                    fontSize: 16,
                    height: 0,
                  ),
                ),
                Text(
                  'г. Тула, Россия',
                  style: TextLocalStyles.roboto400.copyWith(
                    color: const Color.fromRGBO(188, 192, 200, 1),
                    fontSize: 14,
                    height: 0,
                  ),
                )
              ],
            ),
            const Expanded(child: SizedBox()),
            SizedBox(
              height: getHeight(context, 34),
              width: getWidth(context, 34),
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(69, 78, 84, 1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  isFirst ? Icons.close : Icons.add,
                  color: const Color.fromRGBO(157, 167, 176, 1),
                ),
              ),
            ),
            if (isFirst) ...[
              SizedBox(
                height: getHeight(context, 34),
                width: getWidth(context, 34),
                child: const DecoratedBox(
                  decoration: BoxDecoration(
                      gradient: AppTheme.mainGreenGradient,
                      shape: BoxShape.circle),
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
            top: getHeight(context, 10),
          ),
        ),
        SizedBox(
          width: getWidth(context, 343),
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromRGBO(66, 68, 77, 1),
                width: 1,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget bottomNavBar() {
    return SizedBox(
      height: getHeight(context, 83),
      width: getWidth(context, 375),
      child: ColoredBox(
        color: const Color.fromRGBO(0, 0, 0, 0.25),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getWidth(context, 16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BottomNavButton(
                picture: 'assets/svg/home.svg',
                isPressed: buttonNavIsPressed[0],
                onTap: () {
                  buttonNavIsPressed[0] = !buttonNavIsPressed[0];
                  setState(() {});
                },
              ),
              BottomNavButton(
                picture: 'assets/svg/book.svg',
                isPressed: buttonNavIsPressed[1],
                onTap: () {
                  buttonNavIsPressed[1] = !buttonNavIsPressed[1];
                  setState(() {});
                },
              ),
              BottomNavCenterButton(
                  isPressed: buttonNavIsPressed[2],
                  onTap: () {
                    buttonNavIsPressed[2] = !buttonNavIsPressed[2];
                    setState(() {});
                  }),
              BottomNavButton(
                picture: 'assets/svg/forward.svg',
                isPressed: buttonNavIsPressed[3],
                onTap: () {
                  buttonNavIsPressed[3] = !buttonNavIsPressed[3];
                  setState(() {});
                },
              ),
              BottomNavButton(
                picture: 'assets/svg/stars.svg',
                isPressed: buttonNavIsPressed[4],
                onTap: () {
                  buttonNavIsPressed[4] = !buttonNavIsPressed[4];
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
