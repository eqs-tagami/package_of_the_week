/// Package imports
import 'package:flutter/material.dart';

/// Barcode import
// ignore: depend_on_referenced_packages
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

/// Local import
import '../../../model/sample_view.dart';
import 'datagridsource/orderinfo_datagridsource.dart';
import 'model/orderinfo.dart';

/// Renders datagrid with selection option(single/multiple and select/unselect)
class RTLModeDataGrid extends DirectionalitySampleView {
  /// Creates datagrid with selection option(single/multiple and select/unselect)
  const RTLModeDataGrid({Key? key}) : super(key: key);

  @override
  _SelectionDataGridPageState createState() => _SelectionDataGridPageState();
}

class _SelectionDataGridPageState extends DirectionalitySampleViewState {
  /// Determine to decide whether the device in landscape or in portrait.
  bool isLandscapeInMobileView = false;

  /// DataGridSource required for SfDataGrid to obtain the row data.
  late OrderInfoDataGridSource _rtlDataGridSource;

  late bool isWebOrDesktop;

  late String _customerName, _price, _orderID, _customerID, _freight, _city;

  @override
  void initState() {
    super.initState();
    isWebOrDesktop = model.isWeb || model.isDesktop;
  }

  List<GridColumn> getColumns() {
    List<GridColumn> columns;

    columns = isWebOrDesktop
        ? <GridColumn>[
            GridColumn(
              width: (isWebOrDesktop && model.isMobileResolution)
                  ? 120.0
                  : double.nan,
              columnName: 'id',
              label: Container(
                padding: const EdgeInsets.all(8),
                alignment: Alignment.centerRight,
                child: Text(
                  _orderID,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            GridColumn(
              width: (isWebOrDesktop && model.isMobileResolution)
                  ? 150.0
                  : double.nan,
              columnName: 'customerId',
              label: Container(
                padding: const EdgeInsets.all(8),
                alignment: Alignment.centerRight,
                child: Text(
                  _customerID,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            GridColumn(
              width: (isWebOrDesktop && model.isMobileResolution)
                  ? 120.0
                  : double.nan,
              columnName: 'name',
              label: Container(
                padding: const EdgeInsets.all(8),
                alignment: Alignment.centerLeft,
                child: Text(
                  _customerName,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            GridColumn(
              width: (isWebOrDesktop && model.isMobileResolution)
                  ? 110.0
                  : double.nan,
              columnName: 'freight',
              label: Container(
                padding: const EdgeInsets.all(8),
                alignment: Alignment.centerRight,
                child: Text(
                  _freight,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            GridColumn(
              width: (isWebOrDesktop && model.isMobileResolution)
                  ? 120.0
                  : double.nan,
              columnName: 'city',
              label: Container(
                padding: const EdgeInsets.all(8),
                alignment: Alignment.centerLeft,
                child: Text(
                  _city,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            GridColumn(
                width: (isWebOrDesktop && model.isMobileResolution)
                    ? 120.0
                    : double.nan,
                columnName: 'price',
                label: Container(
                  padding: const EdgeInsets.all(8),
                  alignment: Alignment.centerRight,
                  child: Text(
                    _price,
                    overflow: TextOverflow.ellipsis,
                  ),
                ))
          ]
        : <GridColumn>[
            GridColumn(
              columnName: 'id',
              label: Container(
                padding: const EdgeInsets.all(8),
                alignment: Alignment.centerRight,
                child: Text(
                  _orderID,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            GridColumn(
              columnName: 'customerId',
              width: 110,
              label: Container(
                padding: const EdgeInsets.all(8),
                alignment: Alignment.centerRight,
                child: Text(
                  _customerID,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            GridColumn(
              columnName: 'name',
              label: Container(
                padding: const EdgeInsets.all(8),
                alignment: Alignment.centerLeft,
                child: Text(
                  _customerName,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            GridColumn(
                columnName: 'city',
                label: Container(
                  padding: const EdgeInsets.all(8),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    _city,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                columnWidthMode: ColumnWidthMode.lastColumnFill),
          ];
    return columns;
  }

  SfDataGrid _buildDataGrid() {
    return SfDataGrid(
      columnWidthMode: isWebOrDesktop || isLandscapeInMobileView
          ? ColumnWidthMode.fill
          : ColumnWidthMode.none,
      source: _rtlDataGridSource,
      isScrollbarAlwaysShown: true,
      columns: getColumns(),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    isLandscapeInMobileView = !isWebOrDesktop &&
        MediaQuery.of(context).orientation == Orientation.landscape;
  }

  @override
  Widget buildSample(BuildContext context) {
    _loadDataGridSource();
    return _buildDataGrid();
  }

  void _loadDataGridSource() {
    final String selectedLangauge = model.locale.toString();
    switch (selectedLangauge) {
      case 'en_US':
        _customerName = 'Name';
        _customerID = 'Customer ID';
        _orderID = 'Order ID';
        _price = 'Price';
        _city = 'City';
        _freight = 'Freight';
        _rtlDataGridSource = OrderInfoDataGridSource(
            isWebOrDesktop: isWebOrDesktop,
            ordersCollection: getEnglishOrders());
        break;
      case 'ar_AE':
        _customerName = '??????';
        _customerID = '???????? ????????????';
        _orderID = '?????? ??????????';
        _price = '??????????';
        _city = '??????????';
        _freight = '??????';
        _rtlDataGridSource = OrderInfoDataGridSource(
            isWebOrDesktop: isWebOrDesktop,
            ordersCollection: getArabicOrders());
    }
  }

  List<OrderInfo> getArabicOrders() {
    return [
      OrderInfo(1000, 1700, '????????', 1270, '????????', 1569),
      OrderInfo(1001, 1701, '????????', 1570, '????????', 1559),
      OrderInfo(1002, 1702, '????????', 1370, '??????', 1599),
      OrderInfo(1003, 1703, '????????', 1560, '??????????', 1549),
      OrderInfo(1004, 1704, '????????', 1670, '??????????', 1562),
      OrderInfo(1005, 1705, '????????????', 1890, '????????????????', 1581),
      OrderInfo(1006, 1706, '????????', 2860, '??????????', 1533),
      OrderInfo(1007, 1707, '??????????', 3780, '????????????????', 1538),
      OrderInfo(1008, 1708, '??????????????', 1200, '?????? ??????????????????', 1541),
      OrderInfo(1009, 1709, '????????', 1680, '??????????', 1522),
      OrderInfo(1010, 1710, '??????????', 1470, '??????????????', 1512),
      OrderInfo(1011, 1711, '??????????', 2370, '??????????', 1518),
      OrderInfo(1012, 1712, '??????????????', 4470, '????????????', 1528),
      OrderInfo(1013, 1713, '????????????', 1770, '??????', 1532),
      OrderInfo(1014, 1714, '????????????', 6760, '??????????', 1511),
      OrderInfo(1015, 1715, '??????????', 4770, '????????????????????', 1505),
      OrderInfo(1016, 1716, '????????????', 3070, '??????????????', 1503),
      OrderInfo(1017, 1717, '??????????', 4970, '??????????????', 1577),
      OrderInfo(1018, 1718, '????????????', 60770, '??????????????', 1572),
      OrderInfo(1019, 1719, '??????????', 3330, '????????????', 1579),
      OrderInfo(1020, 1720, '??????????', 2900, '????????????????', 1555),
      OrderInfo(1021, 1721, '??????????', 1850, '??????????', 1556),
      OrderInfo(1022, 1722, '????????', 4580, ' ????????????', 1524),
      OrderInfo(1023, 1723, '??????????', 3970, '??????????????', 1540),
      OrderInfo(1024, 1724, '??????????', 1040, '????????????', 1501),
      OrderInfo(1025, 1725, '????????', 1130, '??????????', 1598),
      OrderInfo(1026, 1726, '??????????', 8970, '????????????????', 1592),
      OrderInfo(1027, 1727, '??????????????????', 5900, '??????????????', 1580),
      OrderInfo(1028, 1728, '????????', 4390, '????????????????', 1570),
      OrderInfo(1029, 1729, '??????????', 2910, '??????????????', 1560),
    ];
  }

  List<OrderInfo> getEnglishOrders() {
    return [
      OrderInfo(1000, 1700, 'Picco', 1270, 'London', 1569),
      OrderInfo(1001, 1701, 'Keefe', 1570, 'Boise', 1559),
      OrderInfo(1002, 1702, 'Ellis', 1370, 'Butte', 1599),
      OrderInfo(1003, 1703, 'Mendoza', 1560, 'Elgin', 1549),
      OrderInfo(1004, 1704, 'Rooney', 1670, 'Eugene', 1562),
      OrderInfo(1005, 1705, 'Landry', 1890, 'Kirkland', 1581),
      OrderInfo(1006, 1706, 'Perry', 2860, 'Lander', 1533),
      OrderInfo(1007, 1707, 'Perez', 3780, 'Portland', 1538),
      OrderInfo(1008, 1708, 'Newberry', 1200, 'San Francisco', 1541),
      OrderInfo(1009, 1709, 'Betts', 1680, 'Seattle', 1522),
      OrderInfo(1010, 1710, 'Owens', 1470, 'Barcelona', 1512),
      OrderInfo(1011, 1711, 'Thomas', 2370, 'Madrid', 1518),
      OrderInfo(1012, 1712, 'Jefferson', 4470, 'Bilboa', 1528),
      OrderInfo(1013, 1713, 'Vargas', 1770, 'Aachen', 1532),
      OrderInfo(1014, 1714, 'Grimes', 6760, 'Berlin', 1511),
      OrderInfo(1015, 1715, 'Stark', 4770, 'Brandenburg', 1505),
      OrderInfo(1016, 1716, 'Crowley', 3070, 'Cunewalde', 1503),
      OrderInfo(1017, 1717, 'Volco', 4970, 'Leipzig', 1577),
      OrderInfo(1018, 1718, 'Irvine', 60770, 'Mannheim', 1572),
      OrderInfo(1019, 1719, 'Folig', 3330, 'M??nster', 1579),
      OrderInfo(1020, 1720, 'Waddell', 2900, 'Albuquerque', 1555),
      OrderInfo(1021, 1721, 'Frans', 1850, 'Paris', 1556),
      OrderInfo(1022, 1722, 'Warth', 4580, 'Bruxelles', 1524),
      OrderInfo(1023, 1723, 'Linod', 3970, 'Rosario', 1540),
      OrderInfo(1024, 1724, 'Simop', 1040, 'Recife', 1501),
      OrderInfo(1025, 1725, 'Merep', 1130, 'Graz', 1598),
      OrderInfo(1026, 1726, 'Riscu', 8970, 'Montreal', 1592),
      OrderInfo(1027, 1727, 'Seves', 5900, 'Tsawassen', 1580),
      OrderInfo(1028, 1728, 'Vaffe', 4390, 'Campinas', 1570),
      OrderInfo(1029, 1729, 'Alfki', 2910, 'Resende', 1560),
    ];
  }
}
