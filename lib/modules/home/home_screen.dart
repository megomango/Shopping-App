import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../shared/language_provider/language_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;
  int _currentPage = 0;

  List<String> featuredImages = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIN5ysRGU3JZ2_BEOp0WCWz1LgqnOIGhi08cCa4DvZt5jg4wXYHHoIJBYqjLNB6m6OFY8&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTy3XQgDAmh5XpxkgymLCuBcNmJgqlorArMQw&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-FFpCNqW8LitlBUwlVaRkOBp1E8BRJNSVRenXCTxmLV9QqRBTC_YnQLTRZxn9bI6he54&usqp=CAU',
  ];

  List<Map<String, String>> products = [
    {
      "title": "MacBook 16 Pro",
      "price": "\$2,399",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQB_JnI62ujjWAs78xEZA1xvGTtrR862q5YQ&s",
    },
    {
      "title": "Wireless Headphones",
      "price": "\$299",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRguHRXEN_sYi1rmkCZJsSgoAxE9s-B8d7oXA&s",
    },
    {
      "title": "Smart Watch",
      "price": "\$399",
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRu5ThJ0GRi3IVeLtr_nM3KIO2qwIhA_Pj4rA&s",
    },
    {
      "title": "Premium Keyboard",
      "price": "\$199",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTVh3glZWnaWF4UWAE-bFtytBSdHfhcqBWD-g&s",
    },
    {
      "title": "Designer Backpack",
      "price": "\$129",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2CayRXp75syzY9pXYjPwrgppGWFPPJaW35Q&s",
    },
    {
      "title": "Wireless Mouse",
      "price": "\$79",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5lEKQ2MKm4VOH9Btu42t474mcrZDukxqGnQ&s",
    },
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.85);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final List<Map<String, String>> offers = [
      {
        "title": loc!.offer1_title,
        "subtitle": loc.offer1_subtitle,
        "label": loc.offer1_label,

      },
      {
        "title": loc.offer2_title,
        "subtitle": loc.offer2_subtitle,
        "label": loc.offer2_label,
      },
      {
        "title": loc.offer3_title,
        "subtitle": loc.offer3_subtitle,
        "label": loc.offer3_label,
      },
      {
        "title": loc.offer4_title,
        "subtitle": loc.offer4_subtitle,
        "label": loc.offer4_label,
      },
      {
        "title": loc.offer5_title,
        "subtitle": loc.offer5_subtitle,
        "label": loc.offer5_label,
      },
    ];
    final List<String> featuredTitles = [
      loc.featured_title_1,
      loc.featured_title_2,
      loc.featured_title_3,
    ];
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          loc.productsNum,
          style: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () {
              Provider.of<LanguageProvider>(context, listen: false).toggleLocale();
            },
          ),
        ],
        backgroundColor: Colors.purple,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
           Center(
            child: Text(
              loc.featuredProducts,
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Column(
            children: [
              SizedBox(
                height: 240,
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    PageView.builder(
                      itemCount: featuredImages.length,
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() => _currentPage = index);
                      },
                      itemBuilder: (context, index) {
                        bool isActive = index == _currentPage;
                        double scale = isActive ? 1.0 : 0.9;

                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          transform: Matrix4.identity()..scale(scale),
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            image: DecorationImage(
                              image: NetworkImage(featuredImages[index]),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Container(
                            alignment: Alignment.bottomLeft,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Colors.black.withOpacity(0.6),
                                  Colors.transparent,
                                ],
                              ),
                            ),
                            child: Text(
                              index < featuredTitles.length
                                  ? featuredTitles[index]
                                  : '',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      },
                    ),

                    Positioned(
                      left: 8,
                      child: CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.grey,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 14),
                          onPressed: () {
                            if (_currentPage > 0) {
                              _pageController.previousPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            }
                          },
                        ),
                      ),
                    ),

                    Positioned(
                      right: 8,
                      child: CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.grey,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 14),
                          onPressed: () {
                            if (_currentPage < featuredImages.length - 1) {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  featuredImages.length,
                      (index) => Container(
                    width: 10,
                    height: 10,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentPage == index
                          ? Colors.purple
                          : Colors.grey[400],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          ListView.builder(
            itemCount: products.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final product = products[index];
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 6,
                margin: const EdgeInsets.symmetric(vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(16),
                          ),
                          child: Image.network(
                            product["image"]!,
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: 12,
                          right: 12,
                          child: CircleAvatar(
                            backgroundColor: Colors.purple,
                            child: IconButton(
                              icon: const Icon(
                                Icons.shopping_cart_outlined,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      "${product["title"]} added to the cart",
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product["title"]!,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            product["price"]!,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.purple,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),

          const SizedBox(height: 24),

          Center(
            child: Text(
              loc.hotOffers,
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 16),

          ...offers.map((offer) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            offer['title']!,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            offer['subtitle']!,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 16,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: const LinearGradient(
                          colors: [Colors.purple, Colors.pink],
                        ),
                      ),
                      child: Text(
                        offer['label']!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
