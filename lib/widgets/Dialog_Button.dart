// ignore_for_file: file_names

import 'package:flutter/material.dart';

class DialogButton extends StatelessWidget {
  const DialogButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("hello");
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 5, right: 17, left: 17, bottom: 10),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.2,
          height: 50,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade400,
                blurRadius: 4,
              ),
            ],
            color: Colors.grey.shade100,
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
          child: Padding(
            padding: const EdgeInsets.only(right: 15, top: 18, bottom: 16),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [const Text("safasfas")]),
          ),
        ),
      ),
    );
  }
}
