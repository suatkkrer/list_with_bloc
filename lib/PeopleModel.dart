class People{
  String kisi_id;
  String kisi_ad;
  String kisi_tel;

  People(this.kisi_id, this.kisi_ad, this.kisi_tel);

  factory People.fromJson(Map<String,dynamic> json){
    return People(json["kisi_id"] as String, json["kisi_ad"] as String, json["kisi_tel"] as String);
  }

}