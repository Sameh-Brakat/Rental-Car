import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/shared/cubit/cubit.dart';
import '/shared/cubit/state.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RentalCarCubit, RentalCarState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = RentalCarCubit.get(context);
        return Scaffold(
          backgroundColor: Color(0xffe4e3e3),
          appBar: AppBar(
            backgroundColor: Color(0xffe4e3e3),
            elevation: 0,
            title: Row(
              children: [
                Text(
                  "Choose",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'myfont',
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  " a Car",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'myfont',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    color: Colors.black54,
                  ))
            ],
          ),
          body: ConditionalBuilder(
            condition: RentalCarCubit.get(context).profileModel != null,
            builder: (BuildContext context) =>
                cubit.bottomNavScreen[cubit.indexnav],
            fallback: (BuildContext context) =>
                Center(child: CircularProgressIndicator()),
          ),
          bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            child: BottomNavigationBar(
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.grey,
                onTap: (index) {
                  cubit.changeBottomNavScreen(index);
                },
                backgroundColor: Color(0xff1d1f20),
                type: BottomNavigationBarType.fixed,
                currentIndex: cubit.indexnav,
                items: const [
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Icon(
                        Icons.apps,
                      ),
                    ),
                    label: "",
                  ),
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Icon(
                        Icons.person_outline,
                      ),
                    ),
                    label: "",
                  ),
                ]),
          ),
        );
      },
    );
  }
}
