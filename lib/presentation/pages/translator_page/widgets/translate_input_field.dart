import 'package:flutter/material.dart';

class TranslateInputField extends StatefulWidget {
  const TranslateInputField({
    super.key,
    required this.controller,
    this.readOnly = false,
    this.focusNode,
    this.onTap,
    this.onChanged,
  });
  final TextEditingController controller;
  final FocusNode? focusNode;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final bool readOnly;

  @override
  State<TranslateInputField> createState() => _TranslateInputFieldState();
}

class _TranslateInputFieldState extends State<TranslateInputField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      // enabled: widget.readOnly,
      readOnly: widget.readOnly,
      focusNode: widget.focusNode,
      controller: widget.controller,
      decoration: InputDecoration(
        fillColor: Colors.transparent,
        hoverColor: Colors.transparent,
        iconColor: Colors.transparent,
        focusColor: Colors.transparent,
        prefixIconColor: Colors.transparent,
        suffixIconColor: Colors.transparent,
        border: border,
        errorBorder: border,
        focusedBorder: border,
        enabledBorder: border,
        disabledBorder: border,
        focusedErrorBorder: border,
      ),
      onTap: widget.onTap,
      onChanged: widget.onChanged,
      minLines: 1,
      maxLines: 999,
      scrollPhysics: const NeverScrollableScrollPhysics(),
      textInputAction: TextInputAction.newline,
      onTapOutside: (_) => widget.focusNode?.unfocus(),
    );
  }

  InputBorder get border => const OutlineInputBorder(
        borderRadius: BorderRadius.zero,
        borderSide: BorderSide(
          color: Colors.transparent,
        ),
      );
}
