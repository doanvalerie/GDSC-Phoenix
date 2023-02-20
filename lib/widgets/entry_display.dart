import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Widget entryDisplay(Function() ? onTap, QueryDocumentSnapshot doc) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(doc["title"]),
          Text(doc["date"]),
          Text(
            doc["note"],
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    ),
  );
}