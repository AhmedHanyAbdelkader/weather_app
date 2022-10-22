import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:weather/weather/data/data_source/remote_data_source.dart';
import 'package:weather/weather/data/repository/weather_repository.dart';
import 'package:weather/weather/domain/entities/weather.dart';
import 'package:weather/weather/domain/repository/base_weather_repository.dart';
import 'package:weather/weather/domain/use_cases/get_weather_by_country_name.dart';
import 'package:weather/weather/presentation/screens/search_screen.dart';

class HomePage extends StatefulWidget {
   HomePage({Key? key,required this.weather}) : super(key: key);
   Weather weather;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextStyle style = const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 36,);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:
      widget.weather != null
          ? Column(
        children: [
          Container(
            width: double.infinity,
            // height: 500,
            height: MediaQuery.of(context).size.height*0.8,
            decoration:  BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Colors.lightBlueAccent,
                  Colors.purpleAccent,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  hoverColor: Colors.purpleAccent,
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SearchScreen()));
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all()
                    ),
                    child: const Center(child: Text("try another country . . .")),
                  ),
                ),
              ),
                const SizedBox(height: 20,),
                Text(widget.weather.cityName,style: style,),
                const SizedBox(height: 20,),
                Center(child: Image.asset('assets/images/R.png',width: MediaQuery.of(context).size.width*0.3,height: MediaQuery.of(context).size.width*0.2,)),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text("${widget.weather.minTemp}"),
                        const Text("mini temp")
                      ],
                    ),
                    Column(
                      children: [
                        Text("${widget.weather.temp}",style: style,),
                        const Text("temp")
                      ],
                    ),
                    Column(
                      children: [
                        Text("${widget.weather.maxTemp}"),
                        const Text("max temp")
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text("${widget.weather.pressure}"),
                        const Text("pressure")
                      ],
                    ),
                    Column(
                      children: [
                        Text("${widget.weather.description}",style: style,),
                        const Text("description")
                      ],
                    ),
                    Column(
                      children: [
                        Text("${widget.weather.windSpeed}"),
                        const Text("wind speed")
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 30,),
          Text("${DateTime.now().day} - ${DateTime.now().month} - ${DateTime.now().year}",style: style,)
        ],
      )
          : Center(
        child: CircularProgressIndicator(),
      )
    );
  }


}
