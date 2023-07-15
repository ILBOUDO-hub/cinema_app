import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> categories = [
    'Action',
    'Aventure',
    'Comédie',
    'Drame',
    'Horreur',
    'Romance',
    'Science-fiction',
    'Animation',
    'Famille',
    'Mystère',
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: const Text(
          'E-cinema',
        ),
        centerTitle: false,
        titleTextStyle: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        backgroundColor: Colors.blue,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: const Icon(
                Icons.store,
                size: 35,
              ),
              onPressed: () {
                /*Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                      return Cinema();
                  }));*/
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 0),
              child: Container(
                height: 50,
                margin: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(10.0),
                    bottom: Radius.circular(10.0),
                  ),
                  color: Color.fromARGB(255, 224, 223, 223),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        //controller: _searchController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          border: InputBorder.none,
                          hintText: 'Rechercher',
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 12.0,
                            horizontal: 8.0,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.filter_list,
                        // size: 35,
                      ),
                      onPressed: () {
                        //_showDropdown(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                children: [
                  Row(
                    children: List.generate(
                      categories.length,
                      (index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 8),
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          decoration: BoxDecoration(
                            color: selectedIndex == index
                                ? Colors.blue
                                : const Color.fromARGB(255, 223, 223, 223),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            categories[index],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Color.fromARGB(255, 230, 230, 230),
                      ),
                      width: 300,
                      //  height: 400,

                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 280,
                            height: 400,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/adam.jfif'),
                                    fit: BoxFit.cover)),
                          ),
                          Container(
                            width: 290,
                            height: 50,
                            // color: Colors.amber,
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                        size: 20,
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        '4.5',
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.grey.shade600),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.access_time,
                                        color: Colors.grey.shade600,
                                        size: 20,
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        '2h',
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.grey.shade600),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.play_circle_filled,
                                        color: Colors.grey.shade600,
                                        size: 20,
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        'Trailer',
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.grey.shade600),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Color.fromARGB(255, 230, 230, 230),
                      ),
                      width: 300,
                      //  height: 400,

                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 280,
                            height: 400,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/asterix.jfif'),
                                    fit: BoxFit.cover)),
                          ),
                          Container(
                            width: 290,
                            height: 50,
                            // color: Colors.amber,
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                        size: 20,
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        '4.5',
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.grey.shade600),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.access_time,
                                        color: Colors.grey.shade600,
                                        size: 20,
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        '2h',
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.grey.shade600),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.play_circle_filled,
                                        color: Colors.grey.shade600,
                                        size: 20,
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        'Trailer',
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.grey.shade600),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Color.fromARGB(255, 230, 230, 230),
                      ),
                      width: 300,
                      //  height: 400,

                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 280,
                            height: 400,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/panther.jfif'),
                                    fit: BoxFit.cover)),
                          ),
                          Container(
                            width: 290,
                            height: 50,
                            // color: Colors.amber,
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                        size: 20,
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        '4.5',
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.grey.shade600),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.access_time,
                                        color: Colors.grey.shade600,
                                        size: 20,
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        '2h',
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.grey.shade600),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.play_circle_filled,
                                        color: Colors.grey.shade600,
                                        size: 20,
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        'Trailer',
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.grey.shade600),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
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
}
