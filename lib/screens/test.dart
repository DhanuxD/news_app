// // ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
// import 'package:news_app/Models/news_model.dart';
// import 'package:news_app/Services/news_api.dart';
// import 'package:news_app/screens/details.dart';
// import 'package:news_app/shared/categories.dart';
// import 'package:news_app/widgets/contentWidget.dart';
// import 'package:provider/provider.dart';
// import '../Provider/change_theme.dart';
// import '../constant/text_filed_decoration.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   //NewsApi allArticals = NewsApi();
//   NewsApi? allArticals;

//   Future<void> refresh() async {
//     await Future.delayed(const Duration(seconds: 2));
//     setState(() {});
//   }

//   // --------------------------------------
//   // search(String query) {
//   //   final suggestion = allArticals.newsList.where((element) {
//   //     final newsTitel = element.title.toLowerCase();
//   //     final input = query.toLowerCase();
//   //     return newsTitel.contains(input);
//   //   }).toList();
//   //   setState(() {
//   //     allArticals.newsList = suggestion;
//   //   });
//   // }

//   // @override
//   // initState() {
//   //   // at the beginning, all users are shown
//   //   _foundUsers = allArticals.newsList;
//   //   super.initState();
//   // }

//   // ignore: prefer_final_fields
//   List<NewsModel> _foundUsers = [];

//   @override
//   void initState() {
//     allArticals = NewsApi();
//     print('');
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final classInstancee = Provider.of<ChangeTheme>(
//       context,
//     );
//     final double widthScreen = MediaQuery.of(context).size.width;

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.redAccent,
//         title: const Text(
//           "MH News",
//           style: TextStyle(
//               color: Colors.black,
//               fontFamily: "font3",
//               fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//         leading: IconButton(
//           onPressed: () {
//             setState(() {
//               classInstancee.changeTheme();
//             });
//           },
//           icon: const Icon(
//             Icons.sunny,
//             color: Colors.black,
//           ),
//         ),
//         actions: [
//           IconButton(
//               onPressed: () {},
//               icon: const Icon(
//                 Icons.favorite_border,
//                 color: Colors.black,
//               )),
//           const SizedBox(
//             width: 10,
//           ),
//         ],
//       ),
//       body: FutureBuilder<List<NewsModel>>(
//         future: allArticals!.getNews(context: context),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return const Center(
//               child: CircularProgressIndicator(
//                 color: Colors.redAccent,
//               ),
//             );
//           } else {
//             var recivedData = snapshot.data;
//             _foundUsers = recivedData;
//           }

//           return Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(
//                     top: 15, left: 30, right: 30, bottom: 20),
//                 child: TextField(
//                     // onChanged: _runFilter,
//                     obscureText: false,
//                     keyboardType: TextInputType.emailAddress,
//                     decoration: decorationtextFiled.copyWith(
//                       hintText: "Search",
//                       hintStyle: const TextStyle(fontFamily: "font3"),
//                       suffixIcon: const Icon(Icons.search),
//                     )),
//               ),

//               SizedBox(
//                 height: 45,
//                 child: ListView(
//                   scrollDirection: Axis.horizontal,
//                   children: [
//                     SizedBox(
//                       width: widthScreen * 0.1,
//                     ),
//                     CategoriesWidget(
//                       typeNews: 'BBC News',
//                     ),
//                     CategoriesWidget(
//                       typeNews: 'Sport',
//                     ),
//                     CategoriesWidget(
//                       typeNews: 'BBC News',
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               // Generated code for this topSearchBar Widget...
//               Expanded(
//                 child: RefreshIndicator(
//                   onRefresh: refresh,
//                   child: AnimationLimiter(
//                     child: GridView.builder(
//                       gridDelegate:
//                           const SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 1,
//                       ),
//                       itemCount: _foundUsers.length,
//                       itemBuilder: (BuildContext context, int index) {
//                         return AnimationConfiguration.staggeredGrid(
//                           position: index,
//                           columnCount: 1,
//                           duration: const Duration(milliseconds: 700),
//                           child: SlideAnimation(
//                             verticalOffset: 100,
//                             child: FadeInAnimation(
//                               curve: Curves.bounceInOut,
//                               delay: const Duration(microseconds: 1000),
//                               child: snapshot.hasData
//                                   ? GestureDetector(
//                                       onTap: () {
//                                         Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                               builder: (context) => DetailsPage(
//                                                     allArticalsFromOtherPage:
//                                                         _foundUsers[index],
//                                                   )),
//                                         );
//                                       },
//                                       child: ContentWidget(
//                                         title: _foundUsers[index].title,
//                                         decription:
//                                             _foundUsers[index].description,
//                                         imgurl: _foundUsers[index].urlToImage,
//                                         date: _foundUsers[index]
//                                             .publishedAt
//                                             .toString(),
//                                         author: _foundUsers[index]
//                                             .author
//                                             .toString(),
//                                       ),
//                                     )
//                                   : const Center(
//                                       child: CircularProgressIndicator(
//                                           color: Colors.redAccent),
//                                     ),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }

//   //  print("Data : ${recivedData}");
//           // _runFilter(String searchKeyWord) {
//           //   List<NewsModel> newList = [];

//           //   if (recivedData != null) {
//           //   } else {
//           //     newList = recivedData!
//           //         .where((element) => element.title
//           //             .toLowerCase()
//           //             .contains(searchKeyWord.toLowerCase()))
//           //         .toList();
//           //   }
//           //   setState(() {
//           //     // print('Set state : ${newList.length}');
//           //     // print('_foundUsers.length');
//           //     _foundUsers = newList;
//           //   });
//           // }