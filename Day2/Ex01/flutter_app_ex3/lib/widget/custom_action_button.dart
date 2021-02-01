import 'package:flutter/material.dart';
import 'package:flutter_app_ex3/common/app_style.dart';

class CustomActionButton extends StatelessWidget {
  // Properties
  final VoidCallback onClose;
  final VoidCallback onSave;

  // Constructor
  CustomActionButton({@required this.onClose, @required this.onSave});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        CustomButton(
          onPressed: onClose,
          buttonText: "Close",
        ),
        CustomButton(
          onPressed: onSave,
          buttonText: "Save",
          color: Theme.of(context).accentColor,
          textColor: AppColors.textColorWhite,
        )
      ],
    );
  }
}

class CustomButton extends StatelessWidget {
  // Properties
  final VoidCallback onPressed;
  final String buttonText;
  final Color color;
  final Color textColor;
  final Color borderColor;

  // Constructor
  CustomButton(
      {@required this.onPressed,
      @required this.buttonText,
      this.color,
      this.textColor,
      this.borderColor = Colors.transparent});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
          side: BorderSide(color: borderColor),
          borderRadius: BorderRadius.circular(12)),
      color: color,
      textColor: textColor,
      padding: const EdgeInsets.all(14.0),
      child: Text(buttonText),
    );
  }
}
