// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:master_bot/constants/app_color.dart';
import 'package:master_bot/models/suroo_model.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    Key? key,
    required this.jooptor,
    required this.onTap,
  }) : super(key: key);

  final List<Joop> jooptor;
  final Function(bool) onTap;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

Color testColor = AppColor.contColor;

class _CustomButtonState extends State<CustomButton> {
  int? selectedIndex;

  final List<Color> colors = <Color>[
    Colors.green,
    Colors.red,
    Colors.red,
    Colors.red,
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 140,
        ),
        itemCount: 4,
        itemBuilder: (context, index) {
          final item = widget.jooptor[index];

          bool isSelected = selectedIndex == index;
          Color itemColor =
              isSelected ? (item.isTrue ? colors[0] : colors[1]) : Colors.grey;

          return InkWell(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
              widget.onTap(item.isTrue);
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: itemColor,
              child: Center(
                  child: Text(
                widget.jooptor[index].text,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              )),
            ),
          );
        },
      ),
    );
  }
}
