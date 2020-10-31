# README

Step 1 : Run bundle install
     
     bundle install

Step 2 : Migrate and seed datbase with following code
     
     rails db:migrate
     rails db:seed
     
Step 3 : Run server with

    rails s
    
Step 4 : Create user with your email as devise sends confirmation token to your mail.

Step 5 : Add a movie with plus icon present on navbar.

Step 6 : Add Screen to the theatres from Movie show page.

Step 7 : Now You can buy ticket from Movie Show page. You can buy tickets only after assigning a screen to the movie.

Anytime a movie is created, the project sends a mail to every user's mail address.
When you buy a ticket, the project sends ticket to your mail address.
