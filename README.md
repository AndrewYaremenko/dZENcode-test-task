#  dZENcode-test-task

## Стек технологий
- Laravel v10.24.0
- Vite
- Vue3, vuex, Bootstrap5, DOMPurify
- MySQL

## Функционал:
- SPA приложение, создание пользователями комментариев, возможность отвечать на комментарии, сортировать их за параметрами, использовать определенные HTML теги

## REST API:

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