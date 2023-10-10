import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:json_app/controllers/json_controller.dart';
import 'package:json_app/modals/json_modals.dart';
import 'package:provider/provider.dart';

class ChapterPage extends StatelessWidget {
  const ChapterPage({super.key});

  @override
  Widget build(BuildContext context) {
    int ind = ModalRoute.of(context)!.settings.arguments as int;
    Size s = MediaQuery.of(context).size;

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            'https://i.ytimg.com/vi/CtYPUNu-1VE/maxresdefault_live.jpg',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          title: Text(
            "Chapter :- ${ind + 1}",
            style: GoogleFonts.poppins(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.blue,
          centerTitle: true,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Consumer<JsonController>(builder: (context, pro, child) {
            JsonModals verse = pro.allData[ind];
            return pro.allData.isNotEmpty
                ? ListView.builder(
                    itemCount: pro.allData.length,
                    itemBuilder: (context, index) {
                      JsonModals verse1 = pro.allData[index];
                      return verse1.chapter_id == ind + 1
                          ? Card(
                              child: Container(
                                padding: const EdgeInsets.only(
                                  left: 10,
                                ),
                                height: s.height * 0.3,
                                width: s.width,
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
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Spacer(),
                                    Text(
                                      "|| ${verse1.verse_number} ||",
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Spacer(
                                      flex: 3,
                                    ),
                                    Text(
                                      verse1.text,
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Spacer(
                                      flex: 5,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : const SizedBox();
                    },
                  )
                : Center(
                    child: CircularProgressIndicator(
                      color: Colors.deepPurple.shade900,
                    ),
                  );
          }),
        ),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
