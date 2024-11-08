import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> cardData = [
    {
      'image': 'assets/images/image1.jpg',
      'title': 'Album 1',
      'description': 'This is a popular album description.',
    },
    {
      'image': 'assets/images/image2.jpg',
      'title': 'Album 1',
      'description': 'This is a popular album description.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: const Color(0xFF2FE18D),
                      child: Center(
                        child: Text(
                          "A",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    getData("All"),
                    SizedBox(width: 10),
                    getData("Music"),
                    SizedBox(width: 10),
                    getData("Podcast"),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Popular album',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 12),
              getGridContainer(),
              SizedBox(height: 20),
              Text(
                'Popular radio',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 12),
              getGridContainer(),
              SizedBox(height: 20),
              Text(
                'Popular artists',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 12),
              CircleAvatar(
                  radius: 20,
                  backgroundColor: const Color(0xFF2FE18D),
                  child: Center(
                    child: Text(
                      "A",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget getData(String label) {
    return Container(
      height: 30,
      width: 60,
      decoration: BoxDecoration(
        color: const Color(0xFF404040),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget getGridContainer() {
    return Container(
      height: 150,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: cardData.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 11,
          crossAxisSpacing: 11,
          childAspectRatio: 1 / 1,
        ),
        itemBuilder: (context, index) {
          return Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                image: DecorationImage(
                  image: AssetImage(cardData[index]['image']),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
