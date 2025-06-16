import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_ui/dataBaseOptions.dart';

class Databasedata extends StatefulWidget {
  const Databasedata({super.key});

  @override
  State<Databasedata> createState() => _DatabasedataState();
}

class _DatabasedataState extends State<Databasedata> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Dark theme
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Pet Data", style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(Databaseoptions());
              },
              icon: Icon(Icons.arrow_forward, color: Colors.white))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection("pets").snapshots(),
            builder: (context, petsnapshots) {
              if (petsnapshots.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(color: Colors.white),
                );
              } else {
                final petDocs = petsnapshots.data!.docs;
                return ListView.builder(
                  itemCount: petDocs.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.grey[900],
                      margin: EdgeInsets.symmetric(vertical: 8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: ListTile(
                        title: Text(
                          petDocs[index]['name'],
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        subtitle: Text(
                          petDocs[index]['animal'],
                          style: TextStyle(color: Colors.grey[400]),
                        ),
                        leading: CircleAvatar(
                          backgroundColor: Colors.deepPurple,
                          child: Text(
                            petDocs[index]['name'][0].toUpperCase(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
            }),
      ),
    );
  }
}
