import 'package:web_store/dictionary/dictionary_clases/auth_dictionary.dart';
import 'package:web_store/dictionary/dictionary_clases/cart_dictionary.dart';
import 'package:web_store/dictionary/dictionary_clases/item_dictionary.dart';
import 'package:web_store/dictionary/dictionary_clases/main_dictionary.dart';
import 'package:web_store/dictionary/dictionary_clases/popup_dictionary.dart';
import 'package:web_store/dictionary/dictionary_clases/settings_dictionary.dart';
import 'package:web_store/dictionary/dictionary_models/language.dart';

const Language ru = Language(
  authDictionary: AuthDictionary(
    confirm: 'Подтвердить пароль',
    password: 'Пароль',
    forgot: 'Забыли свой пароль?',
    login: 'Войти',
    signGoogle: 'Войти через Google',
    show: 'Показать',
    signIn: 'Войти',
    signUp: 'Регистрация',
    hide: 'Скрыть',
    email: 'Эл. почта',
    helperEmail: 'Емейл введен некорректно',
    helperPassword: 'Вы ввели разные пароли',
    counterText: 'Не менее 6 символов без пробелов',
  ),
  cartDictionary: CartDictionary(),
  itemDictionary: ItemDictionary(),
  mainDictionary: MainDictionary(
    search: 'Поиск',
  ),
  popUpDictionary: PopUpDictionary(   show: 'Показать',
      password: 'Пароль',
      confirm: 'Подтвердить пароль',
      code: 'Код',
      no: 'Нет',
      loading: 'Загружается ...',
      ok: 'Ок',
      send: 'Отправить',
      addedToFavorite: 'Этот рецепт добавлен в избранные',
      clearIngredients: 'Очистить выбраные ингридиенты?',
      willBeRemoved: 'Вы хотите удалить этот рецепт?',
      serverBug: 'Чёто не так с сервером, ждите...',
      textEntNewPass: 'Введите новый пароль',
      textEnterEmail: 'Введите ваш email',
      textNewVersionBody: 'Разнообразный и богатый опыт дальнейшее развитие различных форм '
          'деятельности играет важную роль в формировании дальнейших направлений развития.',
      textNewCollectionTitle: 'Пщступила новая коллекция \u{01F680}',
      // \u{01F680} 🚀
      textSureTitle: 'Вы уверены , в том что хотите закрыть приложение ',
      textSwipeTutorial: 'Вы можете удалить продукт свайпом\nвлево или вправо',
      textVerificationCode: 'Мы отправили код вам на почту. Введите код.',
      yes: 'Да',
      success: 'Успех',
      noInternetConnection: 'Нет соединения с интернетом',
      wrongPassword: 'Неверный пароль или адрес электронной почты',
      wrongEmail: 'Этот адрес электронной почты уже зарегистрирован',
      wasRemovedFromFavorite: 'Рецепт удален из избранного',
      emailNotFound: 'Почта не найдена',
      codeNotFound: 'Код не найден',
      save: 'Сохранить',
      passwordMissMatch: 'Пароли не совпадают!',
      hide: 'Скрыть',
      email: 'Эл.почта',
      badPassword: 'Минимум 6 символов, без пробела'),
  settingsDictionary: SettingsDictionary(),
);
