import 'package:flutter/material.dart';

pushAndRemoveUntil(context, Widget page) {
  Navigator.pushAndRemoveUntil(
      context, MaterialPageRoute(builder: (context) => page), (route) => false);
}

push(context, Widget page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

pop(context) {
  Navigator.pop(context);
}
