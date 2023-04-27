import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons_null_safety/flutter_icons_null_safety.dart';
import 'package:visita/data/me_post_json.dart';
import 'package:visita/theme/colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isPhoto = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,

      //appbar
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: Colors.transparent,

          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Profile"),
          ],
        ),
      ),

      // appBar: PreferredSize(
      //     child: getAppBar(), preferredSize: Size.fromHeight(180)),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return Container(
        padding: EdgeInsets.all(20),
        color: Theme.of(context).primaryColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 75,
                height: 75,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    border: Border.all(color: black)),
                child: Center(
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"),
                            fit: BoxFit.cover)),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Anish Pillai",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "@anishpillai",
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
        ));
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          getAppBar(),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    "Posts",
                    style: TextStyle(fontSize: 15, color: black),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "4",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "Followers",
                    style: TextStyle(fontSize: 15, color: black),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "0",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "Follow",
                    style: TextStyle(fontSize: 15, color: black),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "0",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 30,
          ),

          //Connect With Metamask Button
          Padding(
            padding: const EdgeInsets.only(right: 40.0, left: 40.0, bottom: 20),
            child: ElevatedButton.icon(
              label: const Text(
                'Connect Metamask',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              icon: Image.asset(
                'assets/images/metamask.png',
                height: 24,
                width: 24,
              ),
              style: ElevatedButton.styleFrom(
                fixedSize:
                    Size.fromWidth(MediaQuery.of(context).size.width / 1.5),
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Color.fromARGB(255, 129, 185, 231),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  side: const BorderSide(
                    color: Colors.blue,
                  ),
                ),
              ),
              onPressed: () {},
            ),
          ),

          //User Post
          SizedBox(
            height: 40,
            child: Text(
              "Your Post",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Wrap(
            spacing: 15,
            runSpacing: 15,
            children: List.generate(mePostList.length, (index) {
              return Container(
                width: (size.width - 60) / 2,
                height: (size.width - 60) / 2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: NetworkImage(mePostList[index]),
                        fit: BoxFit.cover)),
              );
            }),
          )
        ],
      ),
    );
  }
}
