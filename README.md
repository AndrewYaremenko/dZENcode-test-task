#  dZENcode-test-task

## Стек технологий
- Laravel v10.24.0
- Vite
- Vue3, vuex, Bootstrap5, DOMPurify
- MySQL

## Функционал
- SPA приложение, создание пользователями комментариев, возможность отвечать на комментарии, сортировать их за параметрами, использовать определенные HTML теги

## API:

#### Comments
**GET /api/comments** - CommentController:index<br>
**POST /api/comments** - CommentController:store
```
{
    "name": required|string,
    "email": required|email,
    "homepage": nullable|url,
    "content": required|string,
    "parent_id": nullable|integer
}
```

## Установка с Docker

- Загрузите репозиторий с помощью команды ```git clone https://github.com/AndrewYaremenko/dZENcode-test-task.git```
- Перейдите в директорию проекта: ```cd dZENcode-test-task```
- Установите необходимые PHP библиотеки, выполнив команду: ```composer install```
- Установите необходимые NPM библиотеки, выполнив команду: ```npm install```
- Получить билд vite: ```npm run build```
- Скопируйте файл ```.env.docker``` и переименуйте его в ```.env```
- Сгенерируйте ключ приложения, выполнив команду: ```php artisan key:generate```
- Запустить приложение: ```docker-compose up -d```
- Открыть терминал контейнера: ```docker exec -it project_app bash```
- Выполните миграцию таблиц в БД с помощью команды: ```php artisan migrate```