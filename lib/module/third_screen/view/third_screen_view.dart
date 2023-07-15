import 'package:flutter/material.dart';
import '../model/user_model.dart';

class ThirdScreenView extends StatelessWidget {
  final List<User> userList;
  final bool isLoading;

  const ThirdScreenView({
    Key? key,
    required this.userList,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ThirdScreen",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 18.0,
          ),
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: () async {
                userList.clear();
              },
              child: ListView.builder(
                itemCount: userList.length + 1,
                itemBuilder: (context, index) {
                  if (index < userList.length) {
                    final user = userList[index];
                    return ListTile(
                      title: Text('${user.firstName} ${user.lastName}'),
                      subtitle: Text(user.email),
                    );
                  } else {
                    return const SizedBox(height: 80.0);
                  }
                },
              ),
            ),
    );
  }
}
