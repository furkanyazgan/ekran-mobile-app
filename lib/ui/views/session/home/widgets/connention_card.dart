import 'package:ekran/constants/asset_paths.dart';
import 'package:ekran/core/services/test/test_service.dart';
import 'package:ekran/ui/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ConnectionCard extends StatefulWidget {
    ConnectionCard({Key? key, required this.connectionModel}) : super(key: key);
 ConnectionModel connectionModel;
  @override
  State<ConnectionCard> createState() => _ConnectionCardState();
}

class _ConnectionCardState extends State<ConnectionCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.symmetric(horizontal: 38.0),
      child: CustomCard(
          imagePath: widget.connectionModel.imagePath,
          matchRate: 43,
          gender: widget.connectionModel.gender,
          universityName: "Bilkent University",
          name: widget.connectionModel.name,
          age: widget.connectionModel.age,
          isOnline: true,
          city: "city",
          country: "country"),
    );
  }
}
