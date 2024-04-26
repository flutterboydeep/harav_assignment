import 'package:flutter/material.dart';

import 'package:harav_assignment/model/coffee_model.dart';

class GridCoffeeDetailPage extends StatefulWidget {
  final CoffeeModel gridmodel;
  GridCoffeeDetailPage({
    super.key,
    required this.gridmodel,
  });

  @override
  State<GridCoffeeDetailPage> createState() => _GridCoffeeDetailPageState();
}

class _GridCoffeeDetailPageState extends State<GridCoffeeDetailPage> {
  var selected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.favorite_outline))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: const Color.fromARGB(255, 255, 255, 255),
                image: DecorationImage(
                    image: AssetImage("${widget.gridmodel.image}"),
                    fit: BoxFit.cover),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text("${widget.gridmodel.name}",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.black, fontWeight: FontWeight.bold)),
            Text("${widget.gridmodel.coffeeWith}"),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 25,
                ),
                Text("${widget.gridmodel.rate}(230)"),
                Expanded(
                  child: SizedBox(
                    width: 150,
                  ),
                ),
                FloatingActionButton.small(
                  onPressed: () {},
                  child: Icon(
                    Icons.savings_outlined,
                    color: Color.fromARGB(255, 243, 104, 30),
                  ),
                ),
                FloatingActionButton.small(
                  onPressed: () {},
                  child: Icon(
                    Icons.gas_meter,
                    color: Color.fromARGB(255, 236, 68, 21),
                  ),
                )
              ],
            ),
            Divider(
                // color: Colors.black,
                ),
            Text(
              "Description",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Text(
              "${widget.gridmodel.description}",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: const Color.fromARGB(255, 69, 68, 68)),
            ),
            Text(
              "Size",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            sizeCategories(),
            Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 249, 247, 247),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  )),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text("Price"),
                        Text(
                          "\$${widget.gridmodel.price}",
                          style: TextStyle(
                              color: Colors.orange,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 227, 122, 17),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 10),
                        child: Center(
                          child: Text(
                            "Buy Now",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
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

  sizeCategories() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children: [
        "S",
        "M",
        "L",
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
                        width: 80,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: selected == key
                                ? Color.fromARGB(255, 217, 85, 24)
                                : Color.fromARGB(255, 123, 123, 123),
                          ),
                          color: selected == key
                              ? Color.fromARGB(138, 242, 197, 143)
                              : Color.fromARGB(255, 232, 231, 231),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              value,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color: selected == key
                                        ? Color.fromARGB(240, 232, 77, 10)
                                        : Colors.black,
                                  ),
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
}
