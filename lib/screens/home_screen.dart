import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_app/screens/hotel_screen.dart';
import 'package:my_app/screens/ticket_view.dart';
import 'package:my_app/utils/app_info_list.dart';
import 'package:my_app/utils/app_styles.dart';
import 'package:my_app/widgets/double_text_widget.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Styles.bgColor,
        body: ListView(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  const Gap(40),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Hello world", style: Styles.headlineStyle3),
                              const Gap(5),
                              Text('Look for tickets',
                                  style: Styles.headlineStyle1),
                            ]),
                        Container(
                          height: 65,
                          width: 65,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/img_1.png"),
                            ),
                          ),
                        )
                      ]),
                  const Gap(25),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFFF4F6FD)),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 12.0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.search,
                          color: Color(0xFFBFC205),
                        ),
                        Text('Search', style: Styles.headlineStyle4),
                      ],
                    ),
                  ),
                  const Gap(40),
                  const AppDoubleTextWidget(
                    bigText: 'Upcoming Flights',
                    smallText: 'View all',
                  ),
                ],
              ),
            ),
            const Gap(15),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                  children: ticketList
                      .map((ticketInfo) => TicketView(
                            ticket: ticketInfo,
                          ))
                      .toList()),
            ),
            const Gap(15),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: const AppDoubleTextWidget(
                bigText: 'Hotels',
                smallText: 'View all',
              ),
            ),
            const Gap(15),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                  children: hotelList
                      .map((hotelInfo) => HotelScreen(hotel: hotelInfo))
                      .toList()),
            ),
          ],
        ));
  }
}
