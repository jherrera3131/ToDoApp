============================================================
  TaskMaster - Rails ToDo Application
  Final Project
============================================================

TEAM MEMBERS
------------
- Jairon Herrera

------------------------------------------------------------
PROJECT OVERVIEW
------------------------------------------------------------
TaskMaster is a full-featured, authenticated ToDo application
built with Ruby on Rails. Users can sign up, create categories
to organize their tasks, and manage ToDo items with priority
and completion status tracking.

------------------------------------------------------------
FEATURES
------------------------------------------------------------
- Custom user accounts (first name, last name, username, email)
- Full CRUD for Categories (each user owns their own)
- Full CRUD for ToDos with:
    * Priority flag (visual red highlight)
    * Completed flag (visual green highlight + strikethrough)
    * One-to-many relationship with Categories
- Three permanent navbar links: ToDos, Categories, Completed ToDos
- Users can only view and manage their own data
- Deleting an account cascades and removes all associated data
- Bootstrap 5 responsive design with Bootstrap Icons
- Custom CSS for priority/completed visual states
- Welcome landing page for unauthenticated visitors
- Dashboard with task summary stats for logged-in users

------------------------------------------------------------
TECH STACK & PACKAGES
------------------------------------------------------------
- Ruby 3.4.7
- Rails 8.1.3
- SQLite3 (development/test)
- PostgreSQL (production, via pg gem)
- Bootstrap 5.3.8  (gem 'bootstrap')
- SassC Rails       (gem 'sassc-rails')
- jQuery Rails      (gem 'jquery-rails')
- Bootstrap Icons   (gem 'bootstrap-icons-helper')
- bcrypt 3.1.7      (gem 'bcrypt') - password hashing
- Hotwire (Turbo + Stimulus)

------------------------------------------------------------
INSTALLATION & SETUP
------------------------------------------------------------
1. Make sure Ruby 3.4.7 is installed.
   Check with: ruby -v

2. Install dependencies:
   bundle install

3. Set up the database and run migrations:
   bin/rails db:create db:migrate

4. Start the development server:
   bin/rails server

5. Visit http://localhost:3000 in your browser.

------------------------------------------------------------
RUNNING TESTS
------------------------------------------------------------
bin/rails test

------------------------------------------------------------
SPECIAL NOTES
------------------------------------------------------------
- The Gemfile specifies ruby "3.4.7". If you have a different
  minor version, update line 3 of Gemfile accordingly.
- All user data is scoped to the logged-in user. There is no
  admin view of other users' ToDos or Categories.
- Deleting a Category will cascade-delete all its associated
  ToDo items (via dependent: :destroy in the model).
- Deleting a User account will cascade-delete all their
  Categories and ToDos.

============================================================
