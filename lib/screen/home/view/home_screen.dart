import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/screen/home/provider/home_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? providerr;
  HomeProvider? providerw;

  @override
  void initState() {
    super.initState();
    context.read<HomeProvider>().getWeather();
  }

  @override
  Widget build(BuildContext context) {
    providerr = context.read<HomeProvider>();
    providerw = context.watch<HomeProvider>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Weather"),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.book_outlined)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
          ],
        ),
        drawer: Drawer(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text(
                  "City Name",
                  style: TextStyle(fontSize: 22, color: Colors.black),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    providerr!.changeLatLan(21.1702, 72.8311);
                  },
                  child: drawer(context, "Surat"),
                ),
                const SizedBox(height: 10,),
                InkWell(
                  onTap: () {
                    providerr!.changeLatLan(22.3072, 73.1812);
                  },
                  child: drawer(context, "Vadodara"),
                ),
                const SizedBox(height: 10,),
                InkWell(
                  onTap: () {
                    providerr!.changeLatLan(23.0225, 72.5714);
                  },
                  child: drawer(context, "Ahmedabad"),
                ),
                const SizedBox(height: 10,),
                InkWell(
                  onTap: () {
                    providerr!.changeLatLan(22.3039, 70.8022);
                  },
                  child: drawer(context, "Rajkot"),
                ),
                const SizedBox(height: 10,),
                InkWell(
                  onTap: () {
                    providerr!.changeLatLan(21.6015, 71.2204);
                  },
                  child: drawer(context, "Amreli"),
                ),
                const SizedBox(height: 10,),
                InkWell(
                  onTap: () {
                    providerr!.changeLatLan(21.7645, 72.1519);
                  },
                  child: drawer(context, "Bhavnagar"),
                ),
              ],
            ),
          ),
        ),
        body: Stack(
          children: [
            Image.network(
              "https://i.pinimg.com/564x/a9/b9/6b/a9b96bcc31d3101e58538d888555d1b2.jpg",
              fit: BoxFit.cover,
              height: MediaQuery.sizeOf(context).height,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      "${providerw!.homeModel!.name}",
                      style: const TextStyle(color: Colors.black, fontSize: 22),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Temptaure = ${providerw!.homeModel!.cloudsModel!.all} °C",
                      style: const TextStyle(fontSize: 22),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Main = ",
                          style: TextStyle(fontSize: 20),
                        )),
                    const SizedBox(height: 10,),
                    Container(
                      height: MediaQuery.sizeOf(context).height * 0.18,
                      width: MediaQuery.sizeOf(context).width,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue.shade50)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "feels_like = ${providerw!.homeModel!.mainModel!.feels_like}",
                            style: const TextStyle(fontSize: 18),
                          ),
                          Text(
                            "temp_max = ${providerw!.homeModel!.mainModel!.temp_max}",
                            style: const TextStyle(fontSize: 18),
                          ),
                          Text(
                            "temp_min = ${providerw!.homeModel!.mainModel!.temp_min}",
                            style: const TextStyle(fontSize: 18),
                          ),
                          Text(
                            "pressure = ${providerw!.homeModel!.mainModel!.pressure}",
                            style: const TextStyle(fontSize: 18),
                          ),
                          Text(
                            "humidity = ${providerw!.homeModel!.mainModel!.humidity}",
                            style: const TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Wind = ",
                          style: TextStyle(fontSize: 20),
                        )),
                    Container(
                      height: MediaQuery.sizeOf(context).height * 0.08,
                      width: MediaQuery.sizeOf(context).width,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue.shade50)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Degree = ${providerw!.homeModel!.windModel!.deg}",
                            style: const TextStyle(fontSize: 18),
                          ),
                          Text(
                            "Speed = ${providerw!.homeModel!.windModel!.speed}",
                            style: const TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container drawer(BuildContext context, String name) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.07,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: const TextStyle(fontSize: 18),
            ),
            const Icon(Icons.arrow_forward_ios_rounded),
          ],
        ),
      ),
    );
  }
}
