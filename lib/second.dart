import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logo_gamee/data.dart';
import 'package:logo_gamee/first.dart';
import 'package:logo_gamee/third.dart';




class second extends StatefulWidget {
  const second({super.key});

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {
  @override
  Widget build(BuildContext context) {
    double Status_bar = MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.white),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                colors: <Color>[Colors.black, Colors.blue]),
          ),
        ),
        title: Text("LEVEL 1"),
        centerTitle: true,
        actions: [Image(image: AssetImage("myassets/n_bulb_hints.png"))],
      ),
      body: SafeArea(
        minimum: EdgeInsets.only(top: 10),
        child: Container(margin: EdgeInsets.all(20),
          child: GridView.builder(
            itemCount: 26,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, crossAxisSpacing: 30, mainAxisSpacing: 30),
            itemBuilder: (context, index) {
              String test=first.prefs!.getString("level$index") ?? "";

              return InkWell(onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Home(data.img,index);
                },));
              },
                child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: (test=="yes")?AssetImage("${data.img[index]}"):AssetImage("${data.img[index]}"),
                          fit: BoxFit.fill),
                    )),
              );
            },
          ),
        ),
      ),
    );
  }
}


