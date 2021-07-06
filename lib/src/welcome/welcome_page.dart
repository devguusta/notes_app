import 'package:flutter/material.dart';
import 'package:notes/src/home/home_page.dart';
import 'package:notes/src/login/login_screen.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height,
            decoration: BoxDecoration(
              color: Color.fromRGBO(244,237,237, 1),
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.symmetric(vertical : 15),
            child: SingleChildScrollView(
                        child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: size.height * 0.1),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 36.0),
                    child: Image.asset(
                      "assets/images/started.png",
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                      height: size.height * 0.45,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.1,
                  ),
                  Text(
                    "Gets things done with ToDo",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur",
                     style: TextStyle(fontWeight: FontWeight.w400, color: Color.fromRGBO(140,140,140, 1)),
                    textAlign: TextAlign.center,
                  ),
                   SizedBox(
                    height: 5,
                  ),
                  Text(
                    "adipiscing elit. Orci in gravida purus",
                    style: TextStyle(fontWeight: FontWeight.w400, color: Color.fromRGBO(140,140,140, 1)),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "neque aliquet morbi nan felis. Augue",
                    style: TextStyle(fontWeight: FontWeight.w400, color: Color.fromRGBO(140,140,140, 1)),
                    textAlign: TextAlign.center,
                  ),
                   SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Color.fromRGBO(44,194,236,1),
                      padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15,)
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    }, child:Text("Get Started"))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
