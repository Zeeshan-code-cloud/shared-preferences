import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home_screen extends StatefulWidget {
  const Home_screen({Key? key}) : super(key: key);

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getValues();
  }
  final Textcontroller = TextEditingController();
  static String data = "no data are inserted yet";
 static String key = "name";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("shared preferences"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: Textcontroller,
            decoration: InputDecoration(
                label: const Text("enter name"),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(22.0)
                )
            ),
          ),
          ElevatedButton(onPressed: () async{
            SharedPreferences prefs = await SharedPreferences.getInstance();
            var  User_input = Textcontroller.text.trim();
            prefs.setString(key, User_input);

          }, child: const Text("click to save")),
          Text(data),
        ],
      ),
    );
  }

  void getValues() async{
    var prefs = await SharedPreferences.getInstance();
    var GetValues = prefs.getString(key);
    data = GetValues ?? "no data saved";
    setState(() {

    });
  }
}
