import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    Key? key,
    required this.controller,
    required this.title,
    required this.hintText,
    this.obscureText = false,
    required this.errorText,
    required this.keyboardType,
    this.maxLines,
    this.maxLength,
    this.disableTitle = false,
    this.prefixIcon,
    this.suffixIcon,
    this.readOnly = false,
    this.onEditCompleted,
  }) : super(key: key);

  final TextEditingController controller;
  final String title;
  final String hintText;
  final bool obscureText;
  final String? errorText;
  final TextInputType keyboardType;
  final int? maxLines;
  final int? maxLength;
  final bool disableTitle;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool readOnly;
  final VoidCallback? onEditCompleted;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        !widget.disableTitle
            ? Text(
                widget.title,
                style: const TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                  color: Colors.black,
                ),
              )
            : const SizedBox(),
        SizedBox(height: !widget.disableTitle ? 8 : 0),
        TextField(
          controller: widget.controller,
          obscureText: widget.obscureText && hidePassword,
          textAlignVertical: TextAlignVertical.center,
          keyboardType: widget.keyboardType,
          maxLines: widget.maxLines ?? 1,
          maxLength: widget.maxLength,
          buildCounter: (_,
              {required currentLength, maxLength, required isFocused}) {
            return maxLength != null ? Text("$currentLength/$maxLength") : null;
          },
          inputFormatters: [
            if (widget.keyboardType == TextInputType.number) ...[
              FilteringTextInputFormatter.digitsOnly
            ]
          ],
          readOnly: widget.readOnly,
          decoration: InputDecoration(
            
            fillColor: Theme.of(context).colorScheme.surface,
            filled: true,
            hintText: widget.hintText,
            isDense: true,
            hintStyle: const TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 16,
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color:Color(0xffC3C3C3))
            ),
            errorText: widget.errorText,
            errorStyle: const TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 14,
            ),
            suffixIcon: widget.obscureText
                ? InkWell(
                    onTap: () {
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                    },
                    radius: 4,
                    child: Icon(
                      hidePassword ? Icons.visibility_off : Icons.visibility,
                      color: Theme.of(context).colorScheme.onSurface,
                      size: 24,
                    ),
                  )
                : widget.suffixIcon,
            prefixIcon: widget.prefixIcon,
          ),
          onEditingComplete: widget.onEditCompleted,
        ),
      ],
    );
  }
}
