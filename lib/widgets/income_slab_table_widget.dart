import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SlabRateTable extends StatelessWidget {
  const SlabRateTable({
    super.key,
  });
  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     child: Table(
  //       border: TableBorder.all(),
  //       columnWidths: {
  //         0: FixedColumnWidth(34.0),
  //         1: FixedColumnWidth(145.0),
  //         2: FixedColumnWidth(80.0),
  //         3: FixedColumnWidth(70.0),
  //       },
  //       children: [
  //         TableRow(
  //           decoration: BoxDecoration(
  //             color: Colors.grey[300],
  //           ),
  //           children: [
  //             TableCell(
  //               child: Padding(
  //                 padding: EdgeInsets.all(4.0),
  //                 child: Text('S.N'.tr,
  //                     style: TextStyle(fontWeight: FontWeight.bold)),
  //               ),
  //             ),
  //             TableCell(
  //               child: Padding(
  //                 padding: EdgeInsets.all(8.0),
  //                 child: Text('Salary_slab (Single)'.tr,
  //                     style: TextStyle(fontWeight: FontWeight.bold)),
  //               ),
  //             ),
  //             TableCell(
  //               child: Padding(
  //                 padding: EdgeInsets.all(4.0),
  //                 child: Text('rate'.tr,
  //                     style: TextStyle(fontWeight: FontWeight.bold)),
  //               ),
  //             ),
  //             TableCell(
  //               child: Padding(
  //                 padding: EdgeInsets.all(4.0),
  //                 child: Text('taxable_amt'.tr,
  //                     style: TextStyle(fontWeight: FontWeight.bold)),
  //               ),
  //             ),
  //           ],
  //         ),
  //         TableRow(
  //           children: [
  //             TableCell(
  //               child: Padding(
  //                 padding: EdgeInsets.all(4.0),
  //                 child: Text('1'.tr),
  //               ),
  //             ),
  //             TableCell(
  //               child: Padding(
  //                 padding: EdgeInsets.all(4.0),
  //                 child: Text('0_500000'.tr),
  //               ),
  //             ),
  //             TableCell(
  //               child: Padding(
  //                 padding: EdgeInsets.all(4.0),
  //                 child: Text('1_percent'.tr),
  //               ),
  //             ),
  //             TableCell(
  //               child: Padding(
  //                 padding: EdgeInsets.all(4.0),
  //                 child: Text('5,000'.tr),
  //               ),
  //             ),
  //           ],
  //         ),
  //         TableRow(
  //           children: [
  //             TableCell(
  //               child: Padding(
  //                 padding: EdgeInsets.all(4.0),
  //                 child: Text('2'),
  //               ),
  //             ),
  //             TableCell(
  //               child: Padding(
  //                 padding: EdgeInsets.all(4.0),
  //                 child: Text('500000_700000'.tr),
  //               ),
  //             ),
  //             TableCell(
  //               child: Padding(
  //                 padding: EdgeInsets.all(4.0),
  //                 child: Text('10_percent'.tr),
  //               ),
  //             ),
  //             TableCell(
  //               child: Padding(
  //                 padding: EdgeInsets.all(4.0),
  //                 child: Text('20,000'.tr),
  //               ),
  //             ),
  //           ],
  //         ),
  //         TableRow(
  //           children: [
  //             TableCell(
  //               child: Padding(
  //                 padding: EdgeInsets.all(4.0),
  //                 child: Text('3'),
  //               ),
  //             ),
  //             TableCell(
  //               child: Padding(
  //                 padding: EdgeInsets.all(4.0),
  //                 child: Text('700000_1000000'.tr),
  //               ),
  //             ),
  //             TableCell(
  //               child: Padding(
  //                 padding: EdgeInsets.all(4.0),
  //                 child: Text('20_percent'.tr),
  //               ),
  //             ),
  //             TableCell(
  //               child: Padding(
  //                 padding: EdgeInsets.all(4.0),
  //                 child: Text('60,0000'.tr),
  //               ),
  //             ),
  //           ],
  //         ),
  //         TableRow(
  //           children: [
  //             TableCell(
  //               child: Padding(
  //                 padding: EdgeInsets.all(4.0),
  //                 child: Text('4'.tr),
  //               ),
  //             ),
  //             TableCell(
  //               child: Padding(
  //                 padding: EdgeInsets.all(4.0),
  //                 child: Text('1000000_2000000'.tr),
  //               ),
  //             ),
  //             TableCell(
  //               child: Padding(
  //                 padding: EdgeInsets.all(4.0),
  //                 child: Text('30_percent'.tr),
  //               ),
  //             ),
  //             TableCell(
  //               child: Padding(
  //                 padding: EdgeInsets.all(4.0),
  //                 child: Text('3,00,000'.tr),
  //               ),
  //             ),
  //           ],
  //         ),
  //         TableRow(
  //           children: [
  //             TableCell(
  //               child: Padding(
  //                 padding: EdgeInsets.all(4.0),
  //                 child: Text('5'.tr),
  //               ),
  //             ),
  //             TableCell(
  //               child: Padding(
  //                 padding: EdgeInsets.all(4.0),
  //                 child: Text('2000000_5000000'.tr),
  //               ),
  //             ),
  //             TableCell(
  //               child: Padding(
  //                 padding: EdgeInsets.all(4.0),
  //                 child: Text('36_percent(plus 30% : 20% added)'.tr),
  //               ),
  //             ),
  //             TableCell(
  //               child: Padding(
  //                 padding: EdgeInsets.all(4.0),
  //                 child: Text('10,80,000'.tr),
  //               ),
  //             ),
  //           ],
  //         ),
  //         TableRow(
  //           children: [
  //             TableCell(
  //               child: Padding(
  //                 padding: EdgeInsets.all(4.0),
  //                 child: Text('6'.tr),
  //               ),
  //             ),
  //             TableCell(
  //               child: Padding(
  //                 padding: EdgeInsets.all(4.0),
  //                 child: Text('above_5000000'.tr),
  //               ),
  //             ),
  //             TableCell(
  //               child: Padding(
  //                 padding: EdgeInsets.all(4.0),
  //                 child: Text('39_percent(plus 30% : 30% added)'.tr),
  //               ),
  //             ),
  //             TableCell(
  //               child: Padding(
  //                 padding: EdgeInsets.all(4.0),
  //                 child: Text('3,90,0000'.tr),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Table(
        border: TableBorder.all(),
        columnWidths: {
          0: FixedColumnWidth(34.0),
          1: FixedColumnWidth(145.0),
          2: FixedColumnWidth(80.0),
          3: FixedColumnWidth(70.0),
        },
        children: [
          TableRow(
            decoration: BoxDecoration(
              color: Colors.grey[300],
            ),
            children: [
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text('S.N'.tr,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Salary_slab (Married)'.tr,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text('rate'.tr,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text('taxable_amt'.tr,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text('1.'.tr),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text('0_600000'.tr),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text('1_percent'.tr),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text('6,000'.tr),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text('2.'.tr),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text('600000_800000'.tr),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text('10_percent'.tr),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text('20,000'.tr),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text('3.'.tr),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text('800000_1100000'.tr),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text('20_percent'.tr),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text('60,0000'.tr),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text('4.'.tr),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text('1100000_2000000'.tr),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text('30_percent'.tr),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text('2,70,000'.tr),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text('5.'.tr),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text('2000000_5000000'.tr),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text('36_percent(plus 30% : 20% added)'.tr),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text('10,80,000'.tr),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text('6.'.tr),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text('above_5000000'.tr),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text('39_percent(plus 30% : 30% added)'.tr),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text('3,90,0000'.tr),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
