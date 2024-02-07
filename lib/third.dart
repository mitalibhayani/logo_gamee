import 'dart:math';
import 'package:flutter/material.dart';
import 'package:logo_gamee/first.dart';
import 'package:logo_gamee/second.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';

class Home extends StatefulWidget {
  int levelNo;
  List list;

  Home(this.list, this.levelNo);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List ans = [
    "ONE",
    "TWO",
    "THREE",
    "FOUR",
    "FIVE",
    "SIX",
    "SEVEN",
    "EIGHT",
    "NINE",
    "TEN",
    "ONE",
    "TWO",
    "THREE",
    "FOUR",
    "FIVE",
    "SIX",
    "SEVEN",
    "EIGHT",
    "NINE",
    "TEN",
  ];
  List temp = [];
  List temp1 = [];
  List random_op = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z',
  ];
  int levelNo = 0;
  List user_ans = [];
  List option = [];
  PageController? controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    levelNo = widget.levelNo;
    get();
  }
  get() {
    controller = PageController(initialPage: levelNo);
    user_ans = List.filled(ans[levelNo].toString().length, "");
    random_op.shuffle();
    option = List.filled(14, "");
    temp = List.filled(user_ans.length, "");
    temp1 = List.filled(user_ans.length, "");
    for (int i = 0; i < user_ans.length; i++) {
      option[i] = ans[levelNo][i];
    }
    for (int i = user_ans.length; i < 14; i++) {
      option[i] = random_op[i];
    }
    option.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("logo ${levelNo + 1}/${widget.list.length}"),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Colors.black, Colors.blue]),
            ),
          ),
          actions: [Image(image: AssetImage("myassets/n_bulb_hints.png"))],
          // actions: [
          //   Image(image: AssetImage("myassets/n_bulb_mark.png")),
          //   // Container(
          //   //   width: 40,
          //   //   height: 50,
          //   //   margin: EdgeInsets.fromLTRB(10, 10, 3, 10),
          //   //   // color: Colors.brown,
          //   //   decoration: BoxDecoration(
          //   //     // color: Colors.cyanAccent,
          //   //       image: DecorationImage(
          //   //           image: AssetImage("myassets/n_bulb_hints.png"))),
          //   // ),
          //   Container(
          //     width: 40,
          //     height: 20,
          //     alignment: Alignment.center,
          //     margin: EdgeInsets.fromLTRB(0, 15, 2, 15),
          //     // color: Colors.brown,
          //     child: Text("Hints"),
          //   ),
          // ],
        ),
        body: SafeArea(
          minimum: EdgeInsets.all(20),
          child: PageView.builder(
            onPageChanged: (value) {
              levelNo = value;
              get();
              setState(() {});
            },
            controller: controller,
            itemCount: ans.length,
            itemBuilder: (context, index) {
              String test = first.prefs!.getString("level$index") ?? "";
              return (test == "yes")
                  ? Column(
                      children: [
                        Expanded(
                            flex: 3,
                            child: Row(
                              children: [
                                InkWell(
                                    onTap: () {
                                      if (levelNo > 0) {
                                        levelNo--;
                                      }
                                      controller!.jumpToPage(levelNo);
                                      setState(() {});
                                    },
                                    child: Icon(
                                        color: Colors.grey,
                                        Icons.arrow_back_ios_sharp,
                                        size: 40)),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(70, 20, 70, 20),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "${widget.list[levelNo]}"),
                                            fit: BoxFit.fill)),
                                    width: double.infinity,
                                    alignment: Alignment.center,
                                  ),
                                ),
                                InkWell(
                                    onTap: () {
                                      if (levelNo < widget.list.length - 1) {
                                        levelNo++;
                                      }
                                      controller!.jumpToPage(levelNo);
                                      setState(() {});
                                    },
                                    child: Icon(
                                      Icons.arrow_forward_ios_sharp,
                                      size: 40,
                                      color: Colors.grey,
                                    )),
                              ],
                            )),
                        Expanded(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${ans[levelNo]}",
                              style: TextStyle(fontSize: 40),
                            )
                          ],
                        ))
                      ],
                    )
                  : Column(
                      children: [
                        Expanded(
                            flex: 3,
                            child: Row(
                              children: [
                                InkWell(
                                    onTap: () {
                                      if (levelNo > 0) {
                                        levelNo--;
                                      }
                                      controller!.jumpToPage(levelNo);
                                      setState(() {});
                                    },
                                    child: Icon(
                                        color: Colors.grey,
                                        Icons.arrow_back_ios_sharp,
                                        size: 40)),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(70, 20, 70, 20),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "${widget.list[levelNo]}"),
                                            fit: BoxFit.fill)),
                                    width: double.infinity,
                                    alignment: Alignment.center,
                                  ),
                                ),
                                InkWell(
                                    onTap: () {
                                      if (levelNo < widget.list.length - 1) {
                                        levelNo++;
                                      }
                                      controller!.jumpToPage(levelNo);
                                      setState(() {});
                                    },
                                    child: Icon(
                                      Icons.arrow_forward_ios_sharp,
                                      size: 40,
                                      color: Colors.grey,
                                    )),
                              ],
                            )),
                        Expanded(
                            child: Container(
                          alignment: Alignment.center,
                          width: double.infinity,
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            children: List.generate(
                                user_ans.length,
                                (index) => InkWell(
                                      onTap: () {
                                        if (temp1[index] == false) {
                                          option[temp[index]] = user_ans[index];
                                          user_ans[index] = "";
                                        }
                                        setState(() {});
                                      },
                                      child: Container(
                                        width: 50,
                                        alignment: Alignment.center,
                                        height: 50,
                                        color: (temp1[index] == true)
                                            ? Colors.black12
                                            : Colors.black45,
                                        margin: EdgeInsets.all(3),
                                        child: Text(
                                          "${user_ans[index]}",
                                          style: TextStyle(
                                              fontSize: 25,
                                              color: Colors.white),
                                        ),
                                      ),
                                    )),
                          ),
                        )),
                        Expanded(
                            child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(child: Text("")),
                              Expanded(
                                  flex: 3,
                                  child: InkWell(
                                    onTap: () {
                                      showAnimatedDialog(
                                        animationType:
                                            DialogTransitionType.slideFromLeft,
                                        duration: Duration(milliseconds: 500),
                                        barrierDismissible: true,
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            alignment: Alignment.center,
                                            backgroundColor: Colors.black54,
                                            actions: [
                                              Row(
                                                children: [
                                                  Expanded(
                                                    flex: 3,
                                                    child: InkWell(
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                        int r = Random()
                                                            .nextInt(user_ans
                                                                .length);
                                                        print(r);
                                                        // ans=FOUR
                                                        List abc = [];
                                                        abc = List.filled(
                                                            user_ans.length,
                                                            "");
                                                        for (int i = 0;
                                                            i <
                                                                ans[levelNo]
                                                                    .length;
                                                            i++) {
                                                          abc[i] =
                                                              ans[levelNo][i];
                                                        }
                                                        user_ans[r] = abc[r];
                                                        for (int i = 0;
                                                            i < option.length;
                                                            i++) {
                                                          if (abc[r] ==
                                                              option[i]) {
                                                            // temp[r]=i;
                                                            temp1[r] = true;
                                                            option[i] = "";
                                                            break;
                                                          }
                                                        }

                                                        setState(() {});
                                                      },
                                                      child: Container(
                                                        height: 50,
                                                        width: 100,
                                                        decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                                image: AssetImage(
                                                                    "myassets/n_pop_hints_green_clicked_b.png"),
                                                                fit: BoxFit
                                                                    .fill)),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          children: [
                                                            Expanded(
                                                              flex: 1,
                                                              child: Container(
                                                                height: 40,
                                                                width: 40,
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        left:
                                                                            10),
                                                                child: Image(
                                                                  image: AssetImage(
                                                                      "myassets/hint_icon_random_letter.png"),
                                                                  fit: BoxFit
                                                                      .fill,
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                                flex: 3,
                                                                child: Text(
                                                                  "random letter",
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          20,
                                                                      color: Colors
                                                                          .white),
                                                                )),
                                                            Expanded(
                                                                flex: 1,
                                                                child:
                                                                    Container(
                                                                  height: 40,
                                                                  child: Row(
                                                                    children: [
                                                                      Text(
                                                                        "1",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                20,
                                                                            color:
                                                                                Colors.white),
                                                                      ),
                                                                      Image(
                                                                          image:
                                                                              AssetImage("myassets/n_bulb_hints.png")),
                                                                    ],
                                                                  ),
                                                                ))
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    flex: 3,
                                                    child: InkWell(onTap: () {
                                                      Navigator.pop(context);
                                                    },
                                                      child: Container(
                                                        height: 50,
                                                        width: 100,
                                                        decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                                image: AssetImage(
                                                                    "myassets/n_pop_hints_green_clicked_b.png"),
                                                                fit:
                                                                    BoxFit.fill)),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          children: [
                                                            Expanded(
                                                              flex: 1,
                                                              child: Container(
                                                                height: 40,
                                                                width: 40,
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        left: 10),
                                                                child: Image(
                                                                  image: AssetImage(
                                                                      "myassets/hint_icon_category.png"),
                                                                  fit:
                                                                      BoxFit.fill,
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                                flex: 3,
                                                                child: Text(
                                                                  "Category",
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          20,
                                                                      color: Colors
                                                                          .white),
                                                                )),
                                                            Expanded(
                                                                flex: 1,
                                                                child: Container(
                                                                  height: 40,
                                                                  child: Row(
                                                                    children: [
                                                                      Text(
                                                                        "1",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                20,
                                                                            color:
                                                                                Colors.white),
                                                                      ),
                                                                      Image(
                                                                          image: AssetImage(
                                                                              "myassets/n_bulb_hints.png")),
                                                                    ],
                                                                  ),
                                                                ))
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    flex: 3,
                                                    child: InkWell(onTap: () {
                                                      Navigator.pop(context);
                                                    },
                                                      child: Container(
                                                        height: 50,
                                                        width: 100,
                                                        decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                                image: AssetImage(
                                                                    "myassets/n_pop_hints_blue.png"),
                                                                fit:
                                                                    BoxFit.fill)),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          children: [
                                                            Expanded(
                                                              flex: 1,
                                                              child: Container(
                                                                height: 40,
                                                                width: 40,
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        left: 10),
                                                                child: Image(
                                                                  image: AssetImage(
                                                                      "myassets/hint_icon_selected_letter.png"),
                                                                  fit:
                                                                      BoxFit.fill,
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                                flex: 3,
                                                                child: Text(
                                                                  "Selected letter",
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          20,
                                                                      color: Colors
                                                                          .white),
                                                                )),
                                                            Expanded(
                                                                flex: 1,
                                                                child: Container(
                                                                  height: 40,
                                                                  child: Row(
                                                                    children: [
                                                                      Text(
                                                                        "2",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                20,
                                                                            color:
                                                                                Colors.white),
                                                                      ),
                                                                      Image(
                                                                          image: AssetImage(
                                                                              "myassets/n_bulb_hints.png")),
                                                                    ],
                                                                  ),
                                                                ))
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    flex: 3,
                                                    child: InkWell(onTap: () {
                                                      Navigator.pop(context);
                                                    },
                                                      child: Container(
                                                        height: 50,
                                                        width: 100,
                                                        decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                                image: AssetImage(
                                                                    "myassets/n_pop_hints_blue.png"),
                                                                fit:
                                                                    BoxFit.fill)),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          children: [
                                                            Expanded(
                                                              flex: 1,
                                                              child: Container(
                                                                height: 40,
                                                                width: 40,
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        left: 10),
                                                                child: Image(
                                                                  image: AssetImage(
                                                                      "myassets/hint_icon_remove_letters.png"),
                                                                  fit:
                                                                      BoxFit.fill,
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                                flex: 3,
                                                                child: Text(
                                                                  "remove extra \n letters",
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          20,
                                                                      color: Colors
                                                                          .white),
                                                                )),
                                                            Expanded(
                                                                flex: 1,
                                                                child: Container(
                                                                  height: 40,
                                                                  child: Row(
                                                                    children: [
                                                                      Text(
                                                                        "3",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                20,
                                                                            color:
                                                                                Colors.white),
                                                                      ),
                                                                      Image(
                                                                          image: AssetImage(
                                                                              "myassets/n_bulb_hints.png")),
                                                                    ],
                                                                  ),
                                                                ))
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    flex: 3,
                                                    child: InkWell(onTap: () {
                                                      Navigator.pop(context);
                                                    },
                                                      child: Container(
                                                        height: 50,
                                                        width: 100,
                                                        decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                                image: AssetImage(
                                                                    "myassets/n_pop_hints_red.png"),
                                                                fit:
                                                                    BoxFit.fill)),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          children: [
                                                            Expanded(
                                                              flex: 1,
                                                              child: Container(
                                                                height: 40,
                                                                width: 40,
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        left: 10),
                                                                child: Image(
                                                                  image: AssetImage(
                                                                      "myassets/hint_icon_solve.png"),
                                                                  fit:
                                                                      BoxFit.fill,
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                                flex: 3,
                                                                child: Text(
                                                                  "solve",
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          20,
                                                                      color: Colors
                                                                          .white),
                                                                )),
                                                            Expanded(
                                                                flex: 1,
                                                                child: Container(
                                                                  height: 40,
                                                                  child: Row(
                                                                    children: [
                                                                      Text(
                                                                        "9",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                20,
                                                                            color:
                                                                                Colors.white),
                                                                      ),
                                                                      Image(
                                                                          image: AssetImage(
                                                                              "myassets/n_bulb_hints.png")),
                                                                    ],
                                                                  ),
                                                                ))
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                            title: Text(
                                              "You have 1 hint",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 30),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 50,
                                      alignment: Alignment.center,
                                      // margin: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.green,
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "myassets/n_bulb_hints.png"),
                                            alignment: Alignment.topLeft),
                                      ),
                                      child: Text(
                                        "Use hints",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    ),
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: InkWell(
                                    onTap: () {
                                      for (int i = 0; i < user_ans.length; i++) {
                                        if(user_ans[i]!="")
                                          {
                                            option[temp[i]] = user_ans[i];
                                            user_ans[i] = "";
                                          }
                                      }
                                      setState(() {});
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 50,
                                      // margin: EdgeInsets.all(10),
                                      // margin: EdgeInsets.fromLTRB(50, 10, 50, 0),
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                        image: AssetImage(
                                            "myassets/n_delete_all_red.png"),
                                      )),
                                    ),
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: InkWell(
                                    onTap: () {
                                      for (int i = temp.length - 1;
                                          i >= 0;
                                          i--) {
                                        if (temp[i] != '') {
                                          option[temp[i]] = user_ans[i];
                                          temp[i] = "";
                                          user_ans[i] = "";
                                          break;
                                        }
                                      }
                                      setState(() {});
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 50,
                                      // margin: EdgeInsets.all(10),
                                      // margin: EdgeInsets.fromLTRB(50, 10, 50, 0),
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                        image: AssetImage(
                                            "myassets/n_delete_one_red.png"),
                                      )),
                                    ),
                                  )),
                              Expanded(child: Text("")),
                              Expanded(child: Text("")),
                            ],
                          ),
                        )),
                        Expanded(
                            flex: 2,
                            child: Container(
                              width: double.infinity,
                              child: GridView.builder(
                                itemCount: 14,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 7,
                                        mainAxisSpacing: 3,
                                        crossAxisSpacing: 3),
                                itemBuilder: (context, index) {
                                  return (option[index] != '')
                                      ? InkWell(
                                          onTap: () {
                                            for (int i = 0;
                                                i < user_ans.length;
                                                i++) {
                                              if (user_ans[i] == "") {
                                                user_ans[i] = option[index];
                                                temp[i] = index;
                                                temp1[i] = false;
                                                option[index] = "";
                                                check_win();
                                                break;
                                              }
                                            }
                                            setState(() {});
                                          },
                                          child: Container(
                                            width: 50,
                                            alignment: Alignment.center,
                                            height: 50,
                                            color: Colors.black38,
                                            margin: EdgeInsets.all(3),
                                            child: Text(
                                              "${option[index]}",
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        )
                                      : Text("");
                                },
                              ),
                            )),
                        Expanded(
                            child: Container(
                          child: Text(""),
                          width: double.infinity,
                        )),
                      ],
                    );
            },
          ),
        ),
      ),
      onWillPop: () async {
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            return second();
          },
        ));
        return true;
      },
    );
  }

  check_win() {
    print("Ans:${ans[levelNo]}");
    String ans1 = user_ans.join("");
    if (ans[levelNo] == ans1) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("you are win level..."),
            actions: [
              TextButton(
                  onPressed: () {
                    first.prefs!.setString("level$levelNo", "yes");
                    levelNo++;
                    // controller!.jumpToPage(levelNo);
                    controller!.animateToPage(levelNo,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.linear);
                    Navigator.pop(context);
                  },
                  child: Text("Next"))
            ],
          );
        },
      );
    }
  }
}
