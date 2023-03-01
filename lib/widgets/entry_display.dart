import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Widget entryDisplay(
    BuildContext context, Function()? onTap, QueryDocumentSnapshot doc) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Theme.of(context).primaryColor.withOpacity(.2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            doc["title"],
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            children: [
              const Icon(
                Icons.calendar_month,
                //color: Colors.black38,
                size: 15.0,
              ),
              const SizedBox(width: 2.0),
              Text(
                doc["date"],
                style: const TextStyle(
                    //color: Colors.black54,
                    ),
              ),
            ],
          ),
          Text(
            doc["note"],
            style: const TextStyle(
                //: Colors.black,
                ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    ),
  );
}
