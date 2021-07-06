import 'package:flutter/material.dart';
import 'package:notes/shared/validators/text_validator.dart';
import 'package:notes/shared/widgets/customTextField.dart';
import 'package:notes/shared/widgets/visible_widget.dart';
import 'package:notes/src/home/home_page.dart';
import 'package:notes/src/login/login_controller.dart';
import 'package:notes/src/register/register_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginController controller = LoginController(onUpdate: () {
    setState(() {});
  });

  bool passwordVisible = true;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: size.height,
            decoration: BoxDecoration(
              color: Color.fromRGBO(244, 237, 237, 1),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Welcome back!",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 36.0),
                  child: Image.asset(
                    "assets/images/signin.png",
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                    height: size.height * 0.4,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InputForm(
                        hintText: "Enter your email",
                        obscureText: false,
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        validator: (value) =>
                            Validators().validateEmail(value!),
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      InputForm(
                        hintText: "Enter your password",
                        obscureText: passwordVisible,
                        keyboardType: TextInputType.visiblePassword,
                        controller: _passwordController,
                        suffixIcon: VisibleWidget(
                            visible: passwordVisible,
                            onPressed: () {
                              setState(() {
                                passwordVisible = !passwordVisible;
                              });
                            }),
                      ),
                      SizedBox(
                        height: size.height * 0.04,
                      ),
                      Text("Forget Password",
                          style: TextStyle(
                              color: Color.fromRGBO(161, 212, 214, 1),
                              fontWeight: FontWeight.w400)),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: controller.isLoading
                            ? CircularProgressIndicator()
                            : ElevatedButton(
                                style: TextButton.styleFrom(
                                    backgroundColor:
                                        Color.fromRGBO(44, 194, 236, 1),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 120,
                                      vertical: 15,
                                    )),
                                onPressed: () {
                                  controller.getUser(
                                    context,
                                    _emailController.text,
                                    _passwordController.text);
                                },
                                child: Text("Login")),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don´t have an account?"),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return RegisterPage();
                              }));
                            },
                            child: Text(
                              " Sign up",
                              style: TextStyle(
                                  color: Color.fromRGBO(119, 190, 194, 1),
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
