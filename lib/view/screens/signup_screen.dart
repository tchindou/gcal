// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gcal/view/widgets/input/input_field.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  // Page controller and current page index
  final _controller = PageController();

  // State variables
  final List<String> _buttonPressed = ['unchecked', 'unchecked'];
  DateTime _selectedDate = DateTime.now();
  late String _selectedSexe;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController textController = TextEditingController();

  // Form key
  GlobalKey<FormState> form1Key = GlobalKey<FormState>();
  GlobalKey<FormState> form2Key = GlobalKey<FormState>();

  // Initialization of selectedSexe
  @override
  void initState() {
    super.initState();
    _selectedSexe = 'Masculin'; // or any other default value of your choice
  }

  // Function to handle date selection
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  // Build method
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Gap(50),
                _buildWelcomeText(),
                const Gap(50),
                _buildPageIndicator(),
                const Gap(20),
                _buildPageView(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Function to build the welcome text
  Widget _buildWelcomeText() {
    return const Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Column(
        children: [
          Text(
            'WELCOME',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Remplissez convenablement tous ces champs pour avoir accès à notre application',
            style: TextStyle(fontSize: 18, color: Colors.black54),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  // Function to build the page indicator
  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(
        2,
        (index) => Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              width: 3,
              color: _buttonPressed[index] == 'checked'
                  ? Colors.green
                  : const Color.fromRGBO(158, 158, 158, 1),
            ),
          ),
          child: Icon(
            Icons.check,
            color: _buttonPressed[index] == 'checked'
                ? Colors.green
                : const Color.fromRGBO(158, 158, 158, 1),
          ),
        ),
      ),
    );
  }

  // Function to build the page view
  Widget _buildPageView() {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _controller,
        onPageChanged: (page) {
          setState(() {});
        },
        children: [
          _buildPersonalInfoForm(),
          _buildPasswordForm(),
        ],
      ),
    );
  }

  // Function to build the personal info form
  Widget _buildPersonalInfoForm() {
    return SingleChildScrollView(
      child: Form(
        key: form1Key,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildInputField('nom'),
              const Gap(20),
              _buildDateAndSexeFields(),
              const Gap(20),
              _buildInputField('nom'),
              const Gap(30),
              Align(
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  onTap: () {
                    /*if (formKey.currentState!.validate()) {
                    // Form is valid, proceed with your logic
                    // e.g., calling the sign-up function
                  }*/
                    _controller.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                    setState(() {
                      _buttonPressed[0] = 'checked';
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green),
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
              ),
              const Gap(50),
            ],
          ),
        ),
      ),
    );
  }

  // Function to build the password form
  Widget _buildPasswordForm() {
    return SingleChildScrollView(
      child: Form(
        key: form2Key,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                height: 60,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: InpField(
                  type: 'mdp',
                  passwordController: passwordController,
                ),
              ),
              const Gap(20),
              Container(
                height: 60,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: InpField(
                  type: 'nom',
                  textController: confController,
                ),
              ),
              _buildSignupButton(),
              const Gap(50),
            ],
          ),
        ),
      ),
    );
  }

  // Function to build common input field
  Widget _buildInputField(String type) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InpField(type: type, textController: textController),
    );
  }

  // Function to build date and sexe fields
  Widget _buildDateAndSexeFields() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap: () => _selectDate(context),
          child: SizedBox(
            height: 60,
            width: MediaQuery.of(context).size.width * 0.424,
            child: InputDecorator(
              decoration: const InputDecoration(
                labelText: 'Date de naissance',
                border: OutlineInputBorder(),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${_selectedDate.toLocal()}".split(' ')[0],
                  ),
                  const Icon(Icons.calendar_today),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 60,
          width: MediaQuery.of(context).size.width * 0.424,
          child: DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              labelText: 'Sexe',
              border: OutlineInputBorder(),
            ),
            value: _selectedSexe,
            items: ['Masculin', 'Féminin'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _selectedSexe = newValue!;
              });
            },
          ),
        )
      ],
    );
  }

  // Function to build the signup button
  Widget _buildSignupButton() {
    return InkWell(
      onTap: () {
        /*if (formKey.currentState!.validate()) {
          // Form is valid, proceed with your logic
          // e.g., calling the sign-up function
        }
        _controller.previousPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );*/
        Navigator.pushNamed(context, "/home");
        setState(() {
          _buttonPressed[1] = 'checked';
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.green),
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
    );
  }
}
