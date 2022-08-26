{{ include ('header.php', {title: 'Connection'} ) }}

           
    <div class="wrapper">
        <div class="container">
            <h1>Authentification</h1>

            <form class="frm-login" method="POST" action="{{path}}login/authentification">

                {% if errors is defined %}       
                <div class="error-login"> {{ errors|raw }}</div>
                {% endif %}
            
                <input type="text" name="username" placeholder="Nom d'usager" value="{{ Usager.nomUsager }}"/><br>
                <input type="password" name="password" placeholder="Mot de passe" value="{{ Usager.mdp }}"/><br>
                
                <input class="btn-submit" type="submit" value="Login"/>
            </form>

        </div> 
    </div>
        
        
    
{{ include ('footer.php') }}