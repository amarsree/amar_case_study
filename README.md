# amar_case_study

## prerequisite
> Php, Composer, Laravel installed
> Php version should be minimum 7.4

## Steps to Setup code
**Step 1** clone the Repo By running *git clone https://github.com/amarsree/amar_case_study.git* commend in Terminal
**Step 2** *cd amar_case_study*
**Step 3** *composer install* 
**Step 4** *cp .env.example .env*
**Step 5** change APP_URL, DB username, DB name, and password.
**Step 6** *php artisan key:generate*
**Step 6** *php artisan migrate:fresh --seed* or sql file is incluced in /database/sql path you can simply import
**Step 7** *php artisan serve* and open  http://127.0.0.1:8000 (port number my differ)  in you broswer 

## Api Documentation
Api Documentation can be found in /request-docs route http://127.0.0.1:8000/request-docs

## Testing
Can run all the testing with command  *php artisan test*