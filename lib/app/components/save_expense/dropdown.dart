import 'package:budgetBlocks/app/extensions/widgets_scale_extension.dart';
import 'package:budgetBlocks/app/theme/text_style.dart';
import 'package:flutter/material.dart';

List<DropdownMenuItem<Object>>? dorpDownList = [
  DropdownMenuItem<Object>(
    child: DorpText(text: 'Salaries and Commissions'),
  ),
  DropdownMenuItem<Object>(
    child: DorpText(text: 'Travel Costs'),
  ),
  DropdownMenuItem<Object>(
    child: DorpText(text: 'Advertising and Promotions'),
  ),
  DropdownMenuItem<Object>(
    child: DorpText(text: 'Training and Development'),
  ),
  DropdownMenuItem<Object>(
    child: DorpText(text: 'Sales Tools and Technology'),
  ),
  DropdownMenuItem<Object>(
    child: DorpText(text: 'Samples and Demo Materials'),
  ),
];

const List<String> list = <String>[
  'Select Category',
  'Salaries and Commissions',
  'Travel Costs',
  'Advertising and Promotions',
  'Training and Development',
  'Sales Tools and Technology',
  'Samples and Demo Materials'
];

class CustomDropdownButton extends StatefulWidget {
  const CustomDropdownButton({super.key});

  @override
  State<CustomDropdownButton> createState() => Custom_DropdownButtonState();
}

class Custom_DropdownButtonState extends State<CustomDropdownButton> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      isExpanded: true,
      value: dropdownValue,
      elevation: 16,
      style: dropDownStyle,
      onChanged: (String? value) {
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
            value: value,
            child: DorpText(
              text: value,
            ));
      }).toList(),
    );
  }
}

class DorpText extends StatelessWidget {
  final String text;
  const DorpText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.horizontalScale),
      child: Text(
        text,
        style: dropDownStyle,
      ),
    );
  }
}
