import 'package:flutter/material.dart';

class InstaUI extends StatefulWidget {
  const InstaUI({super.key});

  @override
  State<InstaUI> createState() => _InstaUIState();
}

class _InstaUIState extends State<InstaUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios, color: Colors.black),
        title: const Text("satyam._.40", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage("assets/satyam.jpg"),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Satyam Kumar",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const Text(
                      "Flutter Developer",
                      style: TextStyle(fontSize: 12, color: Colors.redAccent),
                    ),
                  ],
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          profileDetails('100', 'Posts'),
                          profileDetails('250', 'Followers'),
                          profileDetails('180', 'Following'),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Text("Follow",
                                  style: TextStyle(fontSize: 16)),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.blue, width: 2),
                            ),
                            child: const Icon(Icons.arrow_downward,
                                color: Colors.blue),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 100,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Column(
                    children: [
                      Container(
                        height: 65,
                        width: 65,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text("Title", style: TextStyle(fontSize: 12))
                    ],
                  ),
                );
              },
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: GridView.builder(
                itemCount: 15,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget profileDetails(String count, String label) {
    return Column(
      children: [
        Text(count,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Text(label, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}
