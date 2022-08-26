{{ include ('header.php', { title: 'Modifier Article'} ) }}


<!-- Façon que j'ai trouvé afin d'Empécher un utilisateur de privilège 1 de modifier un article qui n'es pas le sien -->
{% if session.nomUsager == Article.idAuteur %}
    
    <h1>Modification d'article</h1>

    <form class="form-article" method="POST" action="{{path}}Article/update">

        <!-- ajouter le si errors is defined -->
        {% if errors is defined %}
            <span class="error">{{ errors|raw }}</span>
        {% endif %}
        

        <input type="text" name="titre" placeholder="Titre" value="{{ Article.titre }}"/><br>
        <select name="idCategorie" id="idCategorie">
            {% for Categorie in categories %}
                <option value="{{ Categorie.id }}" {% if Categorie.id==Article.idCategorie %} selected {% endif %}>{{ Categorie.nom }}</option>
            {% endfor %}
        </select>
        <textarea type="text" name="text" placeholder="Contenu">{{ Article.text }}</textarea><br>
        <input type="hidden" name="date" value="{{ Article.date }}"/>
        <input type="hidden" name="idAuteur" value="{{ Article.idAuteur }}"/>
        <input type="hidden" name="id" value="{{ Article.id }}"/>
        <input type="submit" value="Sauvegarder"/>
    </form>
{% else %}
    <div class="p-medium">
        <h1>Oups ! Il semblerais que vous vous êtes trompé de chemin ...</h1><br>
        <a class="home-btn" href='{{path}}Article/liste'>Retourner</a>
    </div>
 
{% endif %}


{{ include ('footer.php') }}  