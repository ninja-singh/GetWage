class JobModel {
  String title;
  String description;
  String categories;
  String wage;
  List<String> images;
  String postedBy;
  String address;
  String postedByImage;
  JobModel({
    required this.title,
    required this.postedByImage,
    required this.description,
    required this.categories,
    required this.wage,
    required this.images,
    required this.postedBy,
    required this.address,
  });

  static List<JobModel> jobs = [
    JobModel(
      title: "Wanted a cleaner",
      description: "I need a cleaner to clean my house",
      categories: "cleaning",
      wage: "300-400",
      images: [
        "https://images.unsplash.com/photo-1580256081112-e49377338b7f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
        "https://images.unsplash.com/photo-1581578949510-fa7315c4c350?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
        "https://images.unsplash.com/photo-1603712725038-e9334ae8f39f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80"
      ],
      postedBy: "Yash Khurana",
      address: "80 Feet Road, H A L, 3rd Stage, Indiranagar",
      postedByImage:
          "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTN8fHBlb3BsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
    ),
    JobModel(
      title: "Concrete Mixing",
      description: "I need a concrete mixer labour to mix concrete, 3-4 people",
      categories: "construction",
      wage: "300-400",
      images: [
        "https://static.concretenetwork.com/photo-gallery/images/550x412Exact_0x4/site_26/mixing-concrete-wheelbarrow-shovel-shutterstock_98999.jpg",
        "https://i0.wp.com/theconstructor.org/wp-content/uploads/2017/10/hand-mixing-of-concrete.jpg?fit=650%2C386&ssl=1",
        "https://media.istockphoto.com/photos/bricklayer-and-concrete-mixer-picture-id184148621?k=20&m=184148621&s=612x612&w=0&h=s5GDfNuEAkjju8ary_HZyyFQV9-Nlcy0AZzCJy7T05I="
      ],
      postedBy: "Chameli Krishna",
      address: "Kadamwadi, M V Road, Bhnd Mukund Nagar,marol, J.b.nagar",
      postedByImage:
          "https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8cGVvcGxlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
    ),
    JobModel(
      title: "Carpenter",
      description: "carpenter needed to fix the furniture in the house",
      categories: "Carpenter",
      wage: "400-600",
      images: [
        "https://www.thebalancesmb.com/thmb/3zcgjdCDA5cVNoCLBrMrgJeqtdw=/3437x2578/smart/filters:no_upscale()/young-stylish-cabinet-maker-with--glasses-and-hairstyle--strong--handsome-craftsman-holding-saw-and-wood-blank-at-workplace-944613244-5af9afc2a18d9e003c17040c.jpg",
        "https://www.designingbuildings.co.uk/w/images/5/5e/Carpenter-carving-wood.jpg",
        "http://www.robertharding.com/watermark.php?type=preview&im=RM/RH/HORIZONTAL/817-233061"
      ],
      postedBy: "Vimala Wagle",
      address: "Rl, 76, Milap Nagar, Midc Residential Area, Dombivli(e)",
      postedByImage:
          "https://images.unsplash.com/photo-1517841905240-472988babdf9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8cGVvcGxlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
    ),
    JobModel(
      title: "Installing tiles",
      description: "I need a tile installer to install tiles in my house",
      categories: "Marble Work",
      wage: "600-800",
      images: [
        "https://4.imimg.com/data4/XP/NN/MY-23092226/marble-tiles-work-500x500.jpg",
        "https://www.thespruce.com/thmb/klUwUywBij9aG8z9rlHu4RH-ay4=/1280x854/filters:no_upscale()/removing-marble-floor-184849639-resized-56a2fd8d3df78cf7727b6d27.jpg",
        "https://www.rubi.com/us/blog/wp-content/uploads/2018/03/1420701275533.jpeg"
      ],
      postedBy: "Karna Jagarlamudi",
      address: "Kadamwadi, M V Road, Bhnd Mukund Nagar,marol, J.b.nagar",
      postedByImage:
          "https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
    ),
  ];
}
