class Repair {
  String vehicleId,
      repairId,
      vOwnerUid,
      mechanicUid,
      addressDescription,
      problemDescription,
      completionStatus,
      location,
      acceptanceStatus,
      supplementaryRepairRequest,
      supRepairRequestStatus,
      paymentStatus,
      dateCreated,

      //Detailed Info
      mechanicsName,
      vOwnerName,
      vehicleModel,
      vehicleName;
  List<String> repairType;

  Repair({
    this.mechanicUid,
    this.acceptanceStatus,
    this.addressDescription,
    this.supRepairRequestStatus,
    this.dateCreated,
    this.completionStatus,
    this.location,
    this.paymentStatus,
    this.problemDescription,
    this.repairType,
    this.supplementaryRepairRequest,
    this.vOwnerUid,
    this.repairId,
    this.vehicleId,
  });


   setVehicleName(String vehicleName) {this.vehicleName = vehicleName ;} 
   setVehicleModel(String vehicleModel) {this.vehicleModel = vehicleModel ;} 
   setVehicleOwnerName(String vehicleOwnerName) {this.vOwnerName = vehicleOwnerName;} 
   setMechanicsName(String mechanicsName) {this.vOwnerName = mechanicsName;} 
}
