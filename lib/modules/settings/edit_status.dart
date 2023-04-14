import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turbo_rental_car/modules/settings/view_profile.dart';
import 'package:turbo_rental_car/shared/components/constants.dart';

import '../../shared/components/components.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/state.dart';

class EditStatus extends StatelessWidget {
  EditStatus({super.key});

  Color? color;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RentalCarCubit, RentalCarState>(
      listener: (context, state) {},
      builder: (context, state) {
        var model = RentalCarCubit.get(context).profileModel!;
        var cubit = RentalCarCubit.get(context);

        List<Widget> status = [
          TextButton(
            onPressed: () {
              cubit.changeStatusIndex(0, Colors.green);
            },
            child: Row(
              children: [
                Row(
                  children: [
                    Container(
                      height: 16,
                      width: 16,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.green,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Active',
                      style: TextStyle(fontSize: 22, color: Colors.green),
                    ),
                  ],
                ),
                Spacer(),
                if (cubit.statusindex == 0)
                  Icon(
                    Icons.check,
                    color: cubit.statusColor,
                  ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              cubit.changeStatusIndex(1, Colors.red);
            },
            child: Row(
              children: [
                Row(
                  children: [
                    Container(
                      height: 16,
                      width: 16,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Busy',
                      style: TextStyle(fontSize: 22, color: Colors.red),
                    ),
                  ],
                ),
                Spacer(),
                if (cubit.statusindex == 1)
                  Icon(
                    Icons.check,
                    color: cubit.statusColor,
                  ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              cubit.changeStatusIndex(2, Colors.yellow[700]!);
            },
            child: Row(
              children: [
                Row(
                  children: [
                    Container(
                      height: 16,
                      width: 16,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.yellow[700],
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Away',
                      style: TextStyle(fontSize: 22, color: Colors.yellow[700]),
                    ),
                  ],
                ),
                Spacer(),
                if (cubit.statusindex == 2)
                  Icon(
                    Icons.check,
                    color: cubit.statusColor,
                  ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              cubit.changeStatusIndex(3, Colors.grey);
            },
            child: Row(
              children: [
                Row(
                  children: [
                    Container(
                      height: 16,
                      width: 16,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Offline',
                      style: TextStyle(fontSize: 22, color: Colors.grey),
                    ),
                  ],
                ),
                Spacer(),
                if (cubit.statusindex == 3)
                  Icon(
                    Icons.check,
                    color: cubit.statusColor,
                  ),
              ],
            ),
          ),
        ];

        return Scaffold(
          backgroundColor: Color(0xffe4e3e3),
          appBar: AppBar(
            backgroundColor: Color(0xffe4e3e3),
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            ),
            title: const Text(
              'Set a Status',
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.tag_faces, size: 30),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "What's Your Status?...",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  child: ListView.separated(
                    itemCount: status.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      height: 1,
                      width: double.infinity,
                      color: Colors.grey,
                    ),
                    itemBuilder: (BuildContext context, int index) =>
                        status[index],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );

    ;
  }
}
