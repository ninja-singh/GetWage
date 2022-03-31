class SkillModel {
  String title;
  String imgUrl;
  String onTabUrl;
  SkillModel(
      {required this.title, required this.imgUrl, required this.onTabUrl});

  static List<SkillModel> skills = [
    SkillModel(
        title: "Learn Basic English",
        imgUrl:
            "https://www.englishexpress.com.sg/wp-content/uploads/2016/09/learn-english-effectively.jpg",
        onTabUrl: "https://www.youtube.com/watch?v=beyozG3VFUA"),
    SkillModel(
        title: "Basics of UPI",
        imgUrl:
            "https://images.fintra.co.in/cms/upi-unified-payments-interface.jpeg",
        onTabUrl: "https://www.youtube.com/watch?v=71buEzQcAt4"),
    SkillModel(
        title: "Basics of Finance",
        imgUrl:
            "https://cdn.corporatefinanceinstitute.com/assets/cash-money.jpg",
        onTabUrl: "https://www.youtube.com/watch?v=LLdKcFpHgM8"),
    SkillModel(
        title: "Road Safety",
        imgUrl:
            "https://images.hindustantimes.com/img/2021/11/16/1600x900/a5f7822e-46d2-11ec-8579-24eef716c065_1637063490067.jpg",
        onTabUrl: "https://youtu.be/UxvNvbh1zpk")
  ];
}
