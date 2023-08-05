class SearchModel {
  final String title;
  final String id;
  final String from;
  final String to;

  SearchModel({required this.title, required this.id, required this.from, required this.to});
}

List<SearchModel> searchItems = [
  SearchModel(
      title: "Macbook pro M2 16gb Ram", id: "#NEJ20089934122231", from: "Oshodi", to: "Gbagada"),
  SearchModel(
      title: "Macbook pro M2 16gb Ram", id: "#NEJ20089934122231", from: "Oshodi", to: "Gbagada"),
  SearchModel(
      title: "Summer linen jacket pro M2", id: "#NEJ200899341445689", from: "Owerri", to: "Aba"),
  SearchModel(
      title: "Black Tapered-fit jeans AW", id: "#NEJ20089930023456", from: "Onitsha", to: "Enugu"),
  SearchModel(
      title: "Green Tapered-fit jeans AW", id: "#NEJ20089939293345", from: "Aba", to: "Delta"),
  SearchModel(
      title: "Office setup desk utils", id: "#NEJ2008993132210", from: "Okota", to: "Ikorodu"),
];
