import 'package:flutter/material.dart';

class PromoBanner extends StatelessWidget {
  const PromoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("lib/assets/coffeeImages/coffeeBanner2.jpg"),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
              left: 30,
              top: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                      color: Color.fromARGB(255, 228, 79, 79),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        "Promo",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Buy one get",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(backgroundColor: Colors.black),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "one FREE",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(backgroundColor: Colors.black),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
