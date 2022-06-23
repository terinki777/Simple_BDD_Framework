#language:ru
@test4

Функционал: Trello API
  • Создать доску "KanbanTool"
  • Создать колонку "Backlog"
  • Добавить карточку в колонку Backlog с названием "Карточка для изучения API"
  • Добавить вложение в виде любой фотографии
  • Поставить срок выполнения на следующий день
  • Добавить описание "Тут будет отмечаться прогресс обучения"
  • Создать чек-лист с пунктами:
  - Понять протокол HTTP
  - Выучить методы запросов
  • Отметить пункт в карточке "Понять протокол HTTP"
  • Создать колонку "Done"
  • Переместить карточку в эту колонку
  • Архивировать колонку "Backlog"
  • Отметить пункт в карточке "Выучить методы запросов"
  • Поставить в карточке эмоджи Палец вверх

  Сценарий: Выполнение запросов в Trello
# Создать доску "KanbanTool"
    * создать запрос
      | method | url                              | body             |
      | POST   | https://api.trello.com/1/boards/ | createBoard.json |
    * добавить query параметры
      | key   | 9b121c5e4d5c30149c1b413f531bfe9d                                 |
      | token | a30fba37ee4edd90677db7bbad688f24a070c5e366f5d0ed4d11351708808f80 |
    * добавить header
      | Content-Type | application/json |
    * отправить запрос
    * статус код 200
    * извлечь данные
      | id | $.id |

# Создать колонку "Backlog"
    * создать запрос
      | method | url                            |
      | POST   | https://api.trello.com/1/lists |
    * добавить query параметры
      | idBoard | ${id}                                                           |
      | name    | Backlog                                                          |
      | key     | 9b121c5e4d5c30149c1b413f531bfe9d                                 |
      | token   | a30fba37ee4edd90677db7bbad688f24a070c5e366f5d0ed4d11351708808f80 |
#    * добавить header
#      | Accept | application/vnd.github.v3+json |
    * отправить запрос
    * статус код 200

#  # удалить доску
#        * создать запрос
#      | method | url                                  | body             |
#      | DELETE   | https://api.trello.com/1/boards/${id} | createBoard.json |
#    * добавить query параметры
#      | key   | 9b121c5e4d5c30149c1b413f531bfe9d                                 |
#      | token | a30fba37ee4edd90677db7bbad688f24a070c5e366f5d0ed4d11351708808f80 |
#    * добавить header
#      | Content-Type | application/json |
#    * отправить запрос
#    * статус код 200

#    * создать запрос
#      | method | url                              |
#      | GET   | https://api.trello.com/1/boards/${id}/cards|
#    * добавить query параметры
#      | key   | 9b121c5e4d5c30149c1b413f531bfe9d                                 |
#      | token | a30fba37ee4edd90677db7bbad688f24a070c5e366f5d0ed4d11351708808f80 |
##    * добавить header
##      | Content-Type | application/json |
#    * отправить запрос
#    * статус код 200
#    * извлечь данные
#      | idList | $.[?(@.idBoard=='${id}')].idList |