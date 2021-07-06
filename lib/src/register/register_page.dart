import 'package:flutter/material.dart';
import 'package:notes/shared/models/user_model.dart';
import 'package:notes/shared/validators/text_validator.dart';
import 'package:notes/shared/widgets/customTextField.dart';
import 'package:notes/shared/widgets/visible_widget.dart';
import 'package:notes/src/login/login_screen.dart';
import 'package:notes/src/register/register_controller.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late RegisterController controller = RegisterController(onUpdate: () {
    setState(() {});
  });
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  bool passwordVisible = true;
  bool confirmPasswordVisible = true;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var confirmPassword;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
            child: Form(
              key: _formKey,
              
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Welcome Onboard",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                        color: Color.fromRGBO(66, 64, 64, 1)),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text(
                    "Let´s help you meet up your tasks",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(140, 140, 140, 1)),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: size.height * 0.08,
                  ),
                  InputForm(
                    hintText: "Enter your full name",
                    obscureText: false,
                    controller: _nameController,
                    validator: (value) => Validators().validateName(value!),
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  InputForm(
                    hintText: "Enter your email",
                    obscureText: false,
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    validator: (value) => Validators().validateEmail(value!),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  InputForm(
                    hintText: "Enter your password",
                    controller: _passwordController,
                    obscureText: passwordVisible,
                    validator: (String? value) {
                      confirmPassword = value;
                      if(value!.isEmpty){
                        return "Campo obrigatório";
                      } if(value.length < 8) {
                        return "Informe uma senha de no mínimo 8 dígitos";
                      }
                     } ,
                    keyboardType: TextInputType.visiblePassword,
                    suffixIcon: VisibleWidget(
                        visible: passwordVisible,
                        onPressed: () {
                          setState(() {
                            passwordVisible = !passwordVisible;
                          });
                        }),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  InputForm(
                    hintText: "Confirm password",
                    controller: _confirmPasswordController,
                    obscureText: confirmPasswordVisible,
                    validator: (String? value) {
                      if(value!.isEmpty) {
                        return "Campo obrigatório";
                      } if(value != confirmPassword) {
                        return "Senhas não conferem";
                      } return null;
                    },
                    suffixIcon: VisibleWidget(
                        visible: confirmPasswordVisible,
                        onPressed: () {
                          setState(() {
                            confirmPasswordVisible = !confirmPasswordVisible;
                          });
                        }),
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Color.fromRGBO(44, 194, 236, 1),
                          padding: EdgeInsets.symmetric(
                            horizontal: 120,
                            vertical: 15,
                          )),
                      onPressed: () {
                        if(_formKey.currentState!.validate()) {
                          final UserModel user = UserModel(
                            name: _nameController.text,
                            email: _emailController.text,
                            password: _passwordController.text,
                          );
                          controller.saveUser(user, context);
                          Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                        } 
                      },
                      child: Text("Register"),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?"),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return RegisterPage();
                          }));
                        },
                        child: Text(
                          " Sign in",
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
          ),
        ],
      ),
    );
  }
}
