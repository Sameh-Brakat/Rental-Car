import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/cars_models.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/state.dart';
import '../contents_screen/contents.dart';

class CarsScreen extends StatelessWidget {
  CarsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RentalCarCubit, RentalCarState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = RentalCarCubit.get(context);

          List<Widget> itemH = [
            Text(
              'All',
              style: TextStyle(
                  color: cubit.indexlist1 == 0 ? Colors.white : Colors.black,
                  fontFamily: 'myfont',
                  fontWeight: FontWeight.w700,
                  fontSize: 15),
            ),
            Image.asset(
              "assets/icons/icons8-audi.png",
              width: 40,
            ),
            Image.asset(
              "assets/icons/icons8-ford-48.png",
              width: 40,
            ),
            Image.asset(
              "assets/icons/icons8-hyundai-100.png",
              width: 40,
            ),
            Image.asset(
              "assets/icons/icons8-kia-100.png",
              width: 40,
            ),
            Image.asset(
              "assets/icons/icons8-mitsubishi-100.png",
              width: 40,
            ),
            Image.asset(
              "assets/icons/icons8-toyota-100.png",
              width: 40,
            ),
            Image.asset(
              "assets/icons/icons8-nissan-48.png",
              width: 40,
            ),
            Image.asset(
              "assets/icons/icons8-subaru-48.png",
              width: 40,
            ),
            Image.asset(
              "assets/icons/icons8-suzuki-100.png",
              width: 40,
            ),
            Image.asset(
              "assets/icons/icons8-volkswagen-16.png",
              width: 40,
            ),
          ];

          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Brands',
                    style: TextStyle(
                      fontFamily: 'myfont',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  height: 65,
                  child: ListView.separated(
                    padding: EdgeInsets.only(left: 20),
                    scrollDirection: Axis.horizontal,
                    itemCount: itemH.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        SizedBox(
                      width: 15,
                    ),
                    itemBuilder: (BuildContext context, int index) => InkWell(
                      onTap: () {
                        cubit.changeIndex(index);
                      },
                      child: Container(
                          alignment: Alignment.center,
                          width: 65,
                          decoration: BoxDecoration(
                              color: cubit.indexlist1 == index
                                  ? Color(0xff0f5ef5)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: itemH[index]),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Available Cars',
                    style: TextStyle(
                      fontFamily: 'myfont',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: BuildListCars(context, cubit),
                ),
              ],
            ),
          );
        });
  }

  Widget BuildListCars(context, cubit) => ListView.separated(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        itemCount: type[cubit.indexlist1].length,
        separatorBuilder: (BuildContext context, int index) => SizedBox(
          height: 10,
        ),
        itemBuilder: (BuildContext context, int index) => Container(
          height: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                bottom: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width * .89,
                  height: 125,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                  bottom: 0,
                  right: 3,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PrevCar(
                              logo: type[cubit.indexlist1][index]['logo'],
                              price: type[cubit.indexlist1][index]['price'],
                              model: type[cubit.indexlist1][index]['model'],
                              details1: type[cubit.indexlist1][index]
                                  ['details1'],
                              details2: type[cubit.indexlist1][index]
                                  ['details2'],
                              features: type[cubit.indexlist1][index]
                                  ['features'],
                              image: type[cubit.indexlist1][index]['image'],
                              num_psngrs: type[cubit.indexlist1][index]
                                  ['num_psngrs'],
                            ),
                          ));
                    },
                    child: Container(
                        alignment: Alignment.center,
                        width: 160,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Color(0xff0f5ef5),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20))),
                        child: Text(
                          "Details",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'myfont',
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                  )),
              Positioned(
                  top: -3,
                  left: 10,
                  child: Container(
                    width: 180,
                    child: Image.asset(
                      type[cubit.indexlist1][index]['image'],
                      fit: BoxFit.fitWidth,
                    ),
                  )),
              Positioned(
                  bottom: 0,
                  left: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "${type[cubit.indexlist1][index]['price']}",
                              style: TextStyle(
                                fontFamily: 'myfont',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              '£/day',
                              style: TextStyle(fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                        // SizedBox(
                        //   height: 3,
                        // ),
                        Row(
                          children: [
                            Image.asset('assets/icons/passenger.png',
                                scale: 1.5),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "${type[cubit.indexlist1][index]['num_psngrs']}",
                              style: TextStyle(
                                fontSize: 10,
                                fontFamily: 'myfont',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
              Positioned(
                  right: 15,
                  top: 45,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "${type[cubit.indexlist1][index]['model']}",
                        style: TextStyle(
                          fontFamily: 'myfont',
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Column(
                        children: [
                          if (type[cubit.indexlist1][index]['details1'] != null)
                            Row(
                              children: [
                                Image.asset('assets/icons/luggage_large.png',
                                    scale: 1.5),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "${type[cubit.indexlist1][index]['details1']}",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: 'myfont',
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black45),
                                ),
                              ],
                            ),
                          if (type[cubit.indexlist1][index]['details2'] != null)
                            Row(
                              children: [
                                Image.asset('assets/icons/luggage_small.png',
                                    scale: 1.5),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "${type[cubit.indexlist1][index]['details2']}",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'myfont',
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black45),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ],
                  )),
            ],
          ),
        ),
      );
}
