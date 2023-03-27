import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingRowButton extends StatelessWidget {
  final String title, subTitle;
  final Function onTap;
  final bool value;

  const SettingRowButton(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.value,
      required this.onTap});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        child: TextButton(
          onPressed: () => onTap(),
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(subTitle,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400, color: Colors.grey)),
                ],
              ),
              const SizedBox(width: 5),
              CupertinoSwitch(
                  value: value,
                  onChanged: (vl) {
                    onTap();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
