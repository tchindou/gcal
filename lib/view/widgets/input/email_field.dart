import 'package:flutter/material.dart';

class EmailInp extends StatefulWidget {
  final TextEditingController emailController;
  const EmailInp({required this.emailController, super.key});

  @override
  State<EmailInp> createState() => _EmailInpState();
}

class _EmailInpState extends State<EmailInp> {
  final FocusNode _codeFocusNode = FocusNode();
  String? _validationError;

  @override
  void initState() {
    super.initState();
    _validationError = null;
  }

  @override
  void dispose() {
    _codeFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.emailController,
      obscureText: false,
      decoration: InputDecoration(
        labelText: 'Email',
        errorText: null,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        prefixIcon: const Icon(Icons.mail_outlined),
        suffixIcon: _validationError != null
            ? IconButton(
                icon: const Icon(
                  Icons.error_outline,
                  color: Colors.redAccent,
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        _validationError!,
                        style: const TextStyle(
                          color: Colors
                              .red, // Définissez la couleur du texte du SnackBar
                        ),
                      ),
                      duration: const Duration(seconds: 5),
                      behavior: SnackBarBehavior.floating,
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.all(3),
                      backgroundColor: const Color(0xFFF2F2F2),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(5),
                            bottom: Radius.circular(5),
                          ),
                          side: BorderSide(
                            color: Colors.red,
                            width: 1.0,
                          )),
                    ),
                  );
                },
              )
            : null,
      ),
      focusNode: _codeFocusNode,
      onFieldSubmitted: (_) {
        FocusScope.of(context).nextFocus();
      },
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value!.isEmpty) {
          /*setState(() {
            _validationError = 'Veuillez entrer une valeur';
          });*/
          _validationError = null;
        } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
            .hasMatch(value)) {
          setState(() {
            _validationError = 'Veuillez entrer une adresse e-mail valide';
          });
        } else {
          setState(() {
            _validationError = null;
          });
        }
        return null;
      },
    );
  }
}
