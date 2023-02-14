import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ListViewPage(),
    );
  }
}

class ListViewPage extends StatefulWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  var imageList = [
    "image/1.png",
    "image/2.png",
    "image/3.png",
    "image/4.png",
    "image/5.png",
    "image/6.png",
    "image/7.png",
    "image/8.png",
    "image/9.png",
    "image/10.png",
  ];

  var titleList = [
    "Dentist",
    "Pharmacist",
    "School teacher",
    "IT manager",
    "Account",
    "Lawyer",
    "Hairdresser",
    "Physician",
    "Web developer",
    "Medical Secretary",
  ];

  var subtitle = "There are different types of careeres "
      "you can pursue in your life. Which one will it be?";

  void showPopup(context, String image, String title, String subtitle,) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: SizedBox(
          width: 400,
          height: 400,
          child: Center(
            child: Column(
              children: [
                Image(
                  image: AssetImage(image),
                  width: 200,
                  height: 200,
                ),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 50,),
                Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var widthSize = MediaQuery.of(context).size.width;
    var heightSize = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile List"),
        backgroundColor: Colors.cyan,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: imageList.length,
        itemBuilder: (context, i) => InkWell(
          onTap: () {
            showPopup(
              context,
              imageList[i],
              titleList[i],
              "$i. $subtitle",
            );
          },
          child: Card(
            elevation: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image(
                  image: AssetImage(imageList[i]),
                  width: widthSize * 0.4,
                  height: heightSize * 0.2,
                ),
                SizedBox(
                  height: heightSize * 0.2,
                  width: widthSize * 0.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        titleList[i],
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "$i. $subtitle",
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
