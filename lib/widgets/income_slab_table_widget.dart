import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SlabRateTable extends StatelessWidget {
  const SlabRateTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Table(
        border: TableBorder.all(),
        columnWidths: {
          0: FixedColumnWidth(135.0),
          1: FixedColumnWidth(30.0),
          2: FixedColumnWidth(55.0),
          3: FixedColumnWidth(65.0),
        },
        children: [
          TableRow(
            decoration: BoxDecoration(
              color: Colors.grey[300],
            ),
            children: [
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('salary_slab'.tr,
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
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text('tax_at_slab'.tr,
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
                  child: Text('0_500000'.tr),
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
                  child: Text('0.0'.tr),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text('0.00'.tr),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text('500000_700000'.tr),
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
                  child: Text('0'.tr),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text('na'.tr),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text('700000_1000000'.tr),
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
                  child: Text('0'.tr),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text('na'.tr),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text('1000000_2000000'.tr),
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
                  child: Text('0'.tr),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text('na'.tr),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text('2000000_5000000'.tr),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text('36_percent'.tr),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text('0'.tr),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text('na'.tr),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text('above_5000000'.tr),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text('39_percent'.tr),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text('0'.tr),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text('na'.tr),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
