{{ include ('header.php', { title: 'Articles'} ) }}

    <h2>Articles</h2>
    <div class="flex">  

        
        <div class='container__article'>
        
            {% for Article in Articles %}
                <div class='article__titre'>{{ Article.titre }}</div>
                <div class='article__texte'>{{ Article.text }}</div>
                <div class='article__auteur' 
                {% for Categorie in categories %} 
                    {% if Categorie.id==Article.idCategorie %}>
                        Catégorie : {{ Categorie.nom }}
                    {% endif %}
                {% endfor %}</div>
                <div class='article__auteur'>Auteur : {{ Article.idAuteur }}</div>
                <div class='article__auteur'>{{ Article.date }}</div>

                <!-- Boutons Modification et suppression d'articles - accessible seulement pour les "auteurs" pour leur articles seulement -->
                {% if  session.privilege_id == 1 and session.nomUsager == Article.idAuteur %}
                <div class='Modif-supprime'>
                    <a class='btn' href='{{path}}Article/edit/{{Article.id}}'> Modifier</a>
                    <!-- <a class='btn' href='{{path}}Article/delete/{{Article.id}}'>Supprimer </a> -->
                    
                    <form class="form-delete" action="{{path}}Article/delete" method="post">
                    <input type="hidden" name="id" value="{{ Article.id }}"> 
                    <input class='btn' type="submit" value="Supprimer">  
                    </form>

                </div>
                {% endif %}
            {% endfor %}    
        </div>
        
    </div>
    
{{ include ('footer.php') }} 