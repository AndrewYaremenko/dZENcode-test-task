<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>dZENcode SPA</title>
    @vite('resources/sass/app.scss')
</head>

<body>
    <div id="app"></div>
    @vite('resources/js/app.js')
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</body>

</html>
