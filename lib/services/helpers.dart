import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;

List<dynamic> createTableFromHTML(var htmlTable) {
  var table = [];
  for (var tr in htmlTable.getElementsByTagName("tr")) {
    var data = tr.getElementsByTagName("span");
    List<String> row = [];
    for (var span in data) {
      row.add(span.text);
    }
    table.add(row);
  }
  return table;
}

Future<dynamic> getTableData() async {
  try {
    String link = "https://sacoronavirus.co.za";
    var response = await http.get(link);
    dom.Document doc = parser.parse(response.body);
    String latestUpdateLink = doc
        .getElementsByClassName('fusion-post-content-wrapper')[0]
        .getElementsByTagName("a")[0]
        .attributes["href"];

    // Get the tables on the update link
    response = await http.get(latestUpdateLink);
    doc = parser.parse(response.body);
    List<dynamic> tables = doc.getElementsByTagName("table");
    List<dynamic> casesTable = createTableFromHTML(tables[0]);
    List<dynamic> overallTable = createTableFromHTML(tables[1]);

    return [
      overallTable.sublist(0, overallTable.length - 1),
      casesTable.sublist(0, casesTable.length - 2)
    ];
  } catch (e) {
    print(e.toString());
  }
}

List<dynamic> createProvinceStatTable(overallTable) {
  return [];
}
