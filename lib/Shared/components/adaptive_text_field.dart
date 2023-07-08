// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// class AdaptiveTextField extends StatelessWidget {
//   final BuildContext context;
//   final TextEditingController controller;
//   final dynamic label;
//   final String? hintText;
//   final String? errorText;
//   final TextDirection? textDirection;
//   final Widget? prefix;
//   final Widget? textFormFieldIcon;
//   final String? initialValue;
//   final TextInputType? keyboardType;
//   final Function(String)? onSubmit;
//   final Function(String)? onChange;
//   final Function()? onTap;
//   final String? Function(String?) validate;
//   final bool isPassword;
//   final bool? enabled;
//   final IconData? suffix;
//   final Function()? suffixPressed;
//   final BoxConstraints? constraints;
//   final TextAlign? textAlign;
//   final int? maxLines;
//   final FocusNode? focusNode;
//   final bool autofocus;
//   final List<TextInputFormatter>? inputFormatters;
//   final TextCapitalization textCapitalization;
//   final double radius;
//
//   const AdaptiveTextField({
//     super.key,
//     required this.context,
//     required this.controller,
//     required this.validate,
//     this.focusNode,
//     this.textDirection,
//     this.errorText,
//     this.keyboardType = TextInputType.text,
//     this.label,
//     this.radius = 5,
//     this.textFormFieldIcon,
//     this.autofocus = false,
//     this.prefix,
//     this.initialValue,
//     this.onSubmit,
//     this.onChange,
//     this.onTap,
//     this.enabled,
//     this.suffix,
//     this.suffixPressed,
//     this.constraints,
//     this.textAlign = TextAlign.start,
//     this.maxLines,
//     this.hintText,
//     this.isPassword = false,
//     this.inputFormatters,
//     this.textCapitalization = TextCapitalization.words,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final hasFocus = controller.text.isNotEmpty;
//     return TextFormField(
//       controller: controller,
//       keyboardType: keyboardType,
//       obscureText: isPassword,
//       textDirection: textDirection,
//       textAlign: textAlign!,
//       onFieldSubmitted: onSubmit,
//       enabled: enabled,
//       autofocus: autofocus,
//       onChanged: onChange,
//       focusNode: focusNode,
//       onTap: onTap,
//       maxLines: maxLines,
//       validator: validate,
//       inputFormatters: inputFormatters,
//       textCapitalization: textCapitalization,
//       textAlignVertical: TextAlignVertical.center,
//       initialValue: initialValue,
//
//     );
//   }
// }
