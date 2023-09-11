import 'package:flutter/material.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';
import 'package:url_launcher/url_launcher.dart';

class Assistance extends StatefulWidget {
  @override
  _AssistanceState createState() => new _AssistanceState();
}

class _AssistanceState extends State<Assistance> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Assistance'),
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
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(
                  height: 0,
                ),
                const Text(
                  'E-cinema',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "E-cinema, votre application mobile pour vous aider dans la recherche de vos salles de cinéma. ",
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(height: 2.0),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Obtener la programmation par jour de vos films préferrés.Payer désormais vos places de cinéma depuis vos smartphones et éviter ainsi les déplacements.",
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Divider(height: 2.0),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Tout devient facile avec, E-cinema.",
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Divider(height: 2.0),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Pour tous problèmes veuiller nous contacter ou laisser un message aux adresses ci-dessous:',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FloatingActionButton.extended(
                        heroTag: 'btn1',
                        extendedPadding: const EdgeInsets.all(20.0),
                        label: const Text(
                          'Whatsapp',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                        icon: const Icon(Icons.message_outlined),
                        backgroundColor: Colors.blue,
                        onPressed: () {
                          /* Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                  return MyApp();
                })); */
                          _lauchWhatsapp();
                        },
                      ),
                      const FloatingActionButton.extended(
                          heroTag: 'btn2',
                          extendedPadding: EdgeInsets.all(30.0),
                          label: Text(
                            'Appeler',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                          icon: Icon(
                            Icons.phone_rounded,
                            color: Colors.white,
                          ),
                          backgroundColor: Colors.blue,
                          onPressed: _makingPhoneCall),
                    ]),
                const SizedBox(
                  height: 10,
                ),
                FloatingActionButton.extended(
                  heroTag: 'btn3',
                  extendedPadding: const EdgeInsets.all(100.0),
                  label: const Text(
                    'Nous contacter sur facebook',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                  icon: const Icon(
                    Icons.facebook_rounded,
                    color: Colors.blue,
                  ),
                  backgroundColor: Colors.white,
                  onPressed: () {
                    _lauchWhatsapp();
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'E-Cinema 1.0.0',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          )),
    );
  }
}

_makingPhoneCall() async {
  const url = 'tel:+22662825040';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_lauchWhatsapp() async {
  final link = WhatsAppUnilink(
      phoneNumber: '+22662825040',
      text:
          "Je vous écrit car j'ai un soucis avec mon compte.Pouvez-vous m'aider à le resoudre s'il vous plait !");
  await launch('$link');
}
