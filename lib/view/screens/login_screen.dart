import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gcal/utils/colors.dart';
import 'package:gcal/view/widgets/input/input_export.dart';

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
    return Scaffold(
      // Wrap the entire widget tree with Material
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                10, MediaQuery.of(context).size.height * 0.25, 10, 10),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const InpOther(),
                  const Gap(20),
                  const Text('- or -', style: TextStyle(fontSize: 20)),
                  const Gap(50),
                  Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child:
                        InpField(type: "nom", textController: textController),
                  ),
                  const Gap(20),
                  Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: InpField(
                        type: "mdp", passwordController: passwordController),
                  ),
                  const Gap(30),
                  InkWell(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        // Form is valid, proceed with your logic
                        // e.g., calling the sign-up function
                      }
                      Navigator.pushNamedAndRemoveUntil(
                          context, "/app", (route) => false);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: green),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          'Login',
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
        ),
      ),
    );
  }
}
