import 'package:app_project/Model/repos/crud_repo.dart';
import 'package:app_project/config/dependencies/injection.dart';
import 'package:app_project/config/extensions/extensions.dart';
import 'package:app_project/view/home/form_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:slideable/slideable.dart';
import '../../Model/models/model.dart';
import '../widgets/indicator_loading.dart';

class DataScreen extends StatelessWidget {
  const DataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: locators.get<CrudRepo>().read(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child:  IndicatorBlurLoading());
          }
        else  if (snapshot.hasError) {
            return Center(
              child: Text(
                'Err getting data',
                style: context.textTheme.titleMedium,
              ),
            );
          } else if (!snapshot.hasData) {
            return Center(
                child: Text(
              'No data',
              style: context.textTheme.titleMedium,
            ));
          } else {
            print('data :${snapshot.data!.docs[0].data()}');
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                Model model = Model.fromJson(snapshot.data!.docs[index].data());

                return Slideable(
                  items: [
                    ActionItems(
                      icon: const Icon(
                        Icons.edit,
                      ),
                      onPress: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return FormScreen(
                              id: snapshot.data!.docs[index].id,
                              edit: true,
                              model: model,
                            );
                          },
                        );
                      },
                    ),
                  ],
                  child: ListTile(
                    title: Text(
                      model.name,
                      style: context.textTheme.titleMedium,
                    ),
                    subtitle: Text(
                      model.age,
                      style: context.textTheme.titleMedium,
                    ),
                    trailing: Column(
                      children: [
                        Text(
                          model.nationality,
                          style: context.textTheme.titleMedium,
                        ),
                        Text(
                          (DateFormat('dd/m/y :h:mm').format(model.birthDate)),
                          style: context.textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
