import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../provider/song_provider.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              color: Colors.white, size: size.width * 0.07),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Now Playing',
          style: TextStyle(
            color: Colors.white,
            fontSize: size.width * 0.05,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Consumer<SongProvider>(
        builder: (context, provider, child) => Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.05,
            vertical: size.height * 0.05,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height * 0.43,
                width: size.width * 0.9,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    provider.result!.image[2].url,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Text(
                provider.result!.name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: size.width * 0.06,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: size.height * 0.01),
              Text(
                provider.result!.artists.primary[0].name,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: size.width * 0.045,
                ),
              ),
              SizedBox(height: size.height * 0.04),
              // StreamBuilder(
              //   stream: provider.getCurrentPosition(),
              //   builder: (context, snapshot) => Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Text(
              //         snapshot.data!.inSeconds.toString(),
              //         style: TextStyle(
              //           color: Colors.white70,
              //           fontSize: size.width * 0.035,
              //         ),
              //       ),
              //       Expanded(
              //           child:  Slider(
              //             value: snapshot.data!.inSeconds.toDouble(),
              //             max: provider.duration!.inSeconds.toDouble() ?? 0,
              //             onChanged: (value) {
              //               provider.scrollSong(
              //                 Duration(
              //                   seconds: value.toInt(),
              //                 ),
              //               );
              //             },
              //             activeColor: Colors.white,
              //             inactiveColor: Colors.white24,
              //           ),),
              //       Text(
              //         provider.duration!.inSeconds.toString(),
              //         style: TextStyle(
              //           color: Colors.white70,
              //           fontSize: size.width * 0.035,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),


              Slider(value: 0.5, onChanged: (value) {

              },),
              Padding(
                padding:EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ' 2:21',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: size.width * 0.038,
                      ),
                    ),
                    Text(
                      ' 4:21',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: size.width * 0.038,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: size.height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.repeat,
                      color: Colors.white70,
                      size: size.width * 0.07,
                    ),
                  ),
                  SizedBox(width: size.width * 0.04),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.skip_previous,
                      color: Colors.white70,
                      size: size.width * 0.1,
                    ),
                  ),
                  SizedBox(width: size.width * 0.04),
                  InkWell(
                    onTap: () async {
                      await provider.songPlayOnClick();
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFFF26CCD),
                            // Color(0xFFD495DB),
                            // Color(0xFFE4BEE2),
                            // Color(0xFFB9C4E7),
                            // Color(0xFF99BEE9),
                            Color(0xFF5BA7F5),
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                          onPressed: () {},
                          icon:
                              // (provider.isPlay)?

                            Icon(
                            Icons.play_arrow,
                            color: Colors.black,
                            size: size.width * 0.1,
                          )
                          //     :Icon(
                          //   Icons.pause,
                          //   color: Colors.black,
                          //   size: size.width * 0.1,
                          // )

                          ),
                    ),
                  ),
                  SizedBox(width: size.width * 0.04),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.skip_next,
                      color: Colors.white70,
                      size: size.width * 0.1,
                    ),
                  ),
                  SizedBox(width: size.width * 0.04),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.shuffle,
                      color: Colors.white70,
                      size: size.width * 0.07,
                    ),
                  ),
                ],
              ),
              // SizedBox(height: size.height * 0.04),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     IconButton(
              //       onPressed: () {},
              //       icon: Icon(
              //         Icons.download_rounded,
              //         color: Colors.white70,
              //         size: size.width * 0.07,
              //       ),
              //     ),
              //     IconButton(
              //       onPressed: () {},
              //       icon: Icon(
              //         Icons.favorite_border,
              //         color: Colors.white70,
              //         size: size.width * 0.07,
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
