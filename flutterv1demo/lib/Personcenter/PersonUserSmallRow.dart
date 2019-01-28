import 'package:flutter/material.dart';

class PersonUserSmallRow extends StatefulWidget {

  PersonUserSmallRow(this.title, this.smallicon);
  
  final String title;
  final Icon smallicon;

  @override
  PersonUserSmallRowState createState() {
    return new PersonUserSmallRowState();
  }
}

class PersonUserSmallRowState extends State<PersonUserSmallRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
                    padding: EdgeInsets.only(top: 8,left: 15),
                    child: Row(
                      children: <Widget>[
                        widget.smallicon,
                        Padding(
                          padding: EdgeInsets.only(left:20),
                          child: Text(
                          '${widget.title}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                        ),),
                        )
                      ],
                    ),
                  );
  }
}