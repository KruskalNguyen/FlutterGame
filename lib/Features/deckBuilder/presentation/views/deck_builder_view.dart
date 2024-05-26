import 'package:drainblood/features/deckBuilder/presentation/widgets/cards/card_info_popup.dart';
import 'package:drainblood/features/deckBuilder/presentation/widgets/cards/card_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DeckBuilderView extends StatefulWidget {
  const DeckBuilderView({super.key});

  @override
  State<DeckBuilderView> createState() => _DeckBuilderViewState();
}

class _DeckBuilderViewState extends State<DeckBuilderView> {
  @override
  Widget build(BuildContext context) {
    double heightWidget = MediaQuery.of(context).size.height;
    double widthWidget = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Center(
          child: Text(
            'Deck Builder',
            style: TextStyle(color: Colors.white),
          ),
        ),
        leading: IconButton(
          icon: const Image(
            image: AssetImage("assets/images/button/back-icon.png"),
            height: kToolbarHeight * 0.8,
            width: kToolbarHeight * 0.8,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/homepage/bg_deck_builder.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: kToolbarHeight,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: (MediaQuery.of(context).size.height * 0.01),
                  right: (MediaQuery.of(context).size.height * 0.01),
                  top: (MediaQuery.of(context).size.height * 0.02),
                  bottom: (MediaQuery.of(context).size.height * 0.01)),
              child: Container(
                width: widthWidget * 0.5,
                height: heightWidget * 0.3,
                margin: EdgeInsets.symmetric(
                    horizontal: (MediaQuery.of(context).size.width * 0.02)),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/border/red_border.9.png'),
                    centerSlice: Rect.fromLTRB(22, 22, 23, 23),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Center(
                    child: Padding(
                  padding: EdgeInsets.only(
                      top: (MediaQuery.of(context).size.height * 0.012),
                      bottom: (MediaQuery.of(context).size.height * 0.012)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => showCardInfo(
                            context: context,
                            cardDecription: 'This is card Decription',
                            linkImage: 'assets/cards/where_you_go.png',
                            linkBorder: 'assets/border/white_border_2.9.png',
                            linkTemplate:
                                'assets/cards/template/white_template.png',
                            cardName: 'Where you go',
                            rarity: 'Common',
                            cost: '1'),
                        child: CardUI(
                          linkImage: 'assets/cards/where_you_go.png',
                          linkBorder: 'assets/border/white_border_2.9.png',
                          linkTemplate:
                              'assets/cards/template/white_template.png',
                        ),
                      ),
                      CardUI(
                        linkImage: 'assets/cards/wonder_windy.png',
                        linkBorder: 'assets/border/purple_border.9.png',
                        linkTemplate:
                            'assets/cards/template/purple_template.png',
                      ),
                      CardUI(
                        linkImage: 'assets/cards/wonder_windy.png',
                        linkBorder: 'assets/border/red_border.9.png',
                        linkTemplate: 'assets/cards/template/red_template.png',
                      ),
                      CardUI(
                        linkImage: 'assets/cards/wonder_windy.png',
                        linkBorder: 'assets/border/gold_border.9.png',
                        linkTemplate: 'assets/cards/template/gold_template.png',
                      ),
                      CardUI(),
                    ],
                  ),
                )),
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    width: widthWidget * 0.7,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image:
                              AssetImage('assets/border/yellow_border.9.png'),
                          centerSlice: Rect.fromLTRB(22, 22, 23, 23),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Container(
                        padding: EdgeInsets.only(
                            left: (MediaQuery.of(context).size.width * 0.01),
                            right: (MediaQuery.of(context).size.width * 0.01),
                            top: (MediaQuery.of(context).size.width * 0.01),
                            bottom: (MediaQuery.of(context).size.width * 0.01)),
                        child: GridView.builder(
                          padding: EdgeInsets.zero,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 6,
                            childAspectRatio: 1087 / 1535,
                          ),
                          itemCount: 30,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () => showCardInfo(
                                  context: context,
                                  cardDecription: 'This is card Decription',
                                  linkImage: 'assets/cards/wonder_windy.png',
                                  linkBorder:
                                      'assets/border/purple_border.9.png',
                                  linkTemplate:
                                      'assets/cards/template/purple_template.png',
                                  cardName: 'Wonder windy',
                                  rarity: 'Epic',
                                  cost: '1'),
                              child: const CardUI(
                                linkImage: 'assets/cards/wonder_windy.png',
                                linkBorder: 'assets/border/purple_border.9.png',
                                linkTemplate:
                                    'assets/cards/template/purple_template.png',
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: widthWidget * 0.3,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image:
                              AssetImage('assets/border/yellow_border.9.png'),
                          centerSlice: Rect.fromLTRB(21, 21, 22, 22),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Này là Filer nè',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: heightWidget * 0.008,
            )
          ],
        ),
      ),
    );
  }
}

void showCardInfo({
  required BuildContext context,
  required String linkImage,
  required String linkBorder,
  required String linkTemplate,
  required String cardDecription,
  required String cardName,
  required String rarity,
  required String cost,
}) {
  showDialog(
      context: context,
      builder: (context) => CardInfoPopUp(
            linkImage: linkImage,
            linkBorder: linkBorder,
            linkTemplate: linkTemplate,
            cardDecription: cardDecription,
            cardName: cardName,
            rarity: rarity,
            cost: cost,
          ));
}
