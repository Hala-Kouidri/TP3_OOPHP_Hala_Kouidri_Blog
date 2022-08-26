{{ include ('header.php', { title: 'Nouvel Article'} ) }}

        <h1>Nouvel Article</h1>
        
        <form class="form-article" method="POST" action="{{path}}Article/store">
        {% if errors is defined %}
            <span class="error">{{ errors|raw }}</span>
        {% endif %}

            <input type="text" id="titre" name="titre" placeholder="Titre" value="{{ Article.titre }}"/><br>
            <select name="idCategorie" id="idCategorie">
                {% for Categorie in categories %}
                    <option value="{{ Categorie.id }}" {% if Categorie.id==Article.idCategorie %} selected {% endif %}>{{ Categorie.nom }}</option>
                {% endfor %}
            </select>
            <textarea type="text" id="text" name="text" placeholder="Contenu">{{ Article.text }}</textarea><br>
            <input type="date" id="date" name="date" value="{{ Article.date }}"/>
            <!-- <input type="hidden" id="idAuteur" name="idAuteur" placeholder="NomUtilisateur" value="{{ Article.idAuteur }}"/> -->
            <input type="hidden" id="idAuteur" name="idAuteur" placeholder="NomUtilisateur" value="HalaKo"/>
            <input type="submit" value="Publier"/><br>
            
        </form>
    
{{ include ('footer.php') }} 