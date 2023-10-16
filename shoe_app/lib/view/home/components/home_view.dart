import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sneakers_app/animation/fade_animation.dart';
import 'package:sneakers_app/data/dummy_data.dart';
import 'package:sneakers_app/theme/custom_app_theme.dart';
import 'package:sneakers_app/utils/constants.dart';
import 'package:sneakers_app/view/details/components/details.dart';
import 'package:sneakers_app/view/home/components/home_appbar.dart';
import 'package:sneakers_app/models/models.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndexCatagory = 0;
  int selectedIndexFeatured = 1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: const HomeAppBar(),
        backgroundColor: AppConstantsColor.backgroundColor,
        body: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _catagoryView(size),
            rotatedText(size),
            _moreTextandIcon(),
            bottomListView(size),
          ],
        ),
      ),
    );
  }

  Row rotatedText(Size size) {
    return Row(
      children: [
        SizedBox(
          width: size.width / 10,
          height: size.height / 2.5,
          child: RotatedBox(
            quarterTurns: -1,
            child: SizedBox(
              width: size.width / 1.2,
              height: size.height * 0.05,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: featured.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndexFeatured = index;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        featured[index],
                        style: TextStyle(
                            fontSize: selectedIndexFeatured == index ? 20 : 15,
                            color: selectedIndexFeatured == index
                                ? AppConstantsColor.darkTextColor
                                : AppConstantsColor.unSelectedTextColor,
                            fontWeight: selectedIndexFeatured == index
                                ? FontWeight.bold
                                : FontWeight.normal),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        _mainShoeView(size)
      ],
    );
  }

  SizedBox bottomListView(Size size) {
    return SizedBox(
      // color: Colors.red,
      height: size.height * 0.35,
      width: size.width,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: moreCatagorie.length,
        itemBuilder: (BuildContext context, int index) {
          MoreCatagories newModel = moreCatagorie[index];
          ShoeModel model = availableShoes[index];

          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsView(
                        model: model,
                        isComeFromMore: true,
                        newModel: newModel,
                      ),
                    ));
              },
              child: Container(
                width: size.width * 0.5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white),
                child: FadeAnimation(
                  delay: 1,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RotatedBox(
                            quarterTurns: 3,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                padding: const EdgeInsetsDirectional.all(3),
                                decoration:
                                    const BoxDecoration(color: Colors.red),
                                child: const Text('New',
                                    style: AppThemes.homeGridNewText),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.0),
                            child: Icon(
                              Icons.favorite_border,
                              size: 20,
                            ),
                          )
                        ],
                      ),
                      Hero(
                        tag: newModel.imgAddress,
                        child: RotationTransition(
                          turns: const AlwaysStoppedAnimation(-10 / 360),
                          child: Image(
                            height: 65,
                            image: AssetImage(newModel.imgAddress),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        moreCatagories[index],
                        style: AppThemes.homeGridNameAndModel,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '\$' + model.price.toString(),
                        style: AppThemes.bagTotalPrice,
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Padding _moreTextandIcon() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'More',
            style: AppThemes.homeMoreText,
          ),
          IconButton(
              onPressed: () {}, icon: const Icon(CupertinoIcons.arrow_right))
        ],
      ),
    );
  }

  SizedBox _mainShoeView(Size size) {
    return SizedBox(
      // color: Colors.red,
      height: size.height / 2.5,
      width: size.width - 32,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: availableShoes.length,
        itemBuilder: (BuildContext context, int index) {
          ShoeModel model = availableShoes[index];
          MoreCatagories newModel = moreCatagorie[index];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsView(
                      model: model,
                      isComeFromMore: false,
                      newModel: newModel,
                    ),
                  ));
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: size.height * 0.03),
              width: size.width / 2,
              height: size.height / 3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: model.modelColor,
              ),
              child: FadeAnimation(
                delay: 1,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: 7,
                      left: 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            model.name,
                            style: AppThemes.homeProductName,
                          ),
                          const Icon(
                            Icons.favorite_border,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                        top: 45,
                        left: 10,
                        child: Text(
                          model.model,
                          style: AppThemes.homeProductModel,
                        )),
                    Positioned(
                      top: 75,
                      left: 10,
                      child: Text(
                        '\$' + model.price.toString(),
                        style: AppThemes.homeProductPrice,
                      ),
                    ),
                    Positioned(
                      right: -20,
                      top: 30,
                      child: Hero(
                        tag: model.imgAddress,
                        child: RotationTransition(
                          turns: const AlwaysStoppedAnimation(-25 / 360),
                          child: Container(
                            width: 180,
                            height: 200,
                            child: Image(
                              width: 300,
                              image: AssetImage(model.imgAddress),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _catagoryView(Size size) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: size.width,
          height: size.height * 0.07,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndexCatagory = index;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.height * 0.02),
                  child: Text(
                    categories[index],
                    style: TextStyle(
                        fontSize: selectedIndexCatagory == index ? 20 : 18,
                        color: selectedIndexCatagory == index
                            ? AppConstantsColor.darkTextColor
                            : AppConstantsColor.unSelectedTextColor,
                        fontWeight: selectedIndexCatagory == index
                            ? FontWeight.bold
                            : FontWeight.normal),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(
          height: 1,
        ),
      ],
    );
  }
}
