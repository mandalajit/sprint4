import 'package:flutter/material.dart';

class NotificationBox extends StatelessWidget {
  // ignore: use_super_parameters
  const NotificationBox({
    Key? key,
    this.onTap,
    this.notifiedNumber = 0,
  }) : super(key: key);

  final GestureTapCallback? onTap;
  final int notifiedNumber;
  
  // ignore: non_constant_identifier_names
  get SvgPicture => null;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.brown,
          border: Border.all(color: Colors.grey.withOpacity(.3)),
        ),
        child: notifiedNumber > 0
            ? Badge(
          backgroundColor: Colors.white,
          child: SvgPicture.asset(
            "assets/images/bell.svg",
            width: 25,
            height: 25,
          ),
        )
            : SvgPicture.asset("assets/images/bell.svg"),
      ),
    );
  }
}