import 'package:flutter/material.dart';

class Text_Feild extends StatefulWidget {
  final TextEditingController controller;
  final bool multiLines;
  final String labelText;
  final IconData prefixicon;
  bool obsecure;
  IconData? suffixicon;
  Text_Feild(
      {Key? key,
      required this.controller,
      required this.multiLines,
      required this.labelText,
      this.obsecure = false,
      required this.prefixicon,
      this.suffixicon})
      : super(key: key);

  @override
  State<Text_Feild> createState() => _Text_FeildState();
}

class _Text_FeildState extends State<Text_Feild> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(color: Colors.blueGrey.shade100),
        child: TextFormField(
          controller: widget.controller,
          decoration: InputDecoration(
              labelText: widget.labelText,
              border: InputBorder.none,
              suffixIcon: InkWell(
                child: widget.suffixicon != null
                    ? Icon(widget.obsecure
                        ? widget.suffixicon
                        : Icons.visibility_off)
                    : SizedBox(),
                onTap: () {
                  setState(() {
                    widget.obsecure = !widget.obsecure;
                  });
                },
              ),
              prefixIcon: Icon(widget.prefixicon)),
          obscureText: widget.obsecure,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter your ${widget.labelText}';
            }
            return null;
          },
        ),
      ),
    );
  }
}
