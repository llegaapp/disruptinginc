class Constant {

  static const json = 'application/json';
  static const file = 'multipart/form-data';
  static const baseUrl = 'https://fakestoreapi.com';
  static const products = '/products';
  static const profile = '/users/10';
  static const log = '/auth/login';

  static const applicationName = 'Alubian APP';
  static const dummyImage = 'https://via.placeholder.com/120';

  static const images = 'assets/images';
  static const translationsPath = 'assets/translations';

  static const image1 = '$images/image_1.png';
  static const image2 = '$images/image_2.png';
  static const image3 = '$images/image_3.png';
  static const successImage = '$images/success_image.png';
  static const profileImage = '$images/profile_image.png';

  static const animSplash = 'assets/animations/splash.json';
  static const animDone = 'assets/animations/done.json';
  static const animRemoved = 'assets/animations/removed.json';

  static const loremIpsum1 =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque gravida finibus lacus, ac mollis sem lacinia sed. Curabitur non mauris eget risus posuere congue. Cras lacinia lectus et arcu rhoncus, mattis ullamcorper nunc sollicitudin.';

}
enum ReqTypes {
  get,
  post,
  put,
  delete,
  patch,
}
enum AppTheme { light, dark }