import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fuel Wise',
      // theme: AppTheme.lightTheme,
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0XFF0A0E21),
        scaffoldBackgroundColor: const Color(0XFF0A0E21),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),

      home: const FuelCalculator(),
    );
  }
}

class FuelCalculator extends StatefulWidget {
  const FuelCalculator({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FuelCalculatorState createState() => _FuelCalculatorState();
}

class _FuelCalculatorState extends State<FuelCalculator> {
  int mileage = 33;
  int distance = 10;
  int numberOfPersons = 2; // Default value
  int fuelCost = 0;
  int costPerPerson = 0;
  int petrolPrice = 102;

  void calculateFuelCost() {
    setState(() {
      fuelCost = ((distance / mileage) * petrolPrice).toInt();
      costPerPerson = fuelCost ~/ numberOfPersons;
      // print(fuelCost);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "Fuel Wize",
              style: TextStyle(
                fontSize: 40,
                color: Color.fromARGB(255, 97, 82, 146),
                fontWeight: FontWeight.w500,
              ),
            ),
            // Spacer(),
            Container(
              height: size.height / 4.5,
              width: double.infinity,
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: const Color(0XFF1D1E33),
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // crossAxisAlignment: ,
                  children: [
                    // Spacer(),
                    const Text(
                      "Petrol Price",
                      style: TextStyle(fontSize: 25),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.blue,
                            inactiveTrackColor:
                                const Color.fromARGB(255, 38, 71, 98),
                            trackShape: const RectangularSliderTrackShape(),
                            trackHeight: 4.0,
                            thumbColor: Colors.blueAccent,
                            overlayColor: Colors.red.withAlpha(32),
                            overlayShape: const RoundSliderOverlayShape(
                                overlayRadius: 28.0),
                          ),
                          child: Slider(
                            // divisions: 2,
                            value: petrolPrice.toDouble(),
                            min: 100,
                            max: 120,
                            onChanged: (value) {
                              setState(() {
                                petrolPrice = value.toInt();
                                calculateFuelCost();
                              });
                            },
                          ),
                        ),
                        Text(
                          "₹ $petrolPrice / Litre ",
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    height: size.height / 4.5,
                    // width: size.width / 2.5,
                    margin: const EdgeInsets.all(12),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: const Color(0XFF1D1E33),
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Mileage",
                          style: TextStyle(fontSize: 22),
                        ),
                        //
                        Text(
                          "${mileage.toInt()} Km/L",
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        //for icon buttons

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  mileage--;
                                  calculateFuelCost();
                                });
                              },
                              child: const Icon(
                                CupertinoIcons.minus_square,
                                // Icons.abc_rounded,
                                // weight: 200,
                                size: 50,
                                color: Color.fromARGB(255, 97, 82, 146),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(
                                  () {
                                    mileage++;
                                    calculateFuelCost();
                                  },
                                );
                              },
                              child: const Icon(
                                CupertinoIcons.plus_square,
                                // Icons.abc_rounded,
                                // weight: 200,
                                size: 50,
                                color: Color.fromARGB(255, 97, 82, 146),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                // Spacer(),

                Expanded(
                  child: Container(
                    height: size.height / 4.5,
                    // width: size.width / 2.5,
                    margin: const EdgeInsets.all(12),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: const Color(0XFF1D1E33),
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Person",
                          style: TextStyle(fontSize: 22),
                        ),
                        //
                        Text(
                          numberOfPersons.toString(),
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        //for icon buttons

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  numberOfPersons--;
                                  calculateFuelCost();
                                });
                              },
                              child: const Icon(
                                CupertinoIcons.minus_square,
                                // Icons.abc_rounded,
                                // weight: 200,
                                size: 50,
                                color: Color.fromARGB(255, 97, 82, 146),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(
                                  () {
                                    numberOfPersons++;
                                    calculateFuelCost();
                                  },
                                );
                              },
                              child: const Icon(
                                CupertinoIcons.plus_square,
                                // Icons.abc_rounded,
                                // weight: 200,
                                size: 50,
                                color: Color.fromARGB(255, 97, 82, 146),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            Container(
              height: size.height / 7,
              width: double.infinity,
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: const Color(0XFF1D1E33),
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(),
                  const Text(
                    "Distance",
                    style: TextStyle(fontSize: 25),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.blue,
                          inactiveTrackColor:
                              const Color.fromARGB(255, 38, 71, 98),
                          trackShape: const RectangularSliderTrackShape(),
                          trackHeight: 4.0,
                          thumbColor: Colors.blueAccent,
                          overlayColor: Colors.red.withAlpha(32),
                          overlayShape: const RoundSliderOverlayShape(
                              overlayRadius: 28.0),
                        ),
                        child: Slider(
                          value: distance.toDouble(),
                          min: 0,
                          max: 100,
                          onChanged: (value) {
                            setState(() {
                              distance = value.toInt();
                              calculateFuelCost();
                            });
                          },
                        ),
                      ),
                      Text(
                        "$distance Km",
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      height: size.height / 4.3,
                      // width: size.width / 2.5,
                      margin: const EdgeInsets.all(12),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: const Color(0XFF1D1E33),
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Person",
                            style: TextStyle(fontSize: 22),
                          ),
                          //
                          Text(
                            numberOfPersons.toString(),
                            style: const TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          //for icon buttons

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    numberOfPersons--;
                                    calculateFuelCost();
                                  });
                                },
                                child: const Icon(
                                  CupertinoIcons.minus_square,
                                  // Icons.abc_rounded,
                                  // weight: 200,
                                  size: 50,
                                  color: Color.fromARGB(255, 97, 82, 146),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(
                                    () {
                                      numberOfPersons++;
                                      calculateFuelCost();
                                    },
                                  );
                                },
                                child: const Icon(
                                  CupertinoIcons.plus_square,
                                  // Icons.abc_rounded,
                                  // weight: 200,
                                  size: 50,
                                  color: Color.fromARGB(255, 97, 82, 146),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    height: size.height / 6,
                    // width: size.width / 2.5,
                    margin: const EdgeInsets.all(12),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: const Color(0XFF1D1E33),
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Total Cost",
                            style: TextStyle(fontSize: 28),
                          ),
                          //
                          Text(
                            "₹ $fuelCost",
                            style: const TextStyle(
                                fontSize: 45, fontWeight: FontWeight.bold),
                          ),
                          //for icon buttons
                        ]),
                  ),
                ),
                // Spacer(),

                Expanded(
                  child: Container(
                    height: size.height / 6,
                    // width: size.width / 2.5,
                    margin: const EdgeInsets.all(12),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(147, 30, 30, 1),
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //

                        const Text(
                          "Each",
                          style: TextStyle(fontSize: 28),
                        ),
                        Text(
                          "₹$costPerPerson",
                          style: const TextStyle(
                              fontSize: 45, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // TextField(
            //   decoration: const InputDecoration(labelText: 'Fuel Price'),
            //   keyboardType: TextInputType.number,
            //   inputFormatters: <TextInputFormatter>[
            //     FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
            //   ],
            //   onChanged: (value) {
            //     // Your onChanged logic
            //     fuelPrice = double.tryParse(value) ?? 0.0;
            //   },
            // ),
            // TextField(
            //   decoration: const InputDecoration(labelText: 'Distance'),
            //   keyboardType: TextInputType.number,
            //   onChanged: (value) {
            //     distance = double.tryParse(value) ?? 0.0;
            //   },
            // ),
            // Row(
            //   children: [
            //     const Text('Number of Persons:'),
            //     Slider(
            //       value: numberOfPersons.toDouble(),
            //       min: 1,
            //       max: 3,
            //       onChanged: (value) {
            //         setState(() {
            //           numberOfPersons = value.toInt();
            //           calculateFuelCost();
            //         });
            //       },
            //     ),
            //     Text(numberOfPersons.toString()),
            //   ],
            // ),
            // const SizedBox(height: 16),
            // ElevatedButton(
            //   onPressed: calculateFuelCost,
            //   child: const Text('Calculate'),
            // ),
            // const SizedBox(height: 16),
            // Text('Fuel Cost: ${fuelCost.toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }
}
