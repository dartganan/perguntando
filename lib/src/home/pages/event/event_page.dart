import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:perguntando/src/shared/utils/multlerp.dart';
import 'package:perguntando/src/shared/widgets/scrollable_content/scrollable_content_widget.dart';

import '../question/question_module.dart';
import 'components/card_event.dart';
import 'event_module.dart';
import 'event_bloc.dart';

class EventPage extends StatefulWidget {
  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  final bloc =EventModule.to.bloc<EventBloc>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        ListView.builder(
          // reverse: true,
          scrollDirection: Axis.horizontal,
          controller: bloc.backgroundController,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Image.network(
              index.isEven
                  ? "https://i2.wp.com/flutterando.com.br/wp-content/uploads/2019/06/3305e16d-a366-4c00-8e37-f180cc55fb01-e1560863231414.jpg?w=1080&ssl=1"
                  : "https://i.udemycdn.com/user/200_H/51101684_c590_2.jpg",
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            );
          },
        ),
        AnimatedBuilder(
          animation: bloc.pageController,
          builder: (context, snapshot) {
            var value = bloc.pageController.positions.isNotEmpty
                ? bloc.pageController?.page ?? 0.0
                : 0.0;
            var countPage = 5;
            Color color = MultiLerpColor.lerpFromCount(countPage, value: value);
            return Container(color: color.withOpacity(0.5));
          },
        ),
        Container(
          padding: EdgeInsets.only(top: 80),
          child: ScrollableContentWidget(
            crossAxisAlignment: CrossAxisAlignment.start,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: <Widget>[
              CircleAvatar(
                maxRadius: 40,
                backgroundImage: CachedNetworkImageProvider(
                  "https://eventostech.com.br/wp-content/uploads/2019/06/flutter-talks-br-eventostech-800x450.jpg",
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Nome do evento",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                "12/01/1919",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              SizedBox(height: 15),
              Text(
                "djiedfjofijsofijsofijsefoisjefoisejfosifjosfijosifjoseifjsofijsoefijso ijseof jsefo isjfo eisfj osifjo sijo",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ],
            button: SafeArea(
              child: Container(
                padding: EdgeInsets.only(bottom: 50),
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: 280,
                  child: PageView.builder(
                    controller: bloc.pageController,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      String tag = "question_$index";
                      return CardEvent(
                        tag: tag,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  fullscreenDialog: true,
                                  builder: (BuildContext context) {
                                    return QuestionModule(tag);
                                  }));
                        },
                      );
                    },
                  ),
                  // child: ListView.separated(
                  //   itemCount: 4,
                  //   padding: EdgeInsets.symmetric(horizontal: 20),
                  //   scrollDirection: Axis.horizontal,
                  //   itemBuilder: (context, index) {
                  //     String tag = "question_$index";
                  //     return CardEvent(
                  //       tag: tag,
                  //       onPressed: (){
                  //          Navigator.push(context,
                  //           MaterialPageRoute(
                  //             fullscreenDialog: true,
                  //             builder: (BuildContext context) {
                  //             return QuestionModule(tag);
                  //           }));
                  //       },
                  //     );
                  //   },
                  //   separatorBuilder: (context, index) {
                  //     return Container(
                  //       width: 20,
                  //     );
                  //   },
                  // ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 80,
          child: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
        ),
      ],
    )
        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   mainAxisAlignment: MainAxisAlignment.start,
        //   children: <Widget>[
        //     Padding(
        //       padding: const EdgeInsets.symmetric(horizontal: 20),
        //       child: Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         mainAxisAlignment: MainAxisAlignment.start,
        //         children: <Widget>[
        //           CircleAvatar(
        //             maxRadius: 40,
        //             backgroundImage: CachedNetworkImageProvider(
        //                 "https://eventostech.com.br/wp-content/uploads/2019/06/flutter-talks-br-eventostech-800x450.jpg"),
        //           ),
        //           Container(height: 10,),
        //           Text("Nome do evento",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18 ),),
        //           Container(height: 10,),
        //           Text("12/01/1919", style: TextStyle(color: Colors.white, fontSize: 14 ),),
        //           Container(height: 15,),
        //           Text(
        //               "djiedfjofijsofijsofijsefoisjefoisejfosifjosfijosifjoseifjsofijsoefijso ijseof jsefo isjfo eisfj osifjo sijo", style: TextStyle(color: Colors.white, fontSize: 14 ),),
        //         ],
        //       ),
        //     ),
        //     Spacer(),
        //     Container(
        //       width: double.infinity,
        //       height: 280,
        //       child: ListView.separated(
        //         itemCount: 4,
        //         padding: EdgeInsets.symmetric(horizontal: 20),
        //         scrollDirection: Axis.horizontal,
        //         itemBuilder: (context, index) {
        //           String tag = "question_$index";
        //           return CardEvent(
        //             tag: tag,
        //             onPressed: (){
        //                Navigator.push(context,
        //                 MaterialPageRoute(builder: (BuildContext context) {
        //                   return QuestionModule(tag);
        //                 }));
        //             },
        //           );
        //         },
        //         separatorBuilder: (context, index) {
        //           return Container(
        //             width: 20,
        //           );
        //         },
        //       ),
        //     ),
        //     Container(height: MediaQuery.of(context).size.height * 0.1,)
        //   ],
        // ),
        );
  }
}
