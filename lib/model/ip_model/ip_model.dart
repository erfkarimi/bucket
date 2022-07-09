class IpApiModel{
   String? ipAddress;
   String? countryCode;
   String? countryName;
   String? timeZone;
   String? cityName;
   String? regionName;
   String? zipCode;

  IpApiModel({
     this.ipAddress,
     this.countryCode,
     this.countryName,
     this.timeZone,
     this.cityName,
     this.regionName,
     this.zipCode
});

  IpApiModel.fromJson(Map<String, dynamic> json):
    ipAddress = json["ipAddress"],
    countryCode = json["countryCode"],
    countryName = json["countryName"],
    timeZone = json["timeZone"],
    cityName = json["cityName"],
    regionName = json["regionName"],
    zipCode = json["zipCode"];

}