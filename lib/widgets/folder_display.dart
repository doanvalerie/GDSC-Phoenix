import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Widget FolderDisplay(BuildContext context, Function() ? onTap, QueryDocumentSnapshot doc) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Icon(
            Icons.folder,
            color: Theme.of(context).primaryColor.withOpacity(0.5),
            size: 150,
          ),
          Text(
            doc["title"],
            style: const TextStyle(
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