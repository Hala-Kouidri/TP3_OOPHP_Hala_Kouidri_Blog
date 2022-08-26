<?php

RequirePage::requireModel('CRUD');
RequirePage::requireModel('Usager');
RequirePage::requireModel('Privilege');
RequirePage::requireLibrary('Validation');


class ControllerUsager{



    // public function create(){

    //     $privileges = new ModelPrivilege;
    //     $select = $privileges->select('privilege');
        
    //     return Twig::render('user-create.php', ['privileges' => $select] );

    // }
    public function store(){

        $validation = new Validation;
        extract($_POST);

        $validation->name('nomUsager')->value($username)->pattern('email')->required()->max(45);
        $validation->name('mdp')->value($password)->pattern('alphanum')->required()->max(20)->min(5);
        
        if($validation->isSuccess()){

            $options = [
                'cost' => 10,
            ];

            $hashPassword = password_hash($password, PASSWORD_BCRYPT, $options);
            
              

            $user = new ModelUsager;
            $_POST['nomUsager'] = $username; 
            $_POST['password'] = $hashPassword; 
            $insert = $user->insert($_POST);


            RequirePage::redirect('user'); 

        }else{
           
           
            $errors = $validation->displayErrors();

         
            return Twig::render('user-create.php', ['errors'=> $errors, 'user' => $_POST]);


        }

      

    }

    
}

?>