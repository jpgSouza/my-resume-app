import 'package:flutter/material.dart';
import 'package:my_resume_app/constants.dart';
import 'package:my_resume_app/src/views/widgets/form/custom_input_fields.dart';
import 'package:my_resume_app/src/views/widgets/tiles/custom_resume_list.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.only(left: 15.0, right: 5.0),
                height: 36.0,
                margin: EdgeInsets.only(left: 36.0, right: 36.0, top: 45.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6.0,
                          offset: Offset(4, 4))
                    ]),
                child: InputFields(
                  null,
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.search),
                    color: primaryColor,
                    padding: EdgeInsets.zero,
                  ),
                  "Pesquisar...",
                  TextInputType.text,
                  false,
                  Colors.grey[400],
                )),
            SizedBox(
              height: 30.0,
            ),
            ResumeTile(),
          ],
        ),
      ),
    );
  }
}
