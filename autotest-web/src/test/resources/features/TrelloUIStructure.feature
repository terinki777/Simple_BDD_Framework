#language:ru
@trello_structure
Функционал: Поиск гугл

  Структура сценария: Проверка UI Trello
#  •	Удостовериться, что карточка находится в колонке Done
#  •	Удостовериться, все пункты чек-боксов выполнены
#  •	Поставить обложку с зеленым цветом
#  •	Отметить, что задача выполнена в срок
#  •	Сменить фон доски на зеленый цвет


    * открыть url "https://trello.com/login"
    * инициализация страницы "TrelloLogin"
    * ввести в поле "поле электронная почта" значение "terinkine@mail.ru"
    * на странице имеется элемент "кнопка войти с помощью Atlassian"
    * кликнуть на элемент "кнопка войти с помощью Atlassian"
    * на странице имеется элемент "поле пароль"
    * ввести в поле "поле пароль" значение "123456qwerty"
    * кликнуть на элемент "кнопка войти"
    
    * переход на страницу "ВАШИ РАБОЧИЕ ПРОСТРАНСТВА"
    * на странице имеется элемент "доска KanbanTool"
    * кликнуть на элемент "доска"

    * переход на страницу "открылась доска"


    * подождать 5 сек
  Примеры:
  |board|card|



#
#    * на странице отсутствует текст "погода в ижевске"
#
#    * на странице имеется элемент "кнопка поиска"
#    * кликнуть на элемент "кнопка поиска"
#    * переход на страницу "Google страница результатов"
#    * на странице имеется элемент "виджет погоды"