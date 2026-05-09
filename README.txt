------------------------------------------------------------
ToDo - Rails ToDo Application
Final Project

GITHUB LINK: https://github.com/jherrera3131/ToDoApp



TEAM MEMBERS
------------
- Jairon Herrera
- Gavin Mpbiana
------------------------------------------------------------
PROJECT OVERVIEW

ToDo is a full-featured, authenticated ToDo application
built with Ruby on Rails. Users can sign up, create categories
to organize their tasks, and manage ToDo items with priority
and completion status tracking.

------------------------------------------------------------
FEATURES
- Custom user accounts
- Full CRUD for Categories (each user owns their own)
- Full CRUD for ToDos with:
    - Priority flag (visual red highlight)
    - Completed flag (visual green highlight + strikethrough)
    - One-to-many relationship with Categories
- Three permanent navbar links: ToDos, Categories, Completed ToDos
- Users can only view and manage their own data
- Deleting an account cascades and removes all associated data


------------------------------------------------------------
INSTALLATION & SETUP


1. Make sure Ruby 3.4.7 is installed.
   Check with: ruby -v

2. Install dependencies:
   bundle install

3. Start the development server:
   bin/rails server

4. Visit http://localhost:3000 in your browser.