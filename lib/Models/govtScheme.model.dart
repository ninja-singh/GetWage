class GovtSchemeModel {
  String title;
  String url;
  String desc;
  GovtSchemeModel({required this.desc, required this.title, required this.url});
  static List<GovtSchemeModel> schemes = [
    GovtSchemeModel(
        title: "MGNREGA",
        desc:
            "Any applicant is entitled to work within 15 days, for as many as he/she has applied, subject to a limit of 100 days per household per year.",
        url: "https://nrega.nic.in/Nregahome/MGNREGA_new/Nrega_home.aspx"),
    GovtSchemeModel(
        title: "Deen Dayal Upadhyay – Gramin Kaushalya Yojana (DDU-GKY)",
        desc:
            "Deen Dayal Upadhyaya Grameen Kaushalya Yojana (DDU-GKY) aims to skill rural youth who are poor and provide them with jobs having regular monthly wages or above the minimum wages",
        url: "http://ddugky.gov.in/"),
    GovtSchemeModel(
        title: "Garib Kalyan Rozgar Yojana",
        desc:
            "The scheme will give employment for one hundred and twenty-five days",
        url: "https://panchayat.gov.in/garib-kalyan-rojgar-abhiyaan"),
    GovtSchemeModel(
        title: "PM SVANidhi",
        desc: "To facilitate working capital loan up to 10,000",
        url:
            "https://www.india.gov.in/spotlight/pm-street-vendors-atmanirbhar-nidhi-pm-svanidhi")
  ];
}
