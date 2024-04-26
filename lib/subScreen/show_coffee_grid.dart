import 'package:flutter/material.dart';
import 'package:harav_assignment/model/coffee_model.dart';
import 'package:harav_assignment/model/dummyJsonData.dart';
import 'package:harav_assignment/screen.dart/grid_coffee_detail.dart';

class showCoffeeGrid extends StatefulWidget {
  const showCoffeeGrid({super.key});

  @override
  State<showCoffeeGrid> createState() => _showCoffeeGridState();
}

class _showCoffeeGridState extends State<showCoffeeGrid> {
  var selected = 0;
  coffeeCategories() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children: [
        "Cappuccino",
        "Machiato",
        "Latte",
        "Americano",
      ]
              .asMap()
              .map(
                (key, value) => MapEntry(
                  key,
                  Container(
                    // margin: EdgeInsets.only(left: 10, bottom: 20),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          selected = key;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: selected == key
                              ? Color.fromARGB(255, 244, 158, 54)
                              : Color.fromARGB(255, 232, 231, 231),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            value,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: selected == key
                                      ? Colors.white
                                      : Colors.black,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
              .values
              .toList()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 80,
        ),
        coffeeCategories(),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: GridView.builder(
              itemCount: coffeeList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                childAspectRatio: 0.7,
                mainAxisSpacing: 20,
              ),
              itemBuilder: ((context, index) {
                CoffeeModel coffeeModel = coffeeList[index];
                return gridCoffeeLayout(coffeeModel);
                // return Container(
                //   color: Colors.green,
                //   child: Text("$index"),
                // );
              })),
        ))
      ],
    );
  }

  gridCoffeeLayout(CoffeeModel coffeeModel) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(235, 237, 236, 236),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 5,
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GridCoffeeDetailPage(
                              gridmodel: coffeeModel,
                            )));
              },
              child: Container(
                alignment: Alignment.topRight,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage(coffeeModel.image),
                        fit: BoxFit.cover)),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 20,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        "${coffeeModel.rate}",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${coffeeModel.name}",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${coffeeModel.coffeeWith}",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: Colors.black),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$${coffeeModel.price}",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: Colors.black),
                      ),
                      FloatingActionButton.small(
                        //  backgroudColor: Color.fromARGB(255, 244, 158, 54),
                        backgroundColor: Color.fromARGB(255, 244, 158, 54),

                        onPressed: () {},
                        child: Icon(
                          Icons.add,

                          // backgroudColor: Color.fromARGB(255, 244, 158, 54),
                        ),
                      )
                    ],
                  )
                ],
              ))
        ],
      ),
    );
  }
}
