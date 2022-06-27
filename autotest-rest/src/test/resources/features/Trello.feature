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

    Когда создать контекстные переменные
      | cKey   | 9b121c5e4d5c30149c1b413f531bfe9d                                                           |
      | cToken | a30fba37ee4edd90677db7bbad688f24a070c5e366f5d0ed4d11351708808f80                           |


# Создать доску "KanbanTool"
    * создать запрос
      | method | url                              | body             |
      | POST   | https://api.trello.com/1/boards/ | createBoard.json |
    * добавить query параметры
      | key   | ${cKey}   |
      | token | ${cToken} |
    * добавить header
      | Content-Type | application/json |
    * отправить запрос
#    * статус код 200
    * извлечь данные
      | id | $.id |
##########################################################################################
# Создать колонку "Backlog"

    * создать запрос
      | method | url                                         |
      | POST   | https://api.trello.com/1/boards/${id}/lists |
    * добавить query параметры
      | name  | Backlog   |
      | key   | ${cKey}   |
      | token | ${cToken} |
    * добавить header
      | Content-Type | application/json |
    * отправить запрос
#    * статус код 200
##########################################################################################
#  Добавить карточку в колонку Backlog с названием "Карточка для изучения API"

    * создать запрос
      | method | url                                         |
      | GET    | https://api.trello.com/1/boards/${id}/lists |
    * добавить query параметры
      | key   | ${cKey}   |
      | token | ${cToken} |
    * отправить запрос
    * извлечь данные
      | idList | $.[?(@.name=='Backlog')].id |
#    * статус код 200

    * создать запрос
      | method | url                            | body            |
      | POST   | https://api.trello.com/1/cards | createCard.json |
    * добавить query параметры
      | idList | ${idList} |
      | key    | ${cKey}   |
      | token  | ${cToken} |
    * добавить header
      | Content-Type | application/json |
    * отправить запрос
#    * статус код 200
##########################################################################################
#	Добавить вложение в виде любой фотографии

    * создать запрос
      | method | url                                         |
      | GET    | https://api.trello.com/1/boards/${id}/cards |
    * добавить query параметры
      | key   | ${cKey}   |
      | token | ${cToken} |
    * отправить запрос
    * извлечь данные
      | idCard | $.[?(@.name=='Карточка для изучения API')].id |
#    * статус код 200

#    * создать запрос
#      | method | url                                                  | body                |
#      | POST   | https://api.trello.com/1/cards/${idCard}/attachments | addAttachments.json |
#    * добавить query параметры
#      | key   | ${cKey}   |
#      | token | ${cToken} |
#    * добавить header
#      | Content-Type | application/json |
#    * отправить запрос
#    * статус код 200

    * создать запрос
      | method | url                                                  |
      | POST   | https://api.trello.com/1/cards/${idCard}/attachments |
    * добавить query параметры
      | key   | ${cKey}   |
      | token | ${cToken} |
    * добавить вложение
      | src/test/resources/files/URL.jpg |
    * добавить header
#      | Accept | application/json |
      | Content-Type | multipart/form-data |
    * отправить запрос
    * статус код 200
##########################################################################################
#  	Поставить срок выполнения на следующий день
#  	Добавить описание "Тут будет отмечаться прогресс обучения"

    * создать запрос
      | method | url                                      | body            |
      | PUT    | https://api.trello.com/1/cards/${idCard} | updateCard.json |
    * добавить query параметры
      | key   | ${cKey}   |
      | token | ${cToken} |
    * добавить header
      | Content-Type | application/json |
    * отправить запрос
    * статус код 200
##########################################################################################
#  Создать чек-лист с пунктами:

    * создать запрос
      | method | url                                 |
      | POST   | https://api.trello.com/1/checklists |
    * добавить query параметры
      | idCard | ${idCard} |
      | key    | ${cKey}   |
      | token  | ${cToken} |
    * добавить header
      | Content-Type | application/json |
    * отправить запрос
    * статус код 200


    * извлечь данные
      | idChecklists | $.id |
    * статус код 200

