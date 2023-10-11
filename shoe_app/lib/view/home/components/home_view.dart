import 'package:flutter/material.dart';
import 'package:sneakers_app/data/dummy_data.dart';
import 'package:sneakers_app/utils/constants.dart';
import 'package:sneakers_app/view/home/components/home_appbar.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    int selectedIndexCatagory = 2;
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          appBar: const HomeAppBar(),
          backgroundColor: AppConstantsColor.backgroundColor,
          body: Column(
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    width: size.width,
                    height: size.height * 0.07,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 10,
                      ),
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              categories[index],
                              style: TextStyle(
                                  fontSize:
                                      selectedIndexCatagory == index ? 21 : 18,
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
                  )
                ],
              ),
            ],
          )),
    );
  }
}
