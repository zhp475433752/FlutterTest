/// 职业信息统一的item对象
class PDRDEOccupationItem {
  String name; //名称
  String code; //标示
  String? type; //类型
  bool isSelect; //是否选中
  List<PDRDEOccupationItem>? items; //是否还有二级菜单

  PDRDEOccupationItem(
      {required this.name, required this.code, this.type, this.isSelect = false, this.items});

  PDRDEOccupationItem.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        code = json['code'],
        type = json['type'],
        isSelect = json['isSelect'],
        items = (json['items'] as List)
            .map((i) => PDRDEOccupationItem.fromJson((i)))
            .toList();
}
