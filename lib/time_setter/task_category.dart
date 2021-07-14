import 'package:cosmocat/Login/log_in.dart';
import 'package:cosmocat/time_setter/page_variable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tags/flutter_tags.dart';

import '../database.dart';
import '../size_config.dart';

class TaskCategory extends StatefulWidget {
  TaskCategory({Key? key}) : super(key: key);

  @override
  _TaskCategoryState createState() => _TaskCategoryState();
}

class _TaskCategoryState extends State<TaskCategory> {
  double defaultSize = SizeConfig.defaultSize!;
  List tags = [];

  initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            EdgeInsets.fromLTRB(defaultSize * 1.6, 0, defaultSize * 1.6, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                child: Text(
                  "Task Category",
                  style: TextStyle(
                      fontSize: defaultSize * 2.2,
                      fontWeight: FontWeight.bold, //22
                      color: Colors.white),
                  textAlign: TextAlign.left,
                ),
                margin: EdgeInsets.fromLTRB(defaultSize * 1.8,
                    defaultSize * 1.8, defaultSize * 1.8, 0) // 18
                ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: defaultSize * 0.5, horizontal: defaultSize * 1.6),
              child: Tags(
                itemCount: tags.length,
                columns: 6,
                textField: TagsTextField(
                    textStyle: TextStyle(fontSize: 14),
                    onSubmitted: (string) {
                      setState(() {
                        DatabaseService().addTag(string);
                        tags.add(Item(title: string));
                      });
                    }),
                itemBuilder: (index) {
                  final Item currentItem = tags[index];
                  return ItemTags(
                    pressEnabled: selectedTag == 'noTagNow' ||
                            selectedTag == currentItem.title
                        ? true
                        : false,
                    index: index,
                    title: currentItem.title!,
                    customData: currentItem.customData,
                    combine: ItemTagsCombine.withTextBefore,
                    removeButton: ItemTagsRemoveButton(onRemoved: () {
                      DatabaseService().removeTag(currentItem.title!);
                      setState(() {
                        tags.remove(currentItem);
                      });
                      return true;
                    }),
                    onPressed: (item) {
                      setState(() {
                        selectedTag == item.title
                            ? selectedTag = "noTagNow"
                            : selectedTag = item.title;
                        print("Selected tag: $selectedTag");
                        selected = !selected;
                        print("Selected? $selected");
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ));
  }

  Future<void> getData() async {
    tags = await DatabaseService().getTags(user!.uid);
  }
}
