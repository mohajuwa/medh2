// ID  -- >    2040680
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medh/Theme/theme.dart';
import 'package:medh/provider.dart';
import 'package:mysql1/mysql1.dart';

import '../FUSER/Fuser_widgets/fuser_navbar_roots.dart';
import '../NUSER/Nuser_widgets/navbar_roots.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends ConsumerState<HomePage> {
  // var db = Mysql();
  // var users = '';

  // void _getUsers() {
  //   db.getConnection().then((conn) {
  //     String sql = 'SELECT * FROM medh2.users ';
  //     conn.query(sql).then((results) {
  //       for (var row in results) {
  //         setState(() {
  //           users = row[0];
  //         });
  //       }
  //     });
  //   });
  // }

  List<Map<String, dynamic>> _users = [];

  @override
  void initState() {
    setState(() {});
    _getUsers();
  }

  Future<void> _getUsers() async {
    var settings = ConnectionSettings(
        host: '10.0.2.2',
        port: 3306,
        user: 'root',
        password: 'modwir',
        db: 'medh2');

    var conn = await MySqlConnection.connect(settings);

    var results = await conn.query('SELECT * FROM medh2.users');

    List<Map<String, dynamic>> users = [];

    for (var row in results) {
      users.add({
        "id": row["id"],
        "userEmail": row["userEmail"],
        "userName": row["userName"],
      });
    }

    setState(() {
      _users = users;
    });

    await conn.close();
  }

  @override
  Widget build(BuildContext context) {
    double? scrolledUnderElevation;

    return _users.isNotEmpty
        ? MaterialApp(
            theme: getAppTheme(
              context,
              ref.watch(appThemeProvider),
            ),
            debugShowCheckedModeBanner: false,
            home: Directionality(
              textDirection: TextDirection.rtl,
              child: Scaffold(
                appBar: AppBar(
                  toolbarHeight: 65,
                  scrolledUnderElevation: scrolledUnderElevation,
                  title: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        // userName
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text(
                                'الباحث الدوائي',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '  شفت!؟',
                              style: Theme.of(context).textTheme.titleLarge,
                            )
                          ],
                        ),

                        // profile pic
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: colors(context).color4,
                                borderRadius: BorderRadius.circular(18),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0x5C130F0F),
                                    blurRadius: 1.5,
                                    spreadRadius: 1,
                                  )
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(3),
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: const CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      radius: 15,
                                      backgroundImage:
                                          AssetImage("assets/images/Logo.png"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                body: Padding(
                  padding: const EdgeInsets.all(20),
                  child: ListView(
                    children: [
                      Column(
                        children: [
                          //app bar777777777777777777777777
                          const SizedBox(height: 100),

                          // card -> F User Log in
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: colors(context).color4,
                                borderRadius: BorderRadius.circular(18),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0x47000000),
                                    blurRadius: 1.5,
                                    spreadRadius: 1,
                                  )
                                ],
                              ),
                              height: 200,
                              width: 350,
                              child: Row(children: [
                                // Animation  or Cute Picture
                                SizedBox(
                                  height: 150,
                                  width: 150,
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image.asset(
                                          'assets/stickers/stic1.png',
                                          height: 150,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                const SizedBox(
                                  width: 40,
                                ),

                                // how do u feel
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _users.single.entries.last.value,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: colors(context).color5,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      const Text(
                                        'تفضل من هنا ',
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          color: colors(context).color1,
                                          borderRadius:
                                              BorderRadius.circular(18),
                                        ),
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const FuserNavBarRoots(), // ID  -- >        2040712
                                              ),
                                            );
                                          },
                                          child: const Center(
                                            child: Text(
                                              'البدء',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ]),
                            ),
                          ),
                          const SizedBox(height: 120),

                          // card -> N User Log in
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: colors(context).color4,
                                borderRadius: BorderRadius.circular(18),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0x47000000),
                                    blurRadius: 1.5,
                                    spreadRadius: 1,
                                  )
                                ],
                              ),
                              height: 200,
                              width: 350,
                              child: Row(children: [
                                // Animation  or Cute Picture
                                SizedBox(
                                  height: 150,
                                  width: 150,
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image.asset(
                                          'assets/images/icon.png',
                                          height: 150,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                const SizedBox(
                                  width: 40,
                                ),

                                // how do u feel
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'تدور علاج؟',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      const Text(
                                        'تفضل من هنا ',
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          color: colors(context).color1,
                                          borderRadius:
                                              BorderRadius.circular(18),
                                        ),
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const NavBarRoots(), // ID  -- >    2040681
                                              ),
                                            );
                                          },
                                          child: const Center(
                                            child: Text(
                                              'البدء',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ]),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        : MaterialApp(
            theme: getAppTheme(
              context,
              ref.watch(appThemeProvider),
            ),
            debugShowCheckedModeBanner: false,
            home: Directionality(
              textDirection: TextDirection.rtl,
              child: Scaffold(
                body: Center(
                  child: Column(
                    children: <Widget>[
                      ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: _users.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 300, right: 60),
                            child: SingleChildScrollView(
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              child: ListTile(
                                title: Text(
                                  _users[index]['userName'],
                                  style: TextStyle(
                                      fontSize: 40,
                                      color: colors(context).color1),
                                ),
                                subtitle: Text(
                                  _users[index]['userEmail'],
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: colors(context).color2,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
