import 'package:flutter/material.dart';
import 'package:gcal/view/widgets/input/simpleTextField.dart';
import 'package:gcal/view/widgets/input/emailInpField.dart';
import 'package:gcal/view/widgets/input/passwordField.dart';
import 'package:gcal/view/widgets/input/telIndiceField.dart';
import 'package:gcal/view/widgets/input/telInpField.dart';

class InpField extends StatefulWidget {
  final String type;
  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  final TextEditingController? phoneController;
  final TextEditingController? textController;
  final String? selectedCountry;
  final ValueChanged<String>? onChanged;

  const InpField({
    required this.type,
    this.emailController,
    this.passwordController,
    this.phoneController,
    this.textController,
    this.selectedCountry,
    this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  _InpFieldState createState() => _InpFieldState();
}

class _InpFieldState extends State<InpField> {
  bool isObscure = true;

  @override
  void initState() {
    super.initState();
  }

/*  @override
  void dispose() {
    if (widget.textController != null) {
      widget.textController!.dispose();
    }
    if (widget.emailController != null) {
      widget.emailController!.dispose();
    }
    if (widget.passwordController != null) {
      widget.passwordController!.dispose();
    }
    if (widget.phoneController != null) {
      widget.phoneController!.dispose();
    }
    super.dispose();
  }
  */

  @override
  Widget build(BuildContext context) {
    Widget widgetRetour;

    switch (widget.type) {
      case 'nom':
        widgetRetour = widget.textController != null
            ? TextInp(nom: 'Nom', textController: widget.textController!)
            : Container();
        break;

      case 'mdp':
        widgetRetour = widget.passwordController != null
            ? PwdWidget(passwordController: widget.passwordController!)
            : Container();
        break;

      case 'email':
        widgetRetour = widget.emailController != null
            ? EmailInp(emailController: widget.emailController!)
            : Container();
        break;

      case 'tel':
        widgetRetour = widget.phoneController != null
            ? TelInp(phoneController: widget.phoneController!)
            : Container();
        break;

      case 'tel-ind':
        widgetRetour =
            widget.onChanged != null && widget.selectedCountry != null
                ? TelIndice(
                    onChanged: widget.onChanged!,
                    selectedCountry: widget.selectedCountry!,
                  )
                : Container();
        break;

      default:
        widgetRetour = Container();
    }

    return widgetRetour;
  }
}
