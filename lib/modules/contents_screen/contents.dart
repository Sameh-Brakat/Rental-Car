import 'package:flutter/material.dart';

class PrevCar extends StatelessWidget {
  PrevCar(
      {required this.model,
      required this.features,
      required this.image,
      required this.price,
      required this.logo,
      required this.num_psngrs,
      required this.details1,
      required this.details2});

  final String logo;
  final String model;
  final String image;
  final int price;
  final List<String> features;
  final String num_psngrs;
  final String details1;
  final String details2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1d1f20),
        elevation: 0,
        actions: [
          Icon(Icons.more_horiz_rounded),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          height: MediaQuery.of(context).size.height * .4,
          width: double.infinity,
          decoration: const BoxDecoration(
              color: Color(0xff1d1f20),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 30,
                          height: 30,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Image.asset("$logo"),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(9)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "$model",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 15,
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Text(
                          "4.8",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 200, child: Image.asset(image)),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/icons/passenger.png', scale: 0.8),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          num_psngrs,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: 'myfont',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/icons/luggage_large.png',
                                scale: 0.8),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              details1,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'myfont',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Row(
                          children: [
                            Image.asset('assets/icons/luggage_small.png',
                                scale: 0.8),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              details2,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'myfont',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20, bottom: 10, top: 18),
                child: Text(
                  "Specifications",
                  style: TextStyle(
                    fontFamily: 'myfont',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Container(
                  height: 60,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: features.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        SizedBox(
                      width: 10,
                    ),
                    itemBuilder: (BuildContext context, int index) => Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      alignment: Alignment.center,
                      height: 50,
                      width: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xff1d1f20),
                      ),
                      child: Text(
                        features[index],
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Locations"),
                    Row(
                      children: [
                        Icon(Icons.boy),
                        Text("344 m"),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Color(0xff0f5ef5),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Mansfield Avenu, Los Angeles, CA"),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          // width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Text(
                      '$price',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      '£/day',
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
              Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * .5,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Color(0xff0f5ef5),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                      )),
                  child: Text(
                    "Book now",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'myfont',
                      fontWeight: FontWeight.w500,
                    ),
                  ))
            ],
          ),
        ),
      ]),
    );
  }
}
