import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class searchCity extends StatefulWidget {
  @override
  _searchCityState createState() => _searchCityState();
}

class _searchCityState extends State<searchCity> {
  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            highlightColor: Colors.transparent,
            splashRadius: 25.0,
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          padding: EdgeInsets.only(left: 35.0, right: 35.0),
          child: Column(
            children: [
              TextField(
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(
                    Icons.place,
                    color: Colors.grey,
                  ),
                  hintText: "City Name",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: (value) {
                  cityName = value;
                },
              ),
              SizedBox(
                height: 35.0,
              ),
              Container(
                height: 50.0,
                width: double.infinity,
                child: ElevatedButton(
                  child: Text(
                    'Search',
                    style: GoogleFonts.comfortaa(
                        fontSize: 25.0, color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.pop(context, cityName);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color?>(
                      Colors.purple[400],
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)
                      )
                    )
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
