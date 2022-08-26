<?php

    class ModelUsager extends CRUD {
        protected $table = 'Usager';
        protected $primaryKey = 'nomUsager';

        // protected $fillable = ['nomUsager', 'mdp', 'courriel'];
        protected $fillable = ['nomUsager','mdp', 'courriel','temp_password', 'privilege_id'];

            
        public function checkUser($username, $password){

            $sql = "SELECT * FROM $this->table WHERE nomUsager = ? ";
            $stmt = $this->prepare($sql);
            $stmt->execute(array($username));

            $count = $stmt->rowCount();

            if ($count == 1){

                //récuperer la ligne qui correspond à l'username pour récuperer le mot de passe et le vérffier 

                $user_infos = $stmt->fetch();

                //echo $user_infos['password']. "=".$password;
                $dbPassword = $user_infos['mdp'];

                if(password_verify($password, $dbPassword)){

                    //création de session
                    session_regenerate_id();
                    $_SESSION['nomUsager'] = $user_infos['nomUsager'];
                    $_SESSION['privilege_id'] = $user_infos['privilege_id'];
                    $_SESSION['fingerPrint'] = md5($_SERVER['HTTP_USER_AGENT'] . $_SERVER['REMOTE_ADDR']);

                    RequirePage::redirect('Article/liste'); 
                }
                else{
                    return "Mot de passe invalide";
                }
            }
            else{
                    return "Nom d'utilisateur invalide"; 
            }


        }

    } 


?>