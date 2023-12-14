import 'package:flutter/material.dart';

class TextInp extends StatefulWidget {
  final String nom;
  final TextEditingController textController;
  const TextInp({required this.nom, required this.textController, super.key});

  @override
  State<TextInp> createState() => _TextInpState();
}

class _TextInpState extends State<TextInp> {
  // Créez des FocusNode pour chaque champ de texte
  final FocusNode _codeFocusNode = FocusNode();
  String? _validationError;
  bool _hasError =
      false; // Ajoutez une variable pour suivre si le champ de texte a une erreur

  @override
  void dispose() {
    // Assurez-vous de libérer les FocusNode lorsque le widget est supprimé
    _codeFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textController, // Utilisez le contrôleur pour l'email
      obscureText: false,
      decoration: InputDecoration(
        labelText: widget.nom, // Personnalisez le libellé selon vos besoins
        errorText: null,
        prefixIcon: const Icon(Icons.person_2_outlined),
        suffixIcon:
            _hasError // Ajoutez un suffixIcon conditionnel pour afficher l'icône d'erreur
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
                          duration: const Duration(
                              seconds: 5), // Durée d'affichage du message
                          behavior: SnackBarBehavior
                              .floating, // Pour positionner le SnackBar en haut
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
                            ),
                          ), // Forme personnalisée pour le SnackBar
                        ),
                      );
                    },
                  )
                : null, // Si le champ de texte n'a pas d'erreur, ne montrez pas l'icône
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      focusNode: _codeFocusNode,
      onFieldSubmitted: (_) {
        FocusScope.of(context).nextFocus();
      },
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value!.isEmpty) {
          setState(() {
            _hasError =
                true; // Si le champ de texte est vide, définissez la variable _hasError sur true
          });
          _validationError =
              'Veuillez entrer une valeur'; // Retournez un message d'erreur
        }
        setState(() {
          _hasError =
              false; // Si le champ de texte n'est pas vide, définissez la variable _hasError sur false
        });
        return null; // Retournez null pour indiquer qu'il n'y a pas d'erreur de validation
      },
    );
  }
}
