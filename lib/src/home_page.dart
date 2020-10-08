import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_training/dialog/logout_dialog.dart';
import 'package:flutter_training/model/trending.dart';
import 'package:flutter_training/providers/base_view.dart';
import 'package:flutter_training/providers/home_page_provider.dart';
import 'package:flutter_training/providers/trending_notifier.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends BaseView<HomePage, HomePageProvider> {
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 60 * 60;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget body() {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () {}, child: Icon(Icons.sentiment_neutral)),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        bottomNavigationBar: BottomAppBar(
            color: Colors.blue,
            shape: CircularNotchedRectangle(),
            child: Container(
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.home, size: 30.0, color: Colors.white),
                      Icon(Icons.school, size: 30.0, color: Colors.white),
                      SizedBox.shrink(),
                      Icon(Icons.business_center,
                          size: 30.0, color: Colors.white),
                      Icon(Icons.contact_phone, size: 30.0, color: Colors.white)
                    ],
                  ),
                ))),
        appBar: AppBar(
          title: Text(
            'Gardenex',
            style: TextStyle(
                fontSize: 30,
                fontFamily: "Mali-Italic",
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: Icon(Icons.menu),
          actions: [
            InkWell(
              onTap: () {
                LogoutDialog.showLoadingDialog(context, 'Bạn muốn đăng xuất?');
              },
              child: Icon(Icons.exit_to_app),
            )
          ],
        ),
        body: Consumer<TrendingNotifier>(
          builder: (context, value, child) => ListView(
            children: [
              _buildBanner(value.value),
              _buildPadding(),
              _buildGardeal(value.value),
              _buildPadding(),
              _buildProductIsSeen(value.value),
              _buildTrendingSearch(value.value),
            ],
          ),
        ));
  }

  Widget _buildPadding() {
    return Padding(padding: EdgeInsets.all(10));
  }

  Widget _buildBanner(Trending trending) {
    var count = (trending.data ?? []).length;
    return count == 0
        ? Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Container(
            child: CarouselSlider.builder(
              options: CarouselOptions(
                height: 200,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              ),
              itemCount: count,
              itemBuilder: (BuildContext context, int index) {
                DataTrending data = trending.data[index];

                Color color = data.color[0];
                return InkWell(
                  splashColor: Colors.pink,
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.only(top: 10.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://res.cloudinary.com/dziablq1m/image/upload/${color.image[0]}'),
                          fit: BoxFit.cover,
                        )),
                  ),
                );
              },
            ),
          );
  }

  Widget _buildGardeal(Trending trending) {
    var count = (trending.data ?? []).length;
    return count == 0
        ? SizedBox()
        : Container(
            color: Colors.blue[200],
            height: 260,
            child: Stack(
              children: [
                Positioned(
                  top: 10,
                  right: 10,
                  child: CountdownTimer(
                    endTime: endTime,
                    textStyle: TextStyle(fontSize: 30, color: Colors.pink),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Text(
                    'Gardeal',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Mali-Italic"),
                  ),
                ),
                ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: (trending.data ?? []).length,
                    itemBuilder: (BuildContext context, int index) {
                      DataTrending data = trending.data[index];
                      Color color = data.color[0];
                      Size size = data.size[0];
                      return Container(
                          padding:
                              EdgeInsets.only(top: 50, left: 10, right: 10),
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: FadeInImage.assetNetwork(
                                  height: 150,
                                  width: 110,
                                  fit: BoxFit.cover,
                                  placeholder: 'assets/images/loading.gif',
                                  image:
                                      'https://res.cloudinary.com/dziablq1m/image/upload/${color.image[0]}',
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  '${size.price}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontFamily: 'Mali-Italic',
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ));
                    }),
              ],
            ));
  }

  Widget _buildProductIsSeen(Trending trending) {
    return trending != null && trending.data != null
        ? Container(
            color: Colors.grey[100],
            height: 250,
            child: Stack(
              children: [
                Positioned(
                  top: 10,
                  left: 10,
                  child: Text(
                    'Sản Phẩm đã xem',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Mali-Italic"),
                  ),
                ),
                ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: trending.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      DataTrending data = trending.data[index];
                      Color color = data.color[0];
                      Size size = data.size[0];
                      return Container(
                          padding:
                              EdgeInsets.only(top: 50, left: 10, right: 10),
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: FadeInImage.assetNetwork(
                                  height: 150,
                                  width: 110,
                                  fit: BoxFit.cover,
                                  placeholder: 'assets/images/loading.gif',
                                  image:
                                      'https://res.cloudinary.com/dziablq1m/image/upload/${color.image[0]}',
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 5),
                                child: Text(
                                  '${size.price}',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontFamily: 'Mali-Italic',
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ));
                    }),
              ],
            ))
        : SizedBox();
  }

  Widget _buildTrendingSearch(Trending trending) {
    List<DataTrending> data = trending.data ?? [];
    return data == []
        ? SizedBox()
        : Container(
            color: Colors.blue[200],
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.search),
                      Text(
                        ' Tìm kiếm nổi bật',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Mali-Italic"),
                      )
                    ],
                  ),
                  Wrap(
                    alignment: WrapAlignment.center,
                    children: data.map((e) => _search(e.catalog)).toList(),
                  )
                ]),
          );
  }

  Widget _search(String name) {
    return Container(
        margin: EdgeInsets.all(5.0),
        padding: EdgeInsets.all(3.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.white, width: 2)),
        child: Text(
          name,
          style: TextStyle(fontFamily: "Mali-Italic"),
        ));
  }

  HomePageProvider initProvider() {
    HomePageProvider provider = HomePageProvider(this);
    provider.getTrending();
    return provider;
  }
}
