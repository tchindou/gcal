// ignore_for_file: file_names

import 'package:flutter/material.dart';

class TelInp extends StatefulWidget {
  final TextEditingController phoneController;
  const TelInp({required this.phoneController, super.key});

  @override
  State<TelInp> createState() => _TelInpState();
}

class _TelInpState extends State<TelInp> {
  final FocusNode _codeFocusNode = FocusNode();
  String? _validationError;

  @override
  void dispose() {
    _codeFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.phoneController,
      decoration: InputDecoration(
        hintText: '1234567890',
        labelText: 'Phone number',
        errorText: null,
        border: const OutlineInputBorder(),
        prefixIcon: const Icon(Icons.phone),
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
                      margin: const EdgeInsets.all(3),
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
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value == null || value.isEmpty) {
          setState(() {
            _validationError = 'Veuillez entrer une valeur';
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
