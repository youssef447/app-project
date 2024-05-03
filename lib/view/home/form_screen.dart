import 'package:app_project/Model/models/model.dart';
import 'package:app_project/Model/repos/crud_repo.dart';
import 'package:app_project/config/dependencies/injection.dart';
import 'package:app_project/config/extensions/extensions.dart';
import 'package:app_project/core/utils/default_dialog.dart';
import 'package:app_project/view/widgets/default_button.dart';
import 'package:app_project/view/widgets/default_form_field.dart';
import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  final bool? edit;
  final Model? model;
  final String? id;
  const FormScreen({super.key, this.edit, this.model, this.id});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  late TextEditingController personName;
  late TextEditingController nationality;

  late TextEditingController age;

  late String birthDate;
  DateTime? birthDatePicker;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    personName = widget.edit ?? false
        ? TextEditingController(text: widget.model!.name)
        : TextEditingController();

    nationality = widget.edit ?? false
        ? TextEditingController(text: widget.model!.nationality)
        : TextEditingController();
    age = widget.edit ?? false
        ? TextEditingController(text: widget.model!.age)
        : TextEditingController();
    birthDate = widget.edit ?? false
        ? widget.model!.birthDate.toString()
        : 'Birth Date';
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Home',
            style: context.textTheme.titleLarge,
          ),
          actions: [
            IconButton(
                onPressed: () {
                  context.goTo(
                    route: '/dataScreen',
                  );
                },
                icon: const Icon(
                  Icons.home,
                )),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DefaultFormField(
              controller: personName,
              context: context,
              hintText: 'name',
            ),
            DefaultFormField(
              controller: age,
              context: context,
              type: TextInputType.number,
              hintText: 'age',
            ),
            DefaultFormField(
              controller: nationality,
              context: context,
              hintText: 'nationality',
            ),
            GestureDetector(
              onTap: () async {
                birthDatePicker = await showDatePicker(
                    context: context,
                    fieldHintText: 'Birth date',
                    firstDate: DateTime(2000),
                    lastDate: DateTime.now());
                if (birthDatePicker != null) {
                  setState(() {
                    birthDate = birthDatePicker.toString();
                  });
                }
              },
              child: Text(
                birthDate,
                style: context.textTheme.titleMedium,
              ),
            ),
            DefaultButton(
              child: Text(widget.edit ?? false ? 'update' : 'Add'),
              onClicked: () async {
                Model data = Model(
                  age: age.text,
                  birthDate: birthDatePicker!,
                  name: personName.text,
                  nationality: nationality.text,
                );

                try {
                  widget.edit ?? false
                      ? locators
                          .get<CrudRepo>()
                          .update(id: widget.id!, model: data)
                      : await locators.get<CrudRepo>().add(model: data);
                  if (context.mounted) {
                    AwesomeDialogUtil.sucess(
                        context: context,
                        body: Text(
                          'Data Added',
                          style: context.textTheme.titleMedium!
                              .copyWith(color: Colors.black),
                        ),
                        title: 'Success');
                  }
                } catch (e) {
                  if (context.mounted) {
                    AwesomeDialogUtil.error(
                        context: context, body: e.toString(), title: 'Failed');
                  }
                }
              },
            ),
          ],
        ));
  }
}
