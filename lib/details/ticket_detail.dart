import 'package:cinema/controllers/ticketController.dart';
import 'package:cinema/details/payment.dart';
import 'package:cinema/models/movies.dart';
import 'package:cinema/welcome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ticket_material/ticket_material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';

class TicketDetail extends StatefulWidget {
  final Movie movie;

  TicketDetail({required this.movie});

  @override
  State<TicketDetail> createState() => _TicketDetailState();
}

class _TicketDetailState extends State<TicketDetail> {
  final TicketDetailController controller = Get.put(TicketDetailController());

  @override
  void initState() {
    super.initState();
  }

  // ... Autres parties du code ...
  Widget _buildLeft(TypeTicket ticket) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            '${widget.movie.title}',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '${ticket.price} FCFA',
            style: const TextStyle(
              color: Colors.blue,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          // Ajoutez d'autres informations concernant le ticket ici si nécessaire
        ],
      ),
    );
  }

  Widget _buildRight() {
    return Container(
      // height: 100,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
            image: NetworkImage(widget.movie.image), fit: BoxFit.cover),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<TypeTicket> typeTickets = widget.movie.typeTickets;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFFCFAF8),
        appBar: AppBar(
          title: const Text('Mes tickets'),
          centerTitle: true,
          titleTextStyle: const TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          backgroundColor: Colors.blue,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () => Navigator.maybePop(context),
          ),
          bottom: TabBar(
            tabs: _buildTabs(typeTickets),
            controller: controller.tabController,
          ),
        ),
        body: PageView(
          children: _buildTabView(typeTickets),
          controller: controller.pageController,
          onPageChanged: (index) {
            controller.selectTabIndex(
                index); // Synchronize the selected index between TabBar and PageView
          },
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.zero,
          width: Get.width,
          height: Get.height * 0.1,
          decoration: const BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(offset: Offset(0, 0), blurRadius: 10, spreadRadius: 0)
          ]),
          child: Center(
            child: Column(
              children: [
                const Text(
                  'Nombre de tickets',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  height: MediaQuery.of(context).size.height * 0.06,
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15)),
                  child: SpinBox(
                    iconSize: 25,
                    textStyle: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                    min: 1,
                    max: 300,
                    value: 1,
                    onChanged: (value) {
                      print(value);
                      // qte.value = value.toInt();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildTabs(List<TypeTicket> typeTickets) {
    final List<Widget> tabs = [];

    typeTickets.forEach((ticket) {
      // Générer une liste de dates entre dateDebut et dateFin pour chaque ticket
      final List<DateTime> dates = [];
      DateTime currentDate = ticket.dateDebut;

      while (currentDate.isBefore(ticket.dateFin) ||
          currentDate.isAtSameMomentAs(ticket.dateFin)) {
        dates.add(currentDate);
        currentDate = currentDate.add(Duration(days: 1));
      }

      // Filtrer les dates pour ne garder que celles d'aujourd'hui jusqu'à dateFin inclus
      final List<DateTime> validDates = dates
          .where((date) =>
              date.isAfter(DateTime.now().subtract(Duration(days: 1))))
          .toList();

      if (validDates.isNotEmpty) {
        // Générer un onglet pour chaque date valide et l'ajouter à la liste des onglets pour ce ticket
        final ticketTabs = validDates
            .map((date) => Tab(
                  text:
                      'Jour ${validDates.indexOf(date) + 1}\n${DateFormat("EEEE, d MMMM").format(date)}',
                ))
            .toList();
        tabs.addAll(ticketTabs);
      } else {
        // Si aucune date valide, générer un onglet avec une indication
        tabs.add(Tab(
          text: 'Aucune date disponible',
        ));
      }
    });

    return tabs;
  }

  List<Widget> _buildTabView(List<TypeTicket> typeTickets) {
    final List<Widget> tabViews = [];

    typeTickets.forEach((ticket) {
      // Générer une liste de dates entre dateDebut et dateFin pour chaque ticket
      final List<DateTime> dates = [];
      DateTime currentDate = ticket.dateDebut;

      while (currentDate.isBefore(ticket.dateFin) ||
          currentDate.isAtSameMomentAs(ticket.dateFin)) {
        dates.add(currentDate);
        currentDate = currentDate.add(Duration(days: 1));
      }

      // Filtrer les dates pour ne garder que celles d'aujourd'hui jusqu'à dateFin inclus
      final List<DateTime> validDates = dates
          .where((date) =>
              date.isAfter(DateTime.now().subtract(Duration(days: 1))))
          .toList();

      if (validDates.isNotEmpty) {
        // Générer la vue associée à chaque date valide
        tabViews.addAll(validDates.map((date) => Column(
              children: [
                const SizedBox(
                  height: 10, 
                ),
                const Text(
                  "Choisissez votre ticket !",
                  style: TextStyle(fontSize: 20, fontFamily: 'Times New Roman'),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: TicketMaterial(
                    colorBackground: Colors.white,
                    height: 150,
                    leftChild: _buildLeft(ticket),
                    rightChild: _buildRight(),
                    tapHandler: () {
                      print('ON TAP');
                      // Vous pouvez naviguer vers une autre page ici si nécessaire
                    },
                  ),
                ),
              ],
            )));
      } else {
        // Si aucune date valide, générer une vue avec une indication
        tabViews.add(Center(
          child: Text('Aucune date disponible pour ce ticket'),
        ));
      }
    });

    return tabViews;
  }
}
