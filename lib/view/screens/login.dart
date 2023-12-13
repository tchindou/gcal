import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gcal/utils/colors.dart';
import 'package:gcal/view/widgets/input/input-export.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController textController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InpOther(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Divider(
                    height:
                        30, // Ajustez la hauteur de la ligne selon vos besoins
                    thickness:
                        2, // Ajustez l'épaisseur de la ligne selon vos besoins
                    color: Colors.grey,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      ' or ',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Divider(
                    height:
                        30, // Ajustez la hauteur de la ligne selon vos besoins
                    thickness:
                        2, // Ajustez l'épaisseur de la ligne selon vos besoins
                    color: Colors.grey,
                  ),
                ],
              ),
              Gap(10),
              InpField(type: "text", textController: textController),
              InpField(type: "pwd", passwordController: passwordController),
              Gap(25),
              InkWell(
                onTap: () {},
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: green),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
