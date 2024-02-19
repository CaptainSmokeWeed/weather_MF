import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_mf/bloc/weather_bloc_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Widget getWeatherIcon(int code){
    //have to optimized it
    switch (code) {
		  case >= 200 && < 300 :
		    return Image.asset(
					'assets/1.png'
				);
			case >= 300 && < 400 :
		    return Image.asset(
					'assets/2.png'
				);
			case >= 500 && < 600 :
		    return Image.asset(
					'assets/3.png'
				);
			case >= 600 && < 700 :
		    return Image.asset(
					'assets/4.png'
				);
			case >= 700 && < 800 :
		    return Image.asset(
					'assets/5.png'
				);
			case == 800 :
		    return Image.asset(
					'assets/6.png'
				);
			case > 800 && <= 804 :
		    return Image.asset(
					'assets/7.png'
				);
		  default:
			return Image.asset(
				'assets/7.png'
			);
		}
	}
  
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottomOpacity: 12,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.fromLTRB(40, 0, 20, 40),
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height,
            child: Stack(
              children: [
                Align(
                  alignment: const AlignmentDirectional(3, -0.3),
                  child: Container(
                    height: 300,
                    width: 300,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.purple),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-3, -0.3),
                  child: Container(
                    height: 300,
                    width: 300,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.deepPurple),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0, -1.2),
                  child: Container(
                    height: 300,
                    width: 600,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 255, 174, 0)),
                  ),
                ),
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                  child: Container(
                    decoration: const BoxDecoration(color: Colors.transparent),
                  ),
                ),
                BlocBuilder <WeatherBlocBloc, WeatherBlocState>(
                  builder: (context, state) {
                    if (state is WeatherBlocSuccess){
                    return SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      height: MediaQuery.sizeOf(context).height,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${state.weather.country} : ${state.weather.areaName}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            'Good Morning',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          getWeatherIcon(state.weather.weatherConditionCode!),
                          Center(
                            child: Text(
                              '${state.weather.temperature}',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 50,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Center(
                            child: Text(
                              state.weather.weatherMain!.toUpperCase(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          const SizedBox(height: 2),
                          Center(
                            child: Text(
                              DateFormat('EEEE dd.MM •').add_jm().format(state.weather.date!),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/11.png',
                                    scale: 8,
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  SingleChildScrollView (
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Sunrise',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          DateFormat().add_jm().format(state.weather.sunrise!),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/12.png',
                                        scale: 8,
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      SingleChildScrollView (
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Down',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Text(
                                              DateFormat().add_jm().format(state.weather.sunset!),
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 5.0),
                            child: Divider(
                              color: Colors.grey,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/13.png',
                                    scale: 8,
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  SingleChildScrollView (
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Max Temp',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          state.weather.tempMax.toString(),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/14.png',
                                    scale: 8,
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  SingleChildScrollView (
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Min Temp',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          state.weather.tempMin.toString(),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                  )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    } else{
                      return const Text('pizda');
                      }
                  },
                ),
              ],
            ),
          )),
    );
  }
}
