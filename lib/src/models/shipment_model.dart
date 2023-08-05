enum ShipmentStatus { all, inProgress, pendingOrder, loading, cancelled }

class ShipmentModel {
  final ShipmentStatus shipmentStatus;
  final num amount;
  final String title;
  final String message;
  final String date;

  ShipmentModel(
      {required this.shipmentStatus,
      required this.amount,
      required this.title,
      required this.message,
      required this.date});
}

List<ShipmentModel> get shipmentList => <ShipmentModel>[
      ShipmentModel(
          shipmentStatus: ShipmentStatus.inProgress,
          amount: 1400,
          title: "Arriving today!",
          message: "Your delivery #NEJ20089934122231 from Oshodi-Lagos is arriving today",
          date: "Sep 20,2023"),
      ShipmentModel(
          shipmentStatus: ShipmentStatus.pendingOrder,
          amount: 650,
          title: "Arriving today!",
          message: "Your delivery #NEJ20089934122231 from Oshodi-Lagos is arriving today",
          date: "Sep 20,2023"),
      ShipmentModel(
          shipmentStatus: ShipmentStatus.pendingOrder,
          amount: 650,
          title: "Arriving today!",
          message: "Your delivery #NEJ20089934122231 from Oshodi-Lagos is arriving today",
          date: "Sep 20,2023"),
      ShipmentModel(
          shipmentStatus: ShipmentStatus.loading,
          amount: 230,
          title: "Arriving today!",
          message: "Your delivery #NEJ20089934122231 from Oshodi-Lagos is arriving today",
          date: "Sep 20,2023"),
      ShipmentModel(
          shipmentStatus: ShipmentStatus.loading,
          amount: 230,
          title: "Arriving today!",
          message: "Your delivery #NEJ20089934122231 from Oshodi-Lagos is arriving today",
          date: "Sep 20,2023"),
      ShipmentModel(
          shipmentStatus: ShipmentStatus.inProgress,
          amount: 1400,
          title: "Arriving today!",
          message: "Your delivery #NEJ20089934122231 from Oshodi-Lagos is arriving today",
          date: "Sep 20,2023"),
      ShipmentModel(
          shipmentStatus: ShipmentStatus.inProgress,
          amount: 370,
          title: "Arriving today!",
          message: "Your delivery #NEJ20089934122231 from Oshodi-Lagos is arriving today",
          date: "Sep 20,2023"),
      ShipmentModel(
          shipmentStatus: ShipmentStatus.inProgress,
          amount: 3570,
          title: "Arriving today!",
          message: "Your delivery #NEJ20089934122231 from Oshodi-Lagos is arriving today",
          date: "Sep 20,2023"),
      ShipmentModel(
          shipmentStatus: ShipmentStatus.cancelled,
          amount: 1400,
          title: "Arriving today!",
          message: "Your delivery #NEJ20089934122231 from Oshodi-Lagos is arriving today",
          date: "Sep 20,2023"),
      ShipmentModel(
          shipmentStatus: ShipmentStatus.cancelled,
          amount: 370,
          title: "Arriving today!",
          message: "Your delivery #NEJ20089934122231 from Oshodi-Lagos is arriving today",
          date: "Sep 20,2023"),
      ShipmentModel(
          shipmentStatus: ShipmentStatus.cancelled,
          amount: 3570,
          title: "Arriving today!",
          message: "Your delivery #NEJ20089934122231 from Oshodi-Lagos is arriving today",
          date: "Sep 20,2023"),
    ];
