import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Container(
          height: 45,
          width: 340,
          decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(16)

          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 0, horizontal: 20),
                child: Icon(Icons.minimize, size: 30,),
              ), Spacer(),
              Icon(Icons.add, size: 30,)
            ],
          ),
        ),
      ),
    );
  }
}