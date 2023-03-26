import 'package:flutter/material.dart';

empty(setFun) {
  setFun(() {});
}

CustombottomSheet(
  context,
  setFun, {
  required String title,
  required String price,
  required String description,
  required String image,
  required String category,
}) {
  return showModalBottomSheet(
      context: context,
      builder: ((context) {
        return Container(
          height: 320,
          child: Column(
            children: [
              ListTile(
                leading: Icon(
                  Icons.image,
                ),
                title: Text(title),
                subtitle: Text(price),
                trailing: Text(category),
              ),
              ListTile(
                leading: Icon(
                  Icons.camera,
                ),
                title: Text("Camera"),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      }));
}
