<?php

RequirePage::requireModel('CRUD');
RequirePage::requireModel('Usager');
RequirePage::requireLibrary('Validation');

class ControllerLogin{

    public function index(){

        return Twig::render('login-index.php');
    }

    public function authentification(){

        extract($_POST);
        $user = new ModelUsager();
        $checkuser = $user->checkUser($username, $password);

        return Twig::render('login-index.php', ['errors'=> $checkuser]);

    }

    public function logout(){

        //logout
        session_destroy();

        RequirePage::redirect('login'); 
        

    }
}

?>