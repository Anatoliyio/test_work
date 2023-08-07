import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:test_work/provider.dart';
import 'package:test_work/screen_28/screen_28.dart';
import 'package:test_work/theme/colors.dart';
import 'package:test_work/theme/text_styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_work/blocs/date_time_bloc/date_time_bloc.dart';

import 'package:flutter/material.dart';
//import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

import 'buttons.dart';
import 'models.dart';

class TestWork extends StatefulWidget {
  const TestWork({super.key});

  @override
  State<TestWork> createState() => TestWorkState();
}

class TestWorkState extends State<TestWork> {
  var token;

  void getToken() async {
    var url = 'https://qviz.fun/auth/token/login/';
    var dio = Dio();
    var response = await dio.post(url, data: {
      'phoneNumber': '+79611485522',
      'password': 'NatalyaPass',
    });
    setState(() {
      token = 'Token ' + response.data['auth_token'];
      log(token);
    });
  }

  Map contacts = {};

  void getContacts() async {
    var url = 'https://qviz.fun/api/v1/peoplelist/';
    var dio = Dio();
    var response = await dio.post(url,
        options: Options(headers: {
          'Authorization': "Token ec0d55b15a9a8cabb7951e88ee5333627043d1d4"
        }));
    log(response.data.toString());
    setState(() {
      contacts = response.data;
    });
  }

  // var postcards;
  //
  // void getPostcards() async {
  //   var url = 'https://qviz.fun/api/v1/get/postcard/data/';
  //   var dio = Dio();
  //   var response = await dio.get(url);
  //   print(response);
  //   //log(response.data.toString());
  //   setState(() {
  //     postcards = response.data;
  //   });
  // }

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

