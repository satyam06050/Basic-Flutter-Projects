import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_ui/functions/dataBaseFunctions.dart';
import 'package:insta_ui/pages/databasedata.dart';

class Databaseoptions extends StatefulWidget {
  const Databaseoptions({super.key});

  @override
  State<Databaseoptions> createState() => _DatabaseoptionsState();
}

class _DatabaseoptionsState extends State<Databaseoptions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Database Options"),
        actions: [
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Get.snackbar("Logged Out", "You have been signed out",
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.grey.shade200,
                  colorText: Colors.black);
            },
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
          ),
        ],
      ),
      body: Center(
        child: Card(
          elevation: 8,
          margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildActionButton(
                  icon: Icons.add,
                  label: "Create",
                  color: Colors.green,
                  onPressed: () {
                    create('pets', "katty", "jerry", 'cat', 2);
                  },
                ),
                const SizedBox(height: 16),
                _buildActionButton(
                  icon: Icons.edit,
                  label: "Update",
                  color: Colors.orange,
                  onPressed: () {
                    update('pets', 'kitty', 'age', 5);
                  },
                ),
                const SizedBox(height: 16),
                _buildActionButton(
                  icon: Icons.download,
                  label: "Retrieve",
                  color: Colors.blue,
                  onPressed: () {
                    Get.to(const Databasedata());
                  },
                ),
                const SizedBox(height: 16),
                _buildActionButton(
                  icon: Icons.delete,
                  label: "Delete",
                  color: Colors.red,
                  onPressed: () {
                    delete('pets', 'kitty');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        icon: Icon(icon),
        label: Text(label),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(vertical: 14),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
