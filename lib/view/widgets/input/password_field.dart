import 'package:flutter/material.dart';

class PwdWidget extends StatefulWidget {
  final TextEditingController passwordController;

  const PwdWidget({required this.passwordController, super.key});

  @override
  State<PwdWidget> createState() => _PwdWidgetState();
}

class _PwdWidgetState extends State<PwdWidget> {
  final FocusNode _codeFocusNode = FocusNode();
  String? _validationError;
  bool isObscure = true;

  @override
  void dispose() {
    _codeFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.passwordController,
      obscureText: isObscure,
      validator: (value) {
        if (value == null || value.isEmpty) {
          setState(() {
            _validationError = 'Le mot de passe est requis';
          });
        } else if (value.length < 6) {
          setState(() {
            _validationError =
                'Le mot de passe doit comporter au moins 6 caractères';
          });
        } else {
          setState(() {
            _validationError = null;
          });
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Mot de passe',
        errorText: null,
        prefixIcon: const Icon(Icons.key_outlined),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
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
                      margin: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                      backgroundColor: const Color(0xFFF2F2F2),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(5),
                          bottom: Radius.circular(5),
                        ),
                        side: BorderSide(
                          color: Colors.red,
                          width: 1.0,
                        ),
                      ),
                    ),
                  );
                },
              )
            : IconButton(
                icon: Icon(
                  isObscure ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
              ),
      ),
      focusNode: _codeFocusNode,
      onFieldSubmitted: (_) {
        FocusScope.of(context).nextFocus();
      },
      textInputAction: TextInputAction.next,
    );
  }
}
