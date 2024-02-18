class OnBoarding{
  final String image;
  final String text;
  final String subText;
  final String textAnotherColor;
  final String textFirstColor;

  const OnBoarding({
    required this.image,
    required this.text,
    required this.subText,
    required this.textAnotherColor,
    required this.textFirstColor
  });
}

List<OnBoarding> itemOnBoarding = [
  const OnBoarding(image: ('assets/image/Global-News.png'), text: ('Welcome to '), subText: ('Global News App '), textAnotherColor: 'global News ', textFirstColor: 'App'),
  const OnBoarding(image: ('assets/image/world_logo.png'), text: ('Here you can browse more than '), textAnotherColor: 'one type of news for different countries', textFirstColor: '',subText: ('Immediately join us and start applying for the job you are interested in.'),),
  const OnBoarding(image: ('assets/image/logo-no-background.png'), text: ('All this in one place to save your time and effort, '), textAnotherColor: 'then what are you waiting for?', textFirstColor: '',subText: ('The better the skills you have, the greater the good job opportunities for you.'),),

];
