import 'package:flutter/material.dart';

class TelIndice extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final String selectedCountry;

  const TelIndice({
    Key? key,
    required this.onChanged,
    required this.selectedCountry,
  }) : super(key: key);

  @override
  State<TelIndice> createState() => _TelIndiceState();
}

class _TelIndiceState extends State<TelIndice> {
  // Créez des FocusNode pour chaque champ de texte
  final FocusNode _codeFocusNode = FocusNode();

  @override
  void dispose() {
    // Assurez-vous de libérer les FocusNode lorsque le widget est supprimé
    _codeFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> countries = [
      {'code': '+228', 'flag': 'assets/images/icons/flags/tg.png'},
      {'code': '+229', 'flag': 'assets/images/icons/flags/benin.png'},
      {'code': '+227', 'flag': 'assets/images/icons/flags/fasso.png'},
      {'code': '+225', 'flag': 'assets/images/icons/flags/ci.png'},
      {'code': '+226', 'flag': 'assets/images/icons/flags/sen.png'},
      {'code': '+230', 'flag': 'assets/images/icons/flags/mali.png'},
      {'code': '+2224', 'flag': 'assets/images/icons/flags/niger.png'},
    ];

    return Container(
      width: 115,
      height: 57,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0)),
      child: DropdownButtonFormField<String>(
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 2),
        ),
        value: widget.selectedCountry,
        onChanged: (String? newValue) {
          widget.onChanged(newValue ?? '');
        },
        items: countries.map((country) {
          return DropdownMenuItem<String>(
            value: country['code'],
            child: Row(
              children: [
                Image.asset(
                  country['flag'],
                  width: 30,
                  height: 30,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 5),
                Text('${country['code']}'),
              ],
            ),
          );
        }).toList(),
        isDense: true,
        focusNode: _codeFocusNode,
      ),
    );
  }
}

/*
class _ParentWidgetState extends State<ParentWidget> {
  String selectedCountry = '+228';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TelIndice(
          selectedCountry: selectedCountry,
          onChanged: (newValue) {
            setState(() {
              selectedCountry = newValue;
            });
          },
        ),
        ElevatedButton(
          onPressed: () {
            // Utilisez la variable selectedCountry ici pour récupérer la valeur choisie
          },
          child: const Text('Récupérer la valeur choisie'),
        ),
      ],
    );
  }
}*/