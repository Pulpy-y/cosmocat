import 'package:cosmocat/constant.dart';
import 'package:cosmocat/count_down/count_down_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tags/flutter_tags.dart';
import '../size_config.dart';

class TimePicker extends StatefulWidget {
  //final Size size;
  //TimePicker(this.size);

  @override
  _TimePickerState createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  double defaultSize = SizeConfig.defaultSize!;
  int hour = 0;
  int minute = 0;
  //Size size;
  List tags = [];

  //_TimePickerState(this.size);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: defaultSize,
          horizontal: defaultSize * 1.6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    child: Text(
                      "Pick a time",
                      style: TextStyle(
                          fontSize: defaultSize * 2.2, //22
                          color: Colors.white
                      ),
                      textAlign: TextAlign.left,
                    ),
                  margin: EdgeInsets.all(defaultSize * 1.8) // 18
                ),
                Card(
                  // input time
                    color: themeSecondaryColor,
                    child: Padding(
                        padding: EdgeInsets.all(defaultSize * 1.6), //16
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: defaultSize * 15,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ], //only numbers can be entered
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Hours',
                                    fillColor: Colors.white),
                                onChanged: (value) {
                                  if (value == "") hour = 0;
                                  hour = int.parse(value.trim());
                                },
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.all(defaultSize * 1.8),
                                child: Text(
                                  ":",
                                  style: TextStyle(fontSize: defaultSize * 2),
                                )),
                            Container(
                              width: defaultSize * 15,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ], //only numbers can be entered
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Minutes',
                                    fillColor: Colors.white),
                                onChanged: (value) {
                                  if (value == "") minute = 0;
                                  minute = int.parse(value.trim());
                                },
                              ),
                            ),
                          ],
                        ))),
                Container(
                    child: Text(
                      "Tag",
                      style: TextStyle(
                          fontSize: defaultSize * 2.2, //22
                          color: Colors.white
                      ),
                      textAlign: TextAlign.left,
                    ),
                    margin: EdgeInsets.fromLTRB(
                        defaultSize * 1.8, defaultSize *1.8,
                        defaultSize * 1.8, 0) // 18
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(
                      vertical: defaultSize*0.5,
                      horizontal: defaultSize * 1.6),
                  child: Tags(
                    itemCount: tags.length,
                    columns: 6,
                    textField: TagsTextField(
                        textStyle: TextStyle(fontSize:14),
                        onSubmitted: (string) {
                          setState(() {
                            tags.add(Item(title: string));
                          });
                        }
                    ),
                    itemBuilder: (index) {
                      final Item currentItem = tags[index];

                      return ItemTags(
                        index: index,
                        title: currentItem.title!,
                        customData: currentItem.customData,
                        combine: ItemTagsCombine.withTextBefore,
                        removeButton: ItemTagsRemoveButton(
                            onRemoved: (){
                              setState(() {
                                tags.remove(index);
                              });
                              return true;
                            }
                        ),
                      );
                    },
                  ),
                ),
              ]
          ),
          SizedBox(
            height: 10,
          ),
          TextButton(
            child: Text(
                "Focus Now",
                style: TextStyle(
                    fontSize: defaultSize * 2,
                    fontWeight: FontWeight.bold,
                color: Colors.white)),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => CountDown(
                        hour: hour,
                        minute: minute,
                      )));
            },
            style: TextButton.styleFrom(
                primary: primaryColor,
                backgroundColor: primaryColor,
                shadowColor: themeSecondaryColor,
                elevation: 10,
                padding: EdgeInsets.fromLTRB(defaultSize * 5, defaultSize * 1.2,
                    defaultSize * 5, defaultSize * 1.2),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(defaultSize * 3.6), //36
                    side: BorderSide(color: Colors.white))),
          )
        ],
      ),
    );
  }
}
