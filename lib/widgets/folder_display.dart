import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Widget FolderDisplay(Function() ? onTap, QueryDocumentSnapshot doc) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Icon(
            Icons.folder,
            color: Colors.lightBlue,
            size: 150,
          ),
          Text(
            doc["title"],
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15.5,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    ),
  );
}