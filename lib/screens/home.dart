import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:news_app/Models/news_model.dart';
import 'package:news_app/Services/news_api.dart';
import 'package:news_app/screens/details.dart';
import 'package:news_app/shared/categories.dart';
import 'package:news_app/widgets/contentWidget.dart';
import 'package:provider/provider.dart';
import '../Provider/change_theme.dart';
import '../constant/text_filed_decoration.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<NewsModel>> _searchResult;
  NewsApi? allArticals;
  String defaultImage =
      'https://i.ibb.co/NFJBpHX/istockphoto-961904768-640x640.jpg';

  Future<void> refresh() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {});
  }

  // ignore: prefer_final_fields
  List<NewsModel> _foundUsers = [];

  @override
  void initState() {
    allArticals = NewsApi();
    _searchResult = allArticals!.getNews(context: context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController searchWord = TextEditingController();
    final classInstancee = Provider.of<ChangeTheme>(
      context,
    );
    final double widthScreen = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text(
          "MH News",
          style: TextStyle(
              color: Colors.black,
              fontFamily: "font3",
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            setState(() {
              classInstancee.changeTheme();
            });
          },
          icon: const Icon(
            Icons.sunny,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_border,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: FutureBuilder<List<NewsModel>>(
        future: _searchResult,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            _foundUsers = snapshot.data as List<NewsModel>;
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 15, left: 30, right: 30, bottom: 20),
                  child: TextField(
                    controller: searchWord,
                    obscureText: false,
                    keyboardType: TextInputType.emailAddress,
                    decoration: decorationtextFiled.copyWith(
                      hintText: "Search",
                      hintStyle: const TextStyle(fontFamily: "font3"),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {
                          if (searchWord.text.isEmpty) {
                          setState(() {
                              _searchResult =
                                  allArticals!.getNews(context: context);
                          });
                          } else {
                            _runFilter(searchKeyWord: searchWord.text);
                          }
                        },
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 45,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      SizedBox(
                        width: widthScreen * 0.1,
                      ),
                      CategoriesWidget(
                        typeNews: 'BBC News',
                      ),
                      CategoriesWidget(
                        typeNews: 'Sport',
                      ),
                      CategoriesWidget(
                        typeNews: 'BBC News',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // Generated code for this topSearchBar Widget...
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: refresh,
                    child: AnimationLimiter(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                        ),
                        itemCount: _foundUsers.length,
                        itemBuilder: (BuildContext context, int index) {
                          return AnimationConfiguration.staggeredGrid(
                            position: index,
                            columnCount: 1,
                            duration: const Duration(milliseconds: 700),
                            child: SlideAnimation(
                              verticalOffset: 100,
                              child: FadeInAnimation(
                                curve: Curves.bounceInOut,
                                delay: const Duration(microseconds: 1000),
                                child: snapshot.hasData
                                    ? GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => DetailsPage(
                                                allArticalsFromOtherPage:
                                                    _foundUsers[index],
                                              ),
                                            ),
                                          );
                                        },
                                        child: ContentWidget(
                                          title: _foundUsers[index].title ?? '',
                                          decription:
                                              _foundUsers[index].description ??
                                                  '',
                                          imgurl:
                                              _foundUsers[index].urlToImage ??
                                                  defaultImage,
                                          date:
                                              _foundUsers[index].publishedAt ??
                                                  ''.toString(),
                                          author: _foundUsers[index].author ??
                                              ''.toString(),
                                        ),
                                      )
                                    : const Center(
                                        child: CircularProgressIndicator(
                                            color: Colors.redAccent),
                                      ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.redAccent,
              ),
            );
          }
        },
      ),
    );
  }

  Future _runFilter({required String searchKeyWord}) async {
    // List<NewsModel> newList = [];

    // newList = await allArticals!
    //  .getSearchNews(context: context, query: searchKeyWord);

    if (mounted) {
      setState(() {
        _searchResult =
            allArticals!.getSearchNews(context: context, query: searchKeyWord);
      });
    }
  }
}
