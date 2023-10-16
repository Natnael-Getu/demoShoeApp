import 'package:flutter/material.dart';
import 'package:sneakers_app/animation/fade_animation.dart';
import 'package:sneakers_app/data/dummy_data.dart';
import 'package:sneakers_app/models/shoe_model.dart';
import 'package:sneakers_app/models/moreCatagories.dart';
import 'package:sneakers_app/utils/constants.dart';

import 'Appbar.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({
    Key? key,
    required this.model,
    required this.isComeFromMore,
    required this.newModel,
  }) : super(key: key);

  final ShoeModel model;
  final bool isComeFromMore;
  final MoreCatagories newModel;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppConstantsColor.backgroundColor,
        extendBodyBehindAppBar: true,
        appBar: customDetailViewAppBar(context),
        body: Container(
          color: Colors.red.withOpacity(0.3),
          child: Column(
            children: [
              SizedBox(
                width: size.width,
                height: size.height / 2.2,
                child: Stack(children: [
                  Positioned(
                    left: 60,
                    child: FadeAnimation(
                      delay: 0.5,
                      child: Container(
                        width: size.width,
                        height: size.height / 2.2,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(1500),
                                bottomRight: Radius.circular(150)),
                            color: model.modelColor),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 85,
                    child: Hero(
                      tag: isComeFromMore
                          ? newModel.imgAddress
                          : model.imgAddress,
                      child: RotationTransition(
                        turns: const AlwaysStoppedAnimation(-20 / 360),
                        child: Image(
                          image: AssetImage(isComeFromMore
                              ? newModel.imgAddress
                              : model.imgAddress),
                          height: size.height / 5.5,
                          width: size.width / 1,
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