#  - Понять протокол HTTP

    * создать запрос
      | method | url                                                            |
      | POST   | https://api.trello.com/1/checklists/${idChecklists}/checkItems |
    * добавить query параметры
      | name  | Понять протокол HTTP |
      | key   | ${cKey}              |
      | token | ${cToken}            |
    * добавить header
      | Content-Type | application/json |
    * отправить запрос
    * статус код 200

    * извлечь данные
      | idCheckitemHttp | $.id |
    * статус код 200

#  - Выучить методы запросов

    * создать запрос
      | method | url                                                            |
      | POST   | https://api.trello.com/1/checklists/${idChecklists}/checkItems |
    * добавить query параметры
      | name  | Выучить методы запросов |
      | key   | ${cKey}                 |
      | token | ${cToken}               |
    * добавить header
      | Content-Type | application/json |
    * отправить запрос
    * статус код 200

    * извлечь данные
      | idCheckitemRequest | $.id |
    * статус код 200

##########################################################################################
# 	Отметить пункт в карточке "Понять протокол HTTP"

    * создать запрос
      | method | url                                                                                                | body                 |
      | PUT    | https://api.trello.com/1/cards/${idCard}/checklist/${idChecklists}/checkItem/${idCheckitemRequest} | updateCheckitem.json |
    * добавить query параметры
      | key   | ${cKey}   |
      | token | ${cToken} |
    * добавить header
      | Content-Type | application/json |
    * отправить запрос
    * статус код 200

##########################################################################################
# 	Создать колонку "Done"

    * создать запрос
      | method | url                                         |
      | POST   | https://api.trello.com/1/boards/${id}/lists |
    * добавить query параметры
      | name  | Done      |
      | key   | ${cKey}   |
      | token | ${cToken} |
    * добавить header
      | Content-Type | application/json |
    * отправить запрос
    * статус код 200

    * извлечь данные
      | idListDone | $.[?(@.name=='Done')].id |
    * статус код 200

##########################################################################################
# 	Переместить карточку в эту ("Done") колонку

    * создать запрос
      | method | url                                                   |
      | POST   | https://api.trello.com/1/lists/${idList}/moveAllCards |
    * добавить query параметры
      | idBoard | ${id}         |
      | idList  | ${idListDone} |
      | key     | ${cKey}       |
      | token   | ${cToken}     |
    * добавить header
      | Content-Type | application/json |
    * отправить запрос
    * статус код 200

##########################################################################################
# 		Архивировать колонку "Backlog"

    * создать запрос
      | method | url                                             |
      | PUT    | https://api.trello.com/1/lists/${idList}/closed |
    * добавить query параметры
      | value | true      |
      | key   | ${cKey}   |
      | token | ${cToken} |
    * добавить header
      | Content-Type | application/json |
    * отправить запрос
    * статус код 200

##########################################################################################
# 		Отметить пункт в карточке "Выучить методы запросов"

    * создать запрос
      | method | url                                                                                             | body                 |
      | PUT    | https://api.trello.com/1/cards/${idCard}/checklist/${idChecklists}/checkItem/${idCheckitemHttp} | updateCheckitem.json |
    * добавить query параметры
      | key   | ${cKey}   |
      | token | ${cToken} |
    * добавить header
      | Content-Type | application/json |
    * отправить запрос
    * статус код 200

##########################################################################################
# 		Поставить в карточке эмоджи Палец вверх

    * создать запрос
      | method | url                                                       |
      | POST   | https://api.trello.com/1/cards/${idCard}/actions/comments |
    * добавить query параметры
      | text  | :thumbsup: |
      | key   | ${cKey}    |
      | token | ${cToken}  |
    * добавить header
      | Content-Type | application/json |
    * отправить запрос
    * статус код 200
