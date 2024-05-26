class CardUI {
  CardUI(
      {required this.cardType,
      required this.cardName,
      required this.description,
      required this.linkImage});

  final String cardType;
  final String cardName;
  final String description;
  final String linkImage;

  void UIcard() {
    switch (cardType) {
      case ('Common'):
        {
          String linkBorder = '/assets/border/white_border.9.png';
          String linkTemplate = '/assets/cards/teamplate/white_teamplate.png';
          break;
        }
      case ('Epic'):
        {
          String linkBorder = '/assets/border/purple_border.9.png';
          String linkTemplate = '/assets/cards/teamplate/purple_teamplate.png';
          break;
        }
      case ('Heroic'):
        {
          String linkBorder = '/assets/border/gold_border.9.png';
          String linkTemplate = '/assets/cards/teamplate/red_teamplate.png';
          break;
        }
      case ('Legendary'):
        {
          String linkBorder = '/assets/border/yellow_border.9.png';
          String linkTemplate = '/assets/cards/teamplate/gold_teamplate.png';
          break;
        }
    }
  }
}
