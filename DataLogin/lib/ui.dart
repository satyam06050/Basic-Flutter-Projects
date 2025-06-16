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
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        title: Text("satyam._.40"),
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              height: 200,
              child: Row(
                children: [
                  Container(
                      width: 170,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundImage: AssetImage("assets/satyam.jpg"),
                          ),
                          Text(
                            "Satyam Kumar",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "Flutter Developer",
                            style: TextStyle(
                                fontSize: 10, color: Colors.redAccent),
                          )
                        ],
                      )),
                  Expanded(
                      child: Container(
                    //color: Colors.amber,
                    child: Column(
                      children: [
                        Container(
                          // color: Colors.red,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              profileDetails('100', 'Posts'),
                              SizedBox(
                                width: 10,
                              ),
                              profileDetails('100', 'Followers'),
                              SizedBox(
                                width: 10,
                              ),
                              profileDetails('100', 'Following'),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                    child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          WidgetStatePropertyAll<Color>(
                                              Colors.blue)),
                                  onPressed: () {},
                                  child: Text(
                                    "Follow",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 30),
                                  ),
                                )),
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(color: Colors.blue, width: 2),
                                ),
                                child: Icon(
                                  Icons.arrow_downward,
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ))
                ],
              ),
            ),
            Container(
              height: 120,
              //color: Colors.red,
              child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(5),
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                        ),
                        Text("Title")
                      ],
                    );
                  }),
            ),
            Container(
              height: 100,
              color: Colors.blue,
            ),
            Expanded(
                child: Container(
              //color: Colors.green,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(1),
                      height: 100,
                      width: 100,
                      //color: Colors.amber,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(10)),
                    );
                  }),
            ))
          ],
        ),
      ),
    );
  }

  Widget profileDetails(String text1, text2) {
    return Column(
      children: [
        Text(
          text1,
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
        Text(
          text2,
          style: TextStyle(color: Colors.black, fontSize: 14),
          //  style: TextStyle(color: Colors.red),
        ),
      ],
    );
  }
}
