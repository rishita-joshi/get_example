import 'package:flutter/material.dart';
import 'package:udemy_course_get_api/api/http_config.dart';
import 'package:udemy_course_get_api/model/user_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<List<UserModel>>(
          future: HttpConfig().getUser(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return SizedBox(
                  height: 40,
                  width: 40,
                  child: Center(child: CircularProgressIndicator()));
            }
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData) {
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 30.0,
                                child: Image.network(
                                    snapshot.data![index].avatarUrl.toString()),
                              ),
                              title: Text(snapshot.data![index].id.toString()),
                              subtitle:
                                  Text(snapshot.data![index].nodeId.toString()),
                            ),
                          );
                        }),
                  ),
                ],
              );
            } else {
              return Text(snapshot.error.toString());
            }
          }),
    );
  }
}
