import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Dastur haqida'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
              '  Bu dsaturda Konsta\'ning ayrim qoshiqlari jamlangan. Bu dastur online qoshiq eshitishga'
              ' mo\'ljallangan b\'lib, bu online xizmat orqali keyinchalik dasturga koproq yangi qoshiqlarni joylashga yordam beradi.'),
          const Text(
              '\n  Agar dastur sizga yoqgan bo\'lsa baholang va do\'stlaringizga ulashing.'),
          const SizedBox(height: 4),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.star,
                      color: Colors.orangeAccent,
                    ),
                  ),
                  const Text('Baholash'),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.share,
                      color: Colors.green,
                    ),
                  ),
                  const Text('Ulashish'),
                ],
              ),
            ],
          ),
          const Divider(),
          const Text('Ilovadagi materiallar internet saytlardan olindi.'
              ' Qo\'shiq muallifidan rozilik olingan. Maroqli tinglov tilaymiz.'),
        ],
      ),
    );
  }
}