  static const List<Color> groupColor = [
    Color.fromRGBO(45, 166, 193, 1),
    Color.fromRGBO(103, 143, 218, 1),
    Color.fromRGBO(123, 108, 232, 1),
    Color.fromRGBO(182, 104, 236, 1),
    Color.fromRGBO(123, 108, 232, 1),
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

  String data = "Дата не выбрана";

  Map buffContacts = {};
  Map visibleContacts = {};

  int countContacts = 0;

  bool isOk = false;
  List<String> strGroup = ['С', 'Д', 'Б', 'К', 'П'];
  List<bool> buttonNavIsPressed = [false, false, false, false, false];
  List<bool> buttonGroupIsPressed = [false, false, false, false, false];
  List<bool> buttonCelebrateIsPressed = [false, false];

  @override
  void initState() {
    super.initState();

    getToken();
    getContacts();

    //print(token);
    //print(contacts);

    //getPostcards();
    //print(postcards);
  }

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
                  image: NetworkImage(
                    "https://qviz.fun/media/avatars/default_avatar.png",
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
                    color: Provider.of<SwapTheme>(context).getTheme
                        ? const Color.fromRGBO(22, 26, 29, 1)
                        : Colors.white,
                    fontSize: 16,
                    height: 0,
                  ),
                ),
                Text(
                  'г. Тула, Россия',
                  style: TextLocalStyles.roboto400.copyWith(
                    color: Provider.of<SwapTheme>(context).getTheme
                        ? const Color.fromRGBO(98, 118, 132, 1)
                        : const Color.fromRGBO(188, 192, 200, 1),
                    fontSize: 14,
                    height: 0,
                  ),
                )
              ],
            ),
          ),
          const Expanded(child: SizedBox()),
          // Временно убран !!!
          // SizedBox(
          //   child: DecoratedBox(
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(6),
          //       gradient: const LinearGradient(
          //         colors: [
          //           Color.fromRGBO(98, 198, 170, 0.06),
          //           Color.fromRGBO(68, 168, 140, 0.06),
          //         ],
          //       ),
          //     ),
          //     child: Padding(
          //       padding: EdgeInsets.symmetric(
          //         vertical: getHeight(context, 8),
          //         horizontal: getWidth(context, 8),
          //       ),
          //       child: Column(
          //         children: [
          //           Text(
          //             'Создать\nсобытие',
          //             style: TextLocalStyles.roboto400.copyWith(
          //               color: const Color.fromRGBO(62, 174, 143, 1),
          //               fontSize: 10,
          //             ),
          //           ),
          //           Padding(
          //             padding: EdgeInsets.only(
          //               top: getHeight(context, 3),
          //             ),
          //           ),
          //           SvgPicture.asset('assets/svg/add_event.svg'),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget birthDay() {
    return SizedBox(
      child: ColoredBox(
        color: Provider.of<SwapTheme>(context).getTheme
            ? const Color.fromRGBO(255, 255, 255, 0.75)
            : const Color.fromRGBO(0, 0, 0, 0.5),
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
                      color: Provider.of<SwapTheme>(context).getTheme
                          ? const Color.fromRGBO(65, 78, 88, 1)
                          : Colors.white,
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
                            color: Provider.of<SwapTheme>(context).getTheme
                                ? const Color.fromRGBO(250, 255, 255, 1)
                                : const Color.fromRGBO(52, 54, 62, 1),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Provider.of<SwapTheme>(context).getTheme
                                  ? const Color.fromRGBO(230, 241, 254, 1)
                                  : const Color.fromRGBO(66, 68, 77, 1),
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
                                  data,
                                  style: TextLocalStyles.roboto400.copyWith(
                                    color: Provider.of<SwapTheme>(context)
                                            .getTheme
                                        ? const Color.fromRGBO(157, 167, 176, 1)
                                        : const Color.fromRGBO(
                                            244, 199, 217, 1),
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
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Provider.of<SwapTheme>(context)
                                              .getTheme
                                          ? const Color.fromRGBO(
                                              237, 244, 251, 1)
                                          : const Color.fromRGBO(
                                              87, 99, 107, 1),
                                    ),
                                    child: InkWell(
                                      onTap: () async {
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const Screen28(),
                                          ),
                                        );
                                        setState(
                                          () {
                                            data =
                                                BlocProvider.of<DateTimeBloc>(
                                                            context)
                                                        .state
                                                        .getDateNumber ??
                                                    "?";
                                            if (dataIsOk()) {
                                              isOk = true;
                                            } else {
                                              isOk = false;
                                            }
                                          },
                                        );
                                      },
                                      child: const Icon(
                                        Icons.more_vert,
                                        size: 16,
                                        color: Color.fromRGBO(166, 173, 181, 1),
                                      ),
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
                            color: Provider.of<SwapTheme>(context).getTheme
                                ? const Color.fromRGBO(237, 244, 251, 1)
                                : const Color.fromRGBO(87, 99, 107, 1),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Provider.of<SwapTheme>(context).getTheme
                                  ? const Color.fromRGBO(230, 241, 254, 1)
                                  : const Color.fromRGBO(66, 68, 77, 1),
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
                                Padding(
                                  padding: const EdgeInsets.only(left: 2),
                                  child: groupCelebration(),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: getWidth(context, 5),
                                  ),
                                ),
                                SizedBox(
                                  height: getHeight(context, 20),
                                  width: getHeight(context, 20),
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Provider.of<SwapTheme>(context)
                                              .getTheme
                                          ? const Color.fromRGBO(
                                              237, 244, 251, 1)
                                          : const Color.fromRGBO(
                                              87, 99, 107, 1),
                                    ),
                                    child: const Icon(
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
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Provider.of<SwapTheme>(context).getTheme
                                ? const Color.fromRGBO(221, 232, 245, 1)
                                : const Color.fromRGBO(87, 99, 107, 1),
                          ),
                          child: Icon(
                            isOk
                                ? Icons.check_rounded
                                : Icons.question_mark_rounded,
                            color: const Color.fromRGBO(157, 167, 176, 1),
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

                    if (dataIsOk()) {
                      isOk = true;
                    } else {
                      isOk = false;
                    }

                    int length = 0;

                    for (int k = 0;
                        k < int.parse(contacts['people'].length.toString());
                        k++) {
                      if (buttonGroupIsPressed[i] == true) {
                        if (contacts['people'][k]['cat'] == (i + 1)) {
                          buffContacts[contacts['people'][k]['id']] =
                              contacts['people'][k];
                        }
                      } else {
                        if (buffContacts
                                .containsKey(contacts['people'][k]['id']) &&
                            contacts['people'][k]['cat'] == (i + 1)) {
                          buffContacts.remove(contacts['people'][k]['id']);
                        }
                      }
                    }

                    visibleContacts.clear();

                    buffContacts.forEach((key, value) {
                      visibleContacts[length] = buffContacts[key];
                      visibleContacts[length]['add'] = true;
                      length++;
                    });

                    // log(buffContacts.toString());
                    // log(buffContacts.length.toString());
                    log(visibleContacts.length.toString());
                    // log(visibleContacts.toString());

                    setState(() {});
                  },
                ),
            ],
          ),
        ],
      ),
    );
  }

  bool dataIsOk() {
    return data != "?" &&
        ((buttonGroupIsPressed[0] != false ||
                buttonGroupIsPressed[1] != false ||
                buttonGroupIsPressed[2] != false ||
                buttonGroupIsPressed[3] != false ||
                buttonGroupIsPressed[4] != false) ||
            (buttonCelebrateIsPressed[0] != false ||
                buttonCelebrateIsPressed[1] != false));
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
              PickCelebrateButton(isPressed: buttonCelebrateIsPressed[0],
                onTap: (){
                  setState(() {});
                  buttonCelebrateIsPressed[0] = !buttonCelebrateIsPressed[0];
                  buttonCelebrateIsPressed[1] = false;
                  if (dataIsOk()) {
                    isOk = true;
                  } else {
                    isOk = false;
                  }
                },
              ),
              PickCelebrateButton(isPressed: buttonCelebrateIsPressed[1],
                onTap: (){
                  setState(() {});
                  buttonCelebrateIsPressed[1] = !buttonCelebrateIsPressed[1];
                  buttonCelebrateIsPressed[0] = false;
                  if (dataIsOk()) {
                    isOk = true;
                  } else {
                    isOk = false;
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget listOfChannels() {
    return Expanded(
      child: RawScrollbar(
        thumbVisibility: true,
        radius: Radius.circular(getWidth(context, 2)),
        thickness: getWidth(context, 4),
        trackVisibility: true,
        trackColor: Color.fromRGBO(73, 88, 99, 1),
        thumbColor: Color.fromRGBO(129, 140, 147, 1),
        trackRadius: Radius.circular(getWidth(context, 2)),
        child: ListView.separated(
          padding: EdgeInsets.symmetric(
            horizontal: getWidth(context, 16),
          ),
          itemBuilder: (context, index) {
            return channel(index);
          },
          separatorBuilder: (_, __) => Padding(
            padding: EdgeInsets.only(
              top: getHeight(context, 10),
            ),
          ),
          itemCount: visibleContacts.length,
        ),
      ),
    );
  }

  Widget channel(int index) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              height: getHeight(context, 54),
              width: getHeight(context, 54),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(visibleContacts[index]['person_photo']),
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
                  visibleContacts[index]['name'],
                  style: TextLocalStyles.roboto500.copyWith(
                    color: Provider.of<SwapTheme>(context).getTheme
                        ? const Color.fromRGBO(65, 78, 88, 1)
                        : Colors.white,
                    fontSize: 16,
                    height: 0,
                  ),
                ),
                Text(
                  visibleContacts[index]['region'],
                  style: TextLocalStyles.roboto400.copyWith(
                    color: Provider.of<SwapTheme>(context).getTheme
                        ? const Color.fromRGBO(98, 118, 132, 1)
                        : const Color.fromRGBO(188, 192, 200, 1),
                    fontSize: 14,
                    height: 0,
                  ),
                )
              ],
            ),
            const Expanded(child: SizedBox()),
            buttonCheckContact(index),
            // if (isFirst) ...[
            //   SizedBox(
            //     height: getHeight(context, 34),
            //     width: getWidth(context, 34),
            //     child: DecoratedBox(
            //       decoration: BoxDecoration(
            //           gradient: Provider.of<SwapTheme>(context).getTheme
            //               ? null
            //               : AppTheme.mainGreenGradient,
            //           color: Provider.of<SwapTheme>(context).getTheme
            //               ? const Color.fromRGBO(221, 232, 245, 1)
            //               : null,
            //           shape: BoxShape.circle),
            //       child: Icon(
            //         Icons.check,
            //         color: Provider.of<SwapTheme>(context).getTheme
            //             ? const Color.fromRGBO(166, 173, 181, 1)
            //             : Colors.white,
            //       ),
            //     ),
            //   ),
            // ],
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
                color: Provider.of<SwapTheme>(context).getTheme
                    ? const Color.fromRGBO(218, 229, 242, 1)
                    : const Color.fromRGBO(66, 68, 77, 1),
                width: 1,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget buttonCheckContact(index) {
    return InkWell(
      onTap: () {
        visibleContacts[index]['add'] = !visibleContacts[index]['add'];
        setState(() {});
      },
      child: SizedBox(
        height: getHeight(context, 34),
        width: getWidth(context, 34),
        child: visibleContacts[index]['add']
            ? DecoratedBox(
                decoration: BoxDecoration(
                    gradient: Provider.of<SwapTheme>(context).getTheme
                        ? null
                        : AppTheme.mainGreenGradient,
                    color: Provider.of<SwapTheme>(context).getTheme
                        ? const Color.fromRGBO(221, 232, 245, 1)
                        : null,
                    shape: BoxShape.circle),
                child: Icon(
                  Icons.check,
                  color: Provider.of<SwapTheme>(context).getTheme
                      ? const Color.fromRGBO(166, 173, 181, 1)
                      : Colors.white,
                ),
              )
            : DecoratedBox(
                decoration: BoxDecoration(
                  color: Provider.of<SwapTheme>(context).getTheme
                      ? const Color.fromRGBO(221, 232, 245, 1)
                      : const Color.fromRGBO(69, 78, 84, 1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  //isFirst ? Icons.close : Icons.add,
                  visibleContacts[index]['add'] ? Icons.check : Icons.close,
                  color: Provider.of<SwapTheme>(context).getTheme
                      ? const Color.fromRGBO(166, 173, 181, 1)
                      : const Color.fromRGBO(157, 167, 176, 1),
                ),
              ),
      ),
    );
  }

  Widget bottomNavBar() {
    return SizedBox(
      height: getHeight(context, 83),
      width: getWidth(context, 375),
      child: ColoredBox(
        color: Provider.of<SwapTheme>(context).getTheme
            ? const Color.fromRGBO(235, 242, 249, 1)
            : const Color.fromRGBO(0, 0, 0, 0.25),
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

  Widget groupCelebration() {
    return (buttonCelebrateIsPressed[0] == false &&
            buttonCelebrateIsPressed[1] == false)
        ? SizedBox(
            child: Row(
              children: [
                for (int i = 0; i < 5; i++)
                  buttonGroupIsPressed[i]
                      ? Stack(
                          children: [
                            Container(
                              width: 15,
                              height: 18,
                              decoration: BoxDecoration(
                                color: groupColor[i],
                                borderRadius: BorderRadius.circular(3),
                                // border: Border.all(
                                //   color: Color.fromRGBO(250, 255, 255, 1),
                                //   width: 2
                                // ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: getWidth(context, 2),
                              ),
                              child: Text(
                                strGroup[i],
                                style: TextLocalStyles.roboto400.copyWith(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        )
                      : const SizedBox(),
              ],
            ),
          )
        : SizedBox(
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
                  buttonCelebrateIsPressed[0] ? 'Торжество' : 'Группа',
                  style: TextLocalStyles.roboto400.copyWith(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          );
  }
}
