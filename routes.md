<!-- Homepage :               GET "/"/ => pages#home -->

<!-- Index :                  GET "/concerts" => concerts#index -->
<!--
New concert :            GET "/my_concerts/new" => my_concerts#new
Create concert :         POST "/my_concerts" => my_concerts#create
Edit concert :           GET "/my_concerts/:id/edit" => my_concerts#edit
Patch concert :          PATCH "/my_concerts/:id" => my_concerts#update
Duplicate :              POST "/my_concerts/:id/duplicate" => my_concerts#duplicate
Band Show concert :      GET "/my_concerts/:id" => my_concerts#show
Band concert index :     GET "/my_concerts" => my_concerts#index -->

<!-- New band :               GET "/bands/new" => bands#new
Create band :            POST "/bands" => bands#create
Band page show :         GET "/bands/:id" => bands#show
 -->
<!-- Location finder :        GET "/locations" => locations#index -->


<!-- Spectator Show concert : GET "/concerts/:id" => concerts#show -->
<!--
Profile settings :       GET "/profile" => profiles#show
Save settings :          PATCH "/profile" => profiles#update
 -->
<!-- Participate :            POST "/concerts/:concert_id/participations" => participations#create -->
<!-- My participations :      GET "/participations" => participations#index -->
