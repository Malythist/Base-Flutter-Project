import 'failure.dart';
import 'ui_exception.dart';

extension FailureUi on Failure {
  UiException toUiException() {
    return when(
      network: (message) => const UiException(
        title: 'Ошибка сети',
        description: 'Проверь подключение к интернету и попробуй снова.',
      ),
      unauthorized: (message) => const UiException(
        title: 'Нет доступа',
        description: 'Похоже, у тебя нет прав. Попробуй войти заново.',
      ),
      server: (message, code) {
        if (code == 404) {
          return const UiException(
            code: 404,
            title: 'Ошибка 404',
            description: 'Метод не найден, повторите попытку позже.',
          );
        }

        return UiException(
          code: code,
          title: code == null ? 'Ошибка' : 'Ошибка $code',
          description: message.isNotEmpty
              ? '$message. Повторите попытку позже.'
              : 'Что-то пошло не так, повторите попытку позже.',
        );
      },
      unknown: (message) => UiException(
        title: 'Неизвестная ошибка',
        description: 'Что-то пошло не так, повторите попытку позже.',
      ),
    );
  }
}
