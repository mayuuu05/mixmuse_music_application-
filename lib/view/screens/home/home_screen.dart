import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../model/song_model.dart';
import '../../../provider/song_provider.dart';
import '../../../utils/globals/global_list.dart';
import '../song/song_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      // backgroundColor: const Color(0xFF1C1C1E),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.05,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height * 0.02),
            Text(
              "Find Your Best Music",
              style: TextStyle(
                color: Colors.white,
                fontSize: size.width * 0.06,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF1C1C1E),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.04,
                  vertical: size.height * 0.015,
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.search,
                      color: Colors.white70,
                    ),
                    SizedBox(width: size.width * 0.03),
                    Expanded(
                      child: Text(
                        "Search",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: size.width * 0.045,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "New Albums",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: size.width * 0.05,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "View all",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: size.width * 0.04,
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.02),
            SizedBox(
              height: size.height * 0.15,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 7,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(right: size.width * 0.04),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: size.width * 0.3,
                          height: size.height * 0.11,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image:  DecorationImage(
                              image: AssetImage(
                                  imageList[index]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.01),
                        Text(
                          "Album",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: size.width * 0.03,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: size.height * 0.04),
            Text(
              "Recently Music",
              style: TextStyle(
                color: Colors.white,
                fontSize: size.width * 0.05,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Expanded(
              child: Provider.of<SongProvider>(context).songModel == null
                  ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
                  : Consumer<SongProvider>(
                builder: (context, provider, child) => ListView.builder(
                  itemCount: provider.songModel!.data.results.length,
                  itemBuilder: (context, index) {
                    Result result =
                    provider.songModel!.data.results[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: size.height * 0.015),
                      child: InkWell(
                        onTap: () {

                          provider.playSong(result.downloadUrl[1].url);
                          provider.setSong(result);
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SongPage(),
                          ));
                        },
                        child: Row(
                          children: [
                            Text(
                              "0${index + 1}",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: size.width * 0.04,
                              ),
                            ),
                            SizedBox(width: size.width * 0.03),
                            Container(
                              width: size.width * 0.12,
                              height: size.width * 0.12,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image:
                                  NetworkImage(result.image[2].url),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: size.width * 0.03),
                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    result.name,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: size.width * 0.04,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: size.height * 0.005),
                                  Text(
                                    result.artists.primary[0].name,
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: size.width * 0.035,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.more_vert,
                              color: Colors.white70,
                              size: size.width * 0.06,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              // child: ListView.builder(
              //   itemCount: 9,
              //   itemBuilder: (context, index) {
              //     return Padding(
              //       padding: EdgeInsets.symmetric(vertical: size.height * 0.015),
              //       child: Row(
              //         children: [
              //           Text(
              //             "0${index + 1}",
              //             style: TextStyle(
              //               color: Colors.white,
              //               fontSize: size.width * 0.04,
              //             ),
              //           ),
              //           SizedBox(width: size.width * 0.03),
              //           Container(
              //             width: size.width * 0.12,
              //             height: size.width * 0.12,
              //             decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(10),
              //               image: DecorationImage(
              //                 image: AssetImage(
              //                     'assets/images/music${index + 1}.jpg'),
              //                 fit: BoxFit.cover,
              //               ),
              //             ),
              //           ),
              //           SizedBox(width: size.width * 0.03),
              //           Expanded(
              //             child: Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Text(
              //                   "Music ${index + 1}",
              //                   style: TextStyle(
              //                     color: Colors.white,
              //                     fontSize: size.width * 0.04,
              //                     fontWeight: FontWeight.w500,
              //                   ),
              //                 ),
              //                 SizedBox(height: size.height * 0.005),
              //                 Text(
              //                   "Artist ${index + 1}",
              //                   style: TextStyle(
              //                     color: Colors.white70,
              //                     fontSize: size.width * 0.035,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ),
              //           Icon(
              //             Icons.more_vert,
              //             color: Colors.white70,
              //             size: size.width * 0.06,
              //           ),
              //         ],
              //       ),
              //     );
              //   },
              // ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Color(0xFF1C1C1E),
        padding:
        EdgeInsets.symmetric(vertical: 10, horizontal: size.width * 0.05),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.explore_outlined,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.local_fire_department_outlined,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                CupertinoIcons.chat_bubble_text,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                CupertinoIcons.person,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}