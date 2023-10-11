import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:json_app/controllers/json_controller.dart';

import 'package:json_app/utils/my_page_route.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    List gImages = [
      'https://i.ytimg.com/vi/CtYPUNu-1VE/maxresdefault_live.jpg',
      'https://i.pinimg.com/originals/65/b3/77/65b377cccd6ff27b6ca29de8e9de42cf.jpg',
      'https://i.pinimg.com/originals/a6/8c/62/a68c62b9a65ee6ddff3fe5e21d40aecc.jpg',
    ];
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(25),
          ),
        ),
        title: Text(
          "Bhagavad Gita",
          style: GoogleFonts.poppins(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        toolbarHeight: 120,
        actions: const [
          // PopupMenuButton(),
        ],
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            CarouselSlider(
              disableGesture: true,
              items: List.generate(
                gImages.length,
                (index) => Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue,
                      style: BorderStyle.solid,
                      width: 10,
                    ),
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: NetworkImage(gImages[index]),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
              options: CarouselOptions(
                animateToClosest: true,
                enlargeCenterPage: true,
                aspectRatio: 2 / 2,
                autoPlay: true,
                height: 200,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 460,
              width: double.infinity,
              child: Consumer<JsonController>(
                builder: (context, provider, child) {
                  return ListView.builder(
                      itemCount: 18,
                      itemBuilder: (context, index) {
                        return Card(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                MyPageRoute.chapterPage,
                                arguments: index,
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              height: s.height * 0.08,
                              width: s.width,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Colors.blueAccent,
                                    Colors.blue,
                                    Colors.lightBlueAccent
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Text(
                                "Chapter  :  ${index + 1}",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        );
                      });
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(MyPageRoute.favoriteScreen);
        },
        child: const Icon(
          Icons.favorite,
          color: Colors.blue,
        ),
      ),
    );
  }
}
