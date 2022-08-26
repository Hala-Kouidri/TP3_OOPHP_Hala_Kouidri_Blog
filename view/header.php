<!DOCTYPE html>
<html>
    <head>
        <meta charset='utf-8'>
        <meta name="author" content="Hala Kouidri - 1353390" >
        <title>{{ title }}</title>
        <link rel="stylesheet" href="{{path}}styles/style.css">
    </head>
    <body>
    <header class="header">
        <div class="header__logo">
            <a class="logo" href="{{path}}Article/liste">Prog & Lifestyle</a>
        </div>

        {% if guest %}
        <!-- btn - login -->
        <div class="header__btns">

            <a class='btn-log' href='{{path}}login'>Login</a>
        
        </div>
        {% else %}
        <!-- btn - logout / ajout article -->
        <div class="header__btns">

            {% if session.privilege_id == 1 %}
                <a class='btn' href="{{path}}Article/create">Ajouter un Article</a>
            {% endif %}
            
            <p>{{ session.nomUsager }}</p>
            <a class='btn-log' href='{{path}}login/logout'>Logout</a>
        
        </div>
        {% endif %}
    </header>

    <main>

        {% if errors is defined %}       
            <span class="error"> {{ errors|raw }}</span>
        {% endif %}